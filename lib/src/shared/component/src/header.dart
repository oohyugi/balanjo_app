import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget child;
  final String title;
  final VoidCallback? onTapMore;
  final bool isShowTapMore;

  const Header({
    Key? key,
    required this.title,
    this.onTapMore,
    required this.child,
    this.isShowTapMore = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onBackground),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isShowTapMore)
              TextButton(
                  onPressed: onTapMore,
                  child: Text("More",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground)))
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        child,
      ],
    );
  }
}
