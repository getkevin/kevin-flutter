import 'package:domain/accounts/model/linked_account.dart';
import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_bottom_sheet_header.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_item.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

enum AccountAction { delete }

class AccountActionBottomDialog extends StatelessWidget {
  final LinkedAccount _account;

  const AccountActionBottomDialog({Key? key, required LinkedAccount account})
      : _account = account,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        KevinBottomSheetHeader(text: _account.bankName),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: KevinListItem(
            centerWidget: KevinListItemCenterText(
              // TODO: Localisation
              text: 'Remove',
              textColor: color.error,
            ),
            leadingWidget: KevinListItemLeadingIcon(
              icon: AppImages.bin,
              iconColor: color.error,
              backgroundColor: Colors.transparent,
            ),
            type: KevinListItemType.single,
            onPressed: () {
              Navigator.of(context).pop(AccountAction.delete);
            },
          ),
        ),
        const SizedBox(
          height: 36,
        ),
      ],
    );
  }
}
