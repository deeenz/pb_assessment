import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/configs/app_startup.dart';
import 'package:pokebook/generated/l10n.dart';
import 'package:pokebook/home/cubit/pokemon_cubit.dart';
import 'package:pokebook/home/cubit/pokemon_states.dart';
import 'package:pokebook/home/model/pokemon_model.dart';
import 'package:pokebook/home/widgets/pokemon_list_item.dart';
import 'package:pokebook/shared/themes.dart';
import 'package:pokebook/shared/utils/asset_images.dart';
import 'package:pokebook/shared/utils/colors.dart';
import 'package:pokebook/shared/widgets/notification_message.dart';

@RoutePage()
class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  List<MiniPokemonModel> pokemons = [];
  int selectedIndex = 0;
  ScrollController paginatorScrollController = ScrollController();
  bool showLastItemOnPaginator = true;

  @override
  void initState() {
    getPokemons();
    super.initState();
    Timer.run(() {
      listenForPaginatorScroll();
    });
  }

  void listenForPaginatorScroll() {
    paginatorScrollController.addListener(() {
      if (paginatorScrollController.offset != 0 &&
          paginatorScrollController.position.atEdge) {
        showLastItemOnPaginator = false;
        setState(() {});
      } else {
        var prevValue = showLastItemOnPaginator;
        showLastItemOnPaginator = true;
        if (!prevValue) {
          setState(() {});
        }
      }
    });
  }

  void getPokemons() {
    if (getIt.isRegistered<List<MiniPokemonModel>>()) {
      pokemons = getIt<List<MiniPokemonModel>>();
    } else {
      getIt<PokemonDataCubit>().getPokemons();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetResources.NOISE_BG),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocConsumer(
          bloc: getIt<PokemonDataCubit>(),
          listener: (context, state) {
            if (state is GetPokemonsSuccess) {
              pokemons = state.pokemons;
            } else if (state is GetPokemonsError) {
              NotificationMessage.showError(context, message: state.message);
            }
          },
          builder: (context, state) => Column(
            children: [
              SizedBox(
                height: 120.h,
                child: Stack(
                  children: [
                    Container(
                      height: 100.h,
                      color: Colors.white,
                      width: 1.sw,
                      padding: EdgeInsets.only(top: 40.h, left: 130.w),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: S.current.poke,
                                  style: GoogleFonts.sofiaSans(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: S.current.book,
                                  style: GoogleFonts.sofiaSans(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => SimpleDialog(
                                      contentPadding: EdgeInsets.zero,
                                      titlePadding: EdgeInsets.zero,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20.r)),
                                          child: Column(
                                            children: [
                                              5.verticalSpace,
                                              Text(
                                                "Choose Theme",
                                                style: GoogleFonts.sofiaSans(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              5.verticalSpace,
                                              Container(
                                                height: 100.h,
                                                decoration: BoxDecoration(
                                                  color: AppColors
                                                      .greyShades[20]!
                                                      .withOpacity(.1),
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          bottom:
                                                              Radius.circular(
                                                                  20.r)),
                                                  image: const DecorationImage(
                                                    image: AssetImage(
                                                      AssetResources.NOISE_BG,
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        theme.value = theme1;
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Container(
                                                        height: 42,
                                                        width: 42,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFF868686),
                                                          ),
                                                        ),
                                                        child: Container(
                                                          height: 32,
                                                          width: 32,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: AppColors
                                                                .theme1PrimaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    10.horizontalSpace,
                                                    GestureDetector(
                                                      onTap: () {
                                                        theme.value = theme2;
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Container(
                                                        height: 42,
                                                        width: 42,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: const Color(
                                                              0xFF868686,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Container(
                                                          height: 32,
                                                          width: 32,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColors
                                                                  .theme2PrimaryColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 42,
                                  width: 42,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF868686),
                                    ),
                                  ),
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          16.horizontalSpace
                        ],
                      ),
                    ),
                    Positioned(
                      top: 40.h,
                      left: 16.w,
                      child: GestureDetector(
                        onTap: () {
                          context.router.back();
                        },
                        child: SvgPicture.asset(
                          AssetResources.POKE_LOGO,
                          width: 114.w,
                          height: 74.h,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: state is GetPokemonsLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state is GetPokemonDetailsError
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(S.current.anErrorOccurred),
                              10.verticalSpace,
                              SizedBox(
                                width: .4.sw,
                                child: ElevatedButton(
                                  onPressed: () {
                                    getPokemons();
                                  },
                                  child: Text(
                                    S.current.reload,
                                  ),
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: pokemons
                                        .sublist(getStartIndexForShownItems(),
                                            getStartIndexForShownItems() + 4)
                                        .map(
                                          (e) => PokemonListItem(
                                              miniPokemonModel: e),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              Container(
                                height: 100.h,
                                padding: EdgeInsets.symmetric(horizontal: 22.w),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (paginatorScrollController.offset <
                                            200.w) {
                                          return;
                                        }

                                        paginatorScrollController.animateTo(
                                          paginatorScrollController.offset -
                                              200.w,
                                          duration: const Duration(
                                              microseconds: 3000),
                                          curve: Curves.bounceIn,
                                        );
                                      },
                                      child: Container(
                                        height: 40.w,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                          color: AppColors.lightGrey,
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 20.r,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        controller: paginatorScrollController,
                                        child: Row(
                                          children: List.generate(
                                            (pokemons.length / 4).floor(),
                                            (e) => InkWell(
                                              onTap: () {
                                                selectedIndex = e;
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 40.w,
                                                width: 40.w,
                                                margin:
                                                    EdgeInsets.only(left: 10.w),
                                                decoration: BoxDecoration(
                                                  color: selectedIndex == e
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : AppColors.lightGrey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    8.r,
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  (e + 1).toString(),
                                                  style: GoogleFonts.sofiaSans(
                                                    color: selectedIndex == e
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (showLastItemOnPaginator)
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          10.horizontalSpace,
                                          const Icon(Icons.more_horiz),
                                          5.horizontalSpace,
                                          InkWell(
                                            onTap: () {
                                              selectedIndex =
                                                  (pokemons.length / 4).floor();
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 40.w,
                                              width: 40.w,
                                              margin:
                                                  EdgeInsets.only(left: 10.w),
                                              decoration: BoxDecoration(
                                                color: selectedIndex ==
                                                        (pokemons.length / 4)
                                                            .floor()
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : AppColors.lightGrey,
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                (pokemons.length / 4)
                                                    .floor()
                                                    .toString(),
                                                style: GoogleFonts.sofiaSans(
                                                  color: selectedIndex ==
                                                          (pokemons.length / 4)
                                                              .floor()
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    InkWell(
                                      onTap: () {
                                        paginatorScrollController.animateTo(
                                          paginatorScrollController.offset +
                                              200.w,
                                          duration: const Duration(
                                              microseconds: 3000),
                                          curve: Curves.bounceIn,
                                        );
                                      },
                                      child: Container(
                                        height: 40.w,
                                        width: 40.w,
                                        margin: EdgeInsets.only(left: 10.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.lightGrey,
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20.r,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }

  int getStartIndexForShownItems() {
    if (selectedIndex == 0) {
      return 0;
    }
    return (selectedIndex - 1) * 4;
  }
}
