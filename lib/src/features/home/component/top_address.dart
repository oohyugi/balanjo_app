import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/bloc/bloc.dart';
import '../../../shared/component/component.dart';

class TopAddress extends StatelessWidget {
  const TopAddress({
    super.key,
    required this.onTap,
  });

  final Function(SimpleUiState state) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child:
          BlocBuilder<LocationCubit, LocationState>(builder: (context, state) {
        return Tapper(
          onTap: () {
            onTap(state.uiState);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Antar ke",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              if (state.uiState.isInitial)
                ShimmerDefault(
                    child: RoundedPlaceHolder(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 14,
                )),
              if (state.uiState.isSuccess)
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        state.selectedLocation?.address ?? state.location?.address??"",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.onSurface),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SpaceHorizontal(size: 4),
                    const Icon(
                      Icons.expand_circle_down_outlined,
                      size: 18,
                    )
                  ],
                ),
              if (state.uiState.isFailure)
                Text(
                  "Pilih Lokasi",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.error),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
            ],
          ),
        );
      }),
    );
  }
}
