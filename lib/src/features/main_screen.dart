import 'package:balanjo_app/src/features/home/home_screen.dart';
import 'package:balanjo_app/src/features/home/model/model.dart';
import 'package:balanjo_app/src/features/myorder/my_order_screen.dart';
import 'package:balanjo_app/src/features/setting/presentation/setting_screen.dart';
import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../service/location.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;

  @override
  void initState() {

    context.read<LocationCubit>().getLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color navColor = ElevationOverlay.applySurfaceTint(
        Theme.of(context).colorScheme.surface,
        Theme.of(context).colorScheme.surfaceTint,
        4);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: navColor,
        systemNavigationBarDividerColor: navColor,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
      ),
      child: Scaffold(
          bottomNavigationBar: NavigationBar(
            shadowColor: Theme.of(context).colorScheme.shadow,
            onDestinationSelected: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            selectedIndex: _currentPageIndex,
            destinations: NavigationModel.navigations()
                .map((e) => _buildNavigationDestination(
                    isSelected: e.index == _currentPageIndex,
                    icon: SvgPicture.asset(
                      e.assetIcon,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onSurface,
                          BlendMode.srcIn),
                    ),
                    selectedIcon: SvgPicture.asset(
                      e.assetIconSelected,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onSurface,
                          BlendMode.srcIn),
                    ),
                    label: e.name))
                .toList(),
          ),
          body: IndexedStack(
            index: _currentPageIndex,
            children: [
              const HomeScreen(),
              // Container(
              //   color: Colors.green,
              //   alignment: Alignment.center,
              //   child: const FavoriteScreen(),
              // ),
              const MyOrderScreen(),
              const SettingScreen()
            ],
          )),
    );
  }

  NavigationDestination _buildNavigationDestination(
          {required bool isSelected,
          required Widget icon,
          required Widget selectedIcon,
          required String label}) =>
      NavigationDestination(
          icon: isSelected ? selectedIcon : icon, label: label);
}
