import 'package:balanjo_app/src/features/home/home_screen.dart';
import 'package:balanjo_app/src/features/home/model/model.dart';
import 'package:balanjo_app/theme/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'component/search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: const Search()),
          ),
          // systemOverlayStyle: SystemUiOverlayStyle(
          //     systemNavigationBarColor: ElevationOverlay.applySurfaceTint(
          //         Theme.of(context).colorScheme.surface,
          //         Theme.of(context).colorScheme.surfaceTint,
          //         4),
          // statusBarIconBrightness: Brightness.dark,
          // statusBarColor: Theme.of(context).colorScheme.background,),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Badge(
                    label: Text("2"),
                    smallSize: 1,
                    child: SvgPicture.asset(
                      assetNameNotif,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onBackground,
                          BlendMode.srcIn),
                    )))
          ],
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
        ),
        bottomNavigationBar: NavigationBar(
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
            Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text('Page 2'),
            ),
            Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text('Page 3'),
            ),
            Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text('Page 4'),
            ),
          ],
        ));
  }

  NavigationDestination _buildNavigationDestination(
          {required bool isSelected,
          required Widget icon,
          required Widget selectedIcon,
          required String label}) =>
      NavigationDestination(
          icon: isSelected ? selectedIcon : icon, label: label);
}
