import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/configs/app_startup.dart';
import 'package:pokebook/home/cubit/pokemon_cubit.dart';
import 'package:pokebook/home/model/pokemon_details.dart';
import 'package:pokebook/home/model/pokemon_model.dart';
import 'package:pokebook/shared/navigation/routes.gr.dart';
import 'package:pokebook/shared/utils/colors.dart';
import 'package:pokebook/shared/utils/custom_extension.dart';
import 'package:pokebook/shared/utils/utils.dart';

class PokemonListItem extends StatefulWidget {
  final MiniPokemonModel miniPokemonModel;
  const PokemonListItem({super.key, required this.miniPokemonModel});

  @override
  State<PokemonListItem> createState() => _PokemonListItemState();
}

class _PokemonListItemState extends State<PokemonListItem> {

  Future<PokemonDetailsModel?> getData() async {
    // we are caching the pokemon details data to avoid calling the api unnecessarily
    // we can simply get the data back from the cache
    if (getIt.isRegistered<PokemonDetailsModel>(
        instanceName: widget.miniPokemonModel.name)) {
      return getIt<PokemonDetailsModel>(
          instanceName: widget.miniPokemonModel.name!);
    }
    // if data is not cached, get pokemon details via the api
    return getIt<PokemonDataCubit>().getDetails(
      widget.miniPokemonModel.url!.split("/").secondToLast.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonDetailsModel?>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data == null ||
            snapshot.hasError) {
          return const SizedBox();
        }

        // cache data for future reuse, this ensures an efficient api call since the data is only fetched once
        getIt.registerSingleton(snapshot.data!,
            instanceName: snapshot.data!.name,);

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.router.push(PokemonDetails(pokemonDetails: snapshot.data!));
          },
          child: Container(
            height: 381.h,
            width: 388.w,
            margin: EdgeInsets.only(top: 20.h),
            child: Stack(
              children: [
                Positioned(
                  top: 27.h,
                  child: Container(
                    height: 361.h,
                    width: 388.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(27.r),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 361.w,
                          height: 199.h,
                          decoration: BoxDecoration(
                            color: AppColors.lighterGrey,
                            borderRadius: BorderRadius.circular(
                              20.r,
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          snapshot.data!.name!.capitalize(),
                          style: GoogleFonts.sofiaSans(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        20.verticalSpace,
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: snapshot.data!.types!
                              .map(
                                (e) => Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    color: const Color(0xffEEEEEE),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${GeneralUtil.getEmojiFromText(e.type!.name!)} ${e.type!.name!.capitalize()}",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.network(
                    width: 257.w,
                    height: 207.h,
                    snapshot.data!.sprites!.other!.dreamWorld!.frontDefault!,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
