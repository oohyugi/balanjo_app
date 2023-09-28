import 'package:flutter/material.dart';

enum TipsStatus { error, success, info }

class Tips extends StatelessWidget {
  const Tips({
    super.key,
    required this.message,
    this.status = TipsStatus.info,
  });

  final String message;
  final TipsStatus status;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: getBackgroundColor(context, status),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: getTextColor(context, status)),
            textAlign: TextAlign.start,
          ),
        )),
      ),
    );
  }

  Color getTextColor(BuildContext context, TipsStatus status) {
    return switch (status) {
      TipsStatus.error => Theme.of(context).colorScheme.onError,
      TipsStatus.success => Theme.of(context).colorScheme.onTertiary,
      TipsStatus.info => Theme.of(context).colorScheme.onSecondary,
    };
  }

  Color getBackgroundColor(BuildContext context, TipsStatus status) {
    return switch (status) {
      TipsStatus.error => Theme.of(context).colorScheme.error,
      TipsStatus.success => Theme.of(context).colorScheme.tertiary,
      TipsStatus.info => Theme.of(context).colorScheme.secondary,
    };
  }
}
