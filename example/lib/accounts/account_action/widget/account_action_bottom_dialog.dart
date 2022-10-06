import 'package:domain/accounts/model/linked_account.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_bottom_dialog.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_item.dart';
import 'package:kevin_flutter_example/generated/locale_keys.g.dart';
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

    return KevinListBottomDialog(
      title: _account.bankName,
      itemCount: 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, _) {
        return KevinListItem(
          centerWidget: KevinListItemCenterText(
            text: LocaleKeys.linked_account_dialog_remove.tr(),
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
        );
      },
    );
  }
}
