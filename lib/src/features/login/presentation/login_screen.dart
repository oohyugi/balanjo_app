import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/res/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        isShowFloatingCart: false,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Masuk dan belanja kebutuhan harian dengan mudah dan nyaman",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
              const SpaceVertical(
                size: 44,
              ),
              Tapper(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.icGoogle, height: 44),
                          const Text(
                            "Continue with Google",
                            style: TextStyle(
                                fontFamily: "Roboto Medium",
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {}),
              const SpaceVertical(size: 16),
              RichText(
                text: TextSpan(
                    text:
                        "Dengan masuk ke akun, berarti Anda telah memahami dan menyetujui ",
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                          text: "Kebijakan Privasi ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold)),
                      const TextSpan(text: "Dan "),
                      TextSpan(
                          text: "Persyaratan Layanan ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold)),
                      const TextSpan(text: "yang berlaku"),
                    ]),
              ),
            ],
          ),
        ));
  }
}
