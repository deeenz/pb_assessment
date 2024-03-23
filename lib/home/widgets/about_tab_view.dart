import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/home/model/pokemon_details.dart' as pd;
import 'package:pokebook/shared/utils/custom_extension.dart';


class AboutTabView extends StatelessWidget {
  final pd.PokemonDetailsModel pokemonDetailsModel;
  const AboutTabView({super.key, required this.pokemonDetailsModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
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
                "About",
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
            child: Column(
              children: [
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: GoogleFonts.sofiaSans(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    30.horizontalSpace,
                    Text(
                      pokemonDetailsModel.height.toString() + "m",
                      style: GoogleFonts.sofiaSans(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                customDivider(),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weight",
                      style: GoogleFonts.sofiaSans(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    30.horizontalSpace,
                    Text(
                      pokemonDetailsModel.weight.toString() + "kg",
                      style: GoogleFonts.sofiaSans(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                customDivider(),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Abilities",
                      style: GoogleFonts.sofiaSans(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    30.horizontalSpace,
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemonDetailsModel.abilities!
                            .map((e) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 7.sp,
                                      color: Colors.black,
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      e.ability!.name!.capitalize(),
                                      style: GoogleFonts.sofiaSans(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ))
                            .toList()),
                  ],
                ),
              ],
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
