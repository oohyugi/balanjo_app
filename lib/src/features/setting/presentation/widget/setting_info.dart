import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/theme/icons.dart';
import 'package:flutter/material.dart';

class SettingInfo extends StatelessWidget {
  const SettingInfo(
      {super.key,
      required this.assetName,
      required this.title,
      required this.onTap});

  final String assetName;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tapper(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SvgIcon( assetName, width: 24, height: 24),
            const SpaceHorizontal(size: 16),
            Expanded(
                child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            )),
            const SpaceHorizontal(size: 16),
            const Icon(Icons.chevron_right_sharp)
          ],
        ),
      ),
    );
  }
}
