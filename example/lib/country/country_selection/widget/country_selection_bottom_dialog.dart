import 'package:domain/country/model/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_bottom_sheet_header.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_item.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_progress_indicator.dart';
import 'package:kevin_flutter_example/country/country_selection/bloc/country_selection_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final decoration = theme.decoration;

    return BlocConsumer<CountrySelectionBloc, CountrySelectionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            AnimatedSize(
              duration: decoration.duration.defaultDuration,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ListView.builder(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 36),
                  controller: widget._scrollController,
                  // shrinkWrap is expensive and not needed when content
                  // is large enough to cover whole screen.
                  shrinkWrap: state.countries.length <= 12,
                  itemBuilder: (context, index) {
                    final country = state.countries[index];

                    var type = KevinListItemType.middle;

                    if (state.countries.length == 1) {
                      type = KevinListItemType.single;
                    } else if (index == 0) {
                      type = KevinListItemType.top;
                    } else if (index == state.countries.length - 1) {
                      type = KevinListItemType.bottom;
                    }

                    return KevinListItem(
                      trailingWidget: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: color.inputUnfocusedBorder),
                        ),
                        child: SvgPicture.asset(
                          country.country.flag,
                        ),
                      ),
                      text: country.country.name,
                      type: type,
                      onPressed: () => _onCountrySelected(
                        context: context,
                        country: country.country,
                      ),
                      selected: country.selected,
                    );
                  },
                  itemCount: state.countries.length,
                ),
              ),
            ),
            AnimatedOpacity(
              duration: decoration.duration.shortDuration,
              opacity: state.loading ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 48, bottom: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [KevinProgressIndicator()],
                ),
              ),
            ),
            const KevinBottomSheetHeader(
              // TODO: Localisation
              text: 'Choose bank account',
            ),
          ],
        );
      },
    );
  }

  void _onCountrySelected({
    required BuildContext context,
    required Country country,
  }) {
    Navigator.of(context).pop(country);
  }
}
