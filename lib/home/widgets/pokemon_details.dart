import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/home/model/pokemon_details.dart' as pd;
import 'package:pokebook/home/widgets/about_tab_view.dart';
import 'package:pokebook/home/widgets/stats_tab_view.dart';
import 'package:pokebook/shared/utils/custom_extension.dart';
import 'package:pokebook/shared/utils/utils.dart';

@RoutePage()
class PokemonDetails extends StatefulWidget {
  final pd.PokemonDetailsModel pokemonDetails;
  const PokemonDetails({super.key, required this.pokemonDetails});

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child:  Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  SizedBox(
                    height: 350.h,
                    child: Stack(
                      children: [
                        Container(
                          height: 283.h,
                          width: 1.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(24.r)),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              colors: [
                                Color(0xFF7FCAD1),
                                Color(0xFF3DA0A9),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16.w,
                          top: 40.h,
                          child: GestureDetector(
                            onTap: () {
                              context.router.back();
                            },
                            child: Container(
                              width: 38.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                size: 20.sp,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SvgPicture.network(
                            widget.pokemonDetails.sprites!.other!
                                .dreamWorld!.frontDefault!,
                            width: 255.w,
                            height: 260.h,
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  Text(
                    widget.pokemonDetails.name!.capitalize(),
                    style: GoogleFonts.sofiaSans(
                      fontSize: 56.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: widget.pokemonDetails.types!
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
                  40.verticalSpace,
                  Expanded(
                    child: TabBarView(
                      children: [
                        AboutTabView(
                            pokemonDetailsModel: widget.pokemonDetails),
                        StatsTabView(
                            pokemonDetailsModel: widget.pokemonDetails),
                        const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    height: 97.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 15,
                          spreadRadius: 0,
                          offset: const Offset(
                            0,
                            -5,
                          ),
                        )
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      width: 391.w,
                      height: 59.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: const Color(
                          0xFFE9E9E9,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.inner,
                            offset: const Offset(0, -3),
                            color: Colors.black.withOpacity(.15),
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ],
                      ),
                      child: TabBar(
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          labelPadding: EdgeInsets.zero,
                          tabs: [
                            Tab(
                              child: Text(
                                "About",
                                style: GoogleFonts.sofiaSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Stats",
                                style: GoogleFonts.sofiaSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Similar",
                                style: GoogleFonts.sofiaSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            )
    );
  }

  Widget customDivider() {
    return Container(
      height: 1.53.h,
      width: 390.w,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFD9D9D9), Color(0xFFFFFFFF)],
        ),
      ),
    );
  }
}
