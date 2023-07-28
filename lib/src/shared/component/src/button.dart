import 'package:flutter/material.dart';

class BIConButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;

  const BIConButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      height: 24.0,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 28.0),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class DecrButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const DecrButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      height: 32.0,
      minWidth: 32.0,
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: const Center(
        child: Icon(
          Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class IncrButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const IncrButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      height: 32.0,
      minWidth: 32.0,
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton(
      {super.key,
      required this.onClick,
      required this.isEnable,
      required this.icon});

  final VoidCallback? onClick;
  final bool isEnable;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnable ? onClick : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: Icon(
          icon,
          color: isEnable
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).dividerColor,
          size: 18,
        ),
      ),
    );
  }
}
