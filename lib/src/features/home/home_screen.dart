import 'package:balanjo_app/config/route/safe_route.dart';
import 'package:balanjo_app/config/route/screen/maps.dart';
import 'package:balanjo_app/main.dart';
import 'package:balanjo_app/src/features/home/component/flashsale.dart';
import 'package:balanjo_app/src/features/home/component/foryou.dart';
import 'package:balanjo_app/src/features/home/component/caraousel.dart';
import 'package:balanjo_app/src/features/home/modal_content_address.dart';
import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/icons.dart';
import '../../utils/UiState.dart';
import 'component/categories.dart';
import 'component/top_address.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: TopAddress(
        onTap: (SimpleUiState state) {
          showModalBottomSheet<void>(
            context: context,
            enableDrag: true,
            showDragHandle: true,
            builder: (BuildContext context) {
              return BlocProvider(
                  create: (BuildContext context) =>
                      getIt<SavedLocationCubit>()..getAll(),
                  child: ModalContentAddress(
                    onTapMap: (location) {
                      context.pop();
                      MapsScreenRoute(
                              latitude: location.latitude,
                              longitude: location.longitude)
                          .push(context);
                    },
                    onTapItem: (location) {
                      context.pop();
                      context
                          .read<LocationCubit>()
                          .setSelectedLocation(location);
                    },
                  ));
            },
          );
        },
      ),
      actions: [
        const Search(
          isShowOnlyIcon: true,
        ),
        IconButton(
            onPressed: () {},
            icon: Badge(
                label: const Text("2"),
                smallSize: 1,
                child: SvgPicture.asset(
                  Assets.icNotif,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onBackground,
                      BlendMode.srcIn),
                ))),
      ],
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SpaceVertical(size: 18),
            SizedBox(
              height: 158,
              child: Carousel(),
            ),
            SpaceVertical(size: 18),
            CategoryList(),
            FlashSale(),
            SpaceVertical(size: 18),
            ForYou(),
            SpaceVertical(size: 100),
          ],
        ),
      ),
    );
  }
}
