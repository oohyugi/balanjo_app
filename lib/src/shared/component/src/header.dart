import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget child;
  final String title;
  final String? actionLabel;
  final VoidCallback? onTapMore;
  final bool isShowTapMore;

  const Header(
      {Key? key,
      required this.title,
      this.onTapMore,
      required this.child,
      this.isShowTapMore = true,
      this.actionLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onBackground),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (isShowTapMore)
                TextButton(
                    onPressed: onTapMore,
                    child: Text(actionLabel ?? "More",
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground)))
            ],
          ),
        ),

        child,
      ],
    );
  }
}
