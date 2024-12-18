import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/res/icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.name,
      required this.phone,
      required this.avatarUrl});

  final String name;
  final String phone;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(imageUrl: avatarUrl)),
        ),
        const SpaceHorizontal(size: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                phone,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(),
              )
            ],
          ),
        ),
        const SpaceHorizontal(size: 16),
        IconButton(onPressed: () {}, icon: SvgIcon(Assets.icEdit))
      ],
    );
  }
}
