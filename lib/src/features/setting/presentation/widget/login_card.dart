import 'package:balanjo_app/config/route/safe_route.dart';
import 'package:balanjo_app/config/route/screen/login.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tidak perlu keluar rumah, biar kami yang urus kebutuhan belanjaan Anda.",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SpaceVertical(size: 16),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FilledButton(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  const LoginScreenRoute().push(context);
                },
                child: Text("Masuk")))
      ],
    );
  }
}
