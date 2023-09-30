import 'package:balanjo_app/src/features/setting/presentation/widget/login_card.dart';
import 'package:balanjo_app/src/features/setting/presentation/widget/setting_info.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/theme/icons.dart';
import 'package:flutter/material.dart';

import 'widget/profile_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: const Text("Akun"),
        isShowFloatingCart: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: LoginCard(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    child: Column(
                      children: [

                        const ProfileCard(
                          avatarUrl: "https://i.pravatar.cc/300",
                          name: "John Doe",
                          phone: "08123456789",
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        SettingInfo(
                          assetName: assetNamePointMap,
                          title: "Alamat Tersimpan",
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SettingInfo(
                            assetName: assetNameQuestion,
                            title: "Pusat Bantuan",
                            onTap: () {},
                          ),
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SettingInfo(
                            assetName: assetNamePrivacy,
                            title: "Kebijakan Privasi",
                            onTap: () {},
                          ),
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SettingInfo(
                            assetName: assetNameTerm,
                            title: "Persyaratan Layanan",
                            onTap: () {},
                          ),
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SettingInfo(
                            assetName: assetNameRibbon,
                            title: "Tentang Aplikasi",
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SettingInfo(
                      assetName: assetNameLogout,
                      title: "Keluar",
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
