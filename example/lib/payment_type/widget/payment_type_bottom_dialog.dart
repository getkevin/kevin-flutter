import 'package:domain/payments/model/payment_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/common_blocs/linked_accounts_bloc/linked_accounts_bloc.dart';
import 'package:kevin_flutter_example/common_blocs/linked_accounts_bloc/linked_accounts_event.dart';
import 'package:kevin_flutter_example/common_blocs/linked_accounts_bloc/linked_accounts_state.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_bottom_dialog.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_item.dart';
import 'package:kevin_flutter_example/generated/locale_keys.g.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';

class PaymentTypeBottomDialog extends StatefulWidget {
  const PaymentTypeBottomDialog({super.key});

  @override
  State<StatefulWidget> createState() => _PaymentTypeBottomDialogState();

  static Widget withBloc() => BlocProvider(
        create: (context) => LinkedAccountsBloc(
          accountsRepository: context.read(),
        )..add(const LoadLinkedAccountsEvent()),
        child: const PaymentTypeBottomDialog(),
      );
}

class _PaymentTypeBottomDialogState extends State<PaymentTypeBottomDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LinkedAccountsBloc, LinkedAccountsState>(
      builder: (context, state) {
        final paymentTypes = state.accounts.isEmpty
            ? [PaymentType.bank]
            : [PaymentType.bank, PaymentType.linked];

        return KevinListBottomDialog(
          key: ValueKey(context.locale.languageCode),
          title: LocaleKeys.payment_type_dialog_title.tr(),
          itemCount: paymentTypes.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          builder: (context, index) {
            final paymentType = paymentTypes[index];

            final String icon;
            final String text;
            final KevinListItemType listItemType;
            Color? iconBackgroundColor;

            switch (paymentType) {
              case PaymentType.bank:
                icon = AppImages.bank;
                text = LocaleKeys.payment_type_dialog_bank.tr();
                listItemType = KevinListItemType.top;
                break;
              case PaymentType.linked:
                icon = AppImages.link;
                text = LocaleKeys.payment_type_dialog_linked.tr();
                listItemType = KevinListItemType.bottom;
                break;
            }

            return KevinListItem.defaultItem(
              icon: icon,
              iconBackgroundColor: iconBackgroundColor,
              text: text,
              type: listItemType,
              onPressed: () => _onPaymentTypeSelected(
                context: context,
                paymentType: paymentType,
              ),
            );
          },
        );
      },
    );
  }

  void _onPaymentTypeSelected({
    required BuildContext context,
    required PaymentType paymentType,
  }) {
    Navigator.of(context).pop(paymentType);
  }
}
