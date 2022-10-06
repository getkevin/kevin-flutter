import 'package:collection/collection.dart';
import 'package:domain/country/model/country.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_bottom_dialog.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_item.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_progress_indicator.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_snack_bar.dart';
import 'package:kevin_flutter_example/country/country_selection/bloc/country_selection_bloc.dart';
import 'package:kevin_flutter_example/country/country_selection/bloc/country_selection_event.dart';
import 'package:kevin_flutter_example/country/country_selection/bloc/country_selection_state.dart';
import 'package:kevin_flutter_example/country/country_selection/model/country_item.dart';
import 'package:kevin_flutter_example/error/api_error_mapper.dart';
import 'package:kevin_flutter_example/generated/locale_keys.g.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class CountrySelectionBottomDialog extends StatefulWidget {
  final ScrollController _scrollController;

  const CountrySelectionBottomDialog({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  @override
  State<StatefulWidget> createState() => _CountrySelectionBottomDialogState();

  static Widget withBloc({
    required ScrollController scrollController,
    required Country selectedCountry,
  }) =>
      BlocProvider(
        create: (context) =>
            CountrySelectionBloc(getSupportedCountriesUseCase: context.read())
              ..add(InitialLoadEvent(selectedCountry: selectedCountry)),
        child: CountrySelectionBottomDialog(
          scrollController: scrollController,
        ),
      );
}

class _CountrySelectionBottomDialogState
    extends State<CountrySelectionBottomDialog> {
  late final CountrySelectionBloc _bloc;
  late final ApiErrorMapper _apiErrorMapper;

  Locale? _cachedLocale;

  @override
  void initState() {
    super.initState();

    _bloc = context.read();
    _apiErrorMapper = context.read();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _maybeSortCountriesOnLocaleChange(
      context: context,
      countries: _bloc.state.unsortedCountries,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final animation = theme.animation;

    return BlocConsumer<CountrySelectionBloc, CountrySelectionState>(
      listener: (context, state) {
        if (state.countriesLoaded) {
          _onCountriesLoaded(countries: state.unsortedCountries);
        }

        final error = state.error.orNull;
        if (error != null) {
          _onError(context: context, error: error);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            KevinListBottomDialog(
              title: LocaleKeys.country_selection_dialog_title.tr(),
              itemCount: state.sortedCountries.length,
              // shrinkWrap is expensive and not needed when content
              // is large enough to cover a whole screen.
              shrinkWrap: state.sortedCountries.length <= 12,
              scrollController: widget._scrollController,
              physics: const ClampingScrollPhysics(),
              builder: (context, index) {
                final country = state.sortedCountries[index];

                var type = KevinListItemType.middle;

                if (state.sortedCountries.length == 1) {
                  type = KevinListItemType.single;
                } else if (index == 0) {
                  type = KevinListItemType.top;
                } else if (index == state.sortedCountries.length - 1) {
                  type = KevinListItemType.bottom;
                }

                return KevinListItem(
                  centerWidget: KevinListItemCenterText(
                    text: country.country.nameKey.tr(),
                  ),
                  leadingWidget: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: color.inputUnfocusedBorder),
                    ),
                    child: SvgPicture.asset(
                      country.country.flagKey,
                    ),
                  ),
                  trailingWidget: const KevinListItemTrailingArrow(),
                  type: type,
                  onPressed: () => _onCountrySelected(
                    context: context,
                    country: country.country,
                  ),
                  selected: country.selected,
                );
              },
              animateList: true,
            ),
            AnimatedOpacity(
              duration: animation.duration.shortDuration,
              opacity: state.loading ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 48, bottom: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [KevinProgressIndicator()],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _onCountriesLoaded({required List<CountryItem> countries}) {
    _bloc.add(const ClearCountriesLoadedEvent());

    _sortCountries(countries: countries);
  }

  void _onCountrySelected({
    required BuildContext context,
    required Country country,
  }) {
    Navigator.of(context).pop(country);
  }

  void _onError({required BuildContext context, required Exception error}) {
    _bloc.add(const ClearErrorEvent());

    ScaffoldMessenger.of(context).showSnackBar(
      KevinSnackBar.text(context: context, text: _apiErrorMapper.map(error)),
    );
  }

  void _maybeSortCountriesOnLocaleChange({
    required BuildContext context,
    required List<CountryItem> countries,
  }) async {
    final currentLocale = context.locale;

    if (_cachedLocale == null || countries.isEmpty) {
      _cachedLocale = currentLocale;
      return;
    }

    if (currentLocale != _cachedLocale) {
      _cachedLocale = currentLocale;
      _sortCountries(countries: countries);
    }
  }

  void _sortCountries({required List<CountryItem> countries}) async {
    final countriesSorted = countries.sorted(
      (first, second) {
        final firstLocalizedName = first.country.nameKey.tr();
        final secondLocalizedName = second.country.nameKey.tr();

        return firstLocalizedName.compareTo(secondLocalizedName);
      },
    ).toList();

    _bloc.add(SetSortedCountriesEvent(countries: countriesSorted));
  }
}
