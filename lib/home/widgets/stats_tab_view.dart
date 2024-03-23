import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/home/model/pokemon_details.dart' as pd;
import 'package:pokebook/shared/utils/colors.dart';
import 'package:pokebook/shared/utils/custom_extension.dart';

class StatsTabView extends StatelessWidget {
  final pd.PokemonDetailsModel pokemonDetailsModel;
  const StatsTabView({super.key, required this.pokemonDetailsModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customDivider(),
          Container(
            height: 40.h,
            width: 1.sw,
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Stats",
                style: GoogleFonts.sofiaSans(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          customDivider(),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFFFFFFF),
                  const Color(0xFFD9D9D9).withOpacity(.27),
                  const Color(0xFFFFFFFF)
                ],
              ),
            ),
            child: SizedBox(
              height: 220.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    10.verticalSpace,
                    Column(
                      children: pokemonDetailsModel.stats!
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        e.stat!.name!.capitalize(),
                                        style: GoogleFonts.sofiaSans(
                                          fontSize: 21.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 8.h,
                                                width: 108.w,
                                                color: const Color(0xFFCBCBCB),
                                              ),
                                              Container(
                                                height: 8.h,
                                                width: e.effort == 0
                                                    ? 0
                                                    : (e.effort! /
                                                            e.baseStat!) *
                                                        108.w,
                                                color:
                                                    Theme.of(context)
                                                        .primaryColor,
                                              ),
                                            ],
                                          ),
                                          20.horizontalSpace,
                                          Text(
                                            e.effort.toString(),
                                            style: GoogleFonts.sofiaSans(
                                              fontSize: 21.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  10.verticalSpace,
                                  customDivider(),
                                  10.verticalSpace,
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
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
