import 'package:flutter/cupertino.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_bottom_sheet_header.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_item.dart';
import 'package:kevin_flutter_example/payments/payment_type/model/payment_type.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class PaymentTypeBottomDialog extends StatefulWidget {
  final bool _hasLinkedAccount;

  const PaymentTypeBottomDialog({
    super.key,
    bool hasLinkedAccount = false,
  }) : _hasLinkedAccount = hasLinkedAccount;

  @override
  State<StatefulWidget> createState() => _PaymentTypeBottomDialogState();
}

class _PaymentTypeBottomDialogState extends State<PaymentTypeBottomDialog> {
  final List<PaymentType> _paymentTypes = [];

  @override
  void initState() {
    super.initState();

    _paymentTypes.add(PaymentType.bank);
    if (widget._hasLinkedAccount) _paymentTypes.add(PaymentType.linked);
    _paymentTypes.add(PaymentType.card);
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const KevinBottomSheetHeader(
          // TODO: Localisation
          text: 'Choose payment type',
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 36),
          itemBuilder: (context, index) {
            final paymentType = _paymentTypes[index];

            final String icon;
            final String text;
            final KevinListItemType listItemType;
            Color? iconBackgroundColor;

            switch (paymentType) {
              case PaymentType.bank:
                icon = AppImages.bank;
                // TODO: Localisation
                text = 'Bank';
                listItemType = KevinListItemType.top;
                break;
              case PaymentType.linked:
                icon = AppImages.link;
                // TODO: Localisation
                text = 'Linked account';
                listItemType = KevinListItemType.middle;
                break;
              case PaymentType.card:
                icon = AppImages.card;
                // TODO: Localisation
                text = 'Card';
                listItemType = KevinListItemType.bottom;
                iconBackgroundColor = color.icon;
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
          shrinkWrap: true,
          itemCount: _paymentTypes.length,
        )
      ],
    );
  }

  void _onPaymentTypeSelected({
    required BuildContext context,
    required PaymentType paymentType,
  }) {
    Navigator.of(context).pop(paymentType);
  }
}
