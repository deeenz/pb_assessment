import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/configs/app_startup.dart';
import 'package:pokebook/generated/l10n.dart';
import 'package:pokebook/home/cubit/pokemon_cubit.dart';
import 'package:pokebook/home/cubit/pokemon_states.dart';
import 'package:pokebook/shared/navigation/routes.gr.dart';
import 'package:pokebook/shared/utils/asset_images.dart';
import 'package:pokebook/shared/utils/colors.dart';
import 'package:pokebook/shared/utils/dialog.dart';
import 'package:pokebook/shared/widgets/notification_message.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetResources.NOISE_BG),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: SvgPicture.asset(
                AssetResources.POKE_LOGO,
                width: 315.w,
                height: 204.h,
              ),
            ),
            30.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: S.current.poke,
                    style: GoogleFonts.sofiaSans(
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: S.current.book,
                    style: GoogleFonts.sofiaSans(
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Text(
              S.current.largestPokemonIndexWithInfo,
              textAlign: TextAlign.center,
              style: GoogleFonts.sofiaSans(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            100.verticalSpace,
            Container(
              height: 81.h,
              width: 390.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: commonDecoration(Theme.of(context).primaryColor),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                decoration: commonDecoration(Colors.white),
                child: Row(
                  children: [
                    10.horizontalSpace,
                    Expanded(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: S.current.enterPokemonName,
                          hintStyle: GoogleFonts.sofiaSans(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyShades[20]),
                          isCollapsed: true,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    BlocListener(
                      bloc: getIt<PokemonDataCubit>(),
                      listener: (context, state) {
                        if (state is GetPokemonDetailsLoading) {
                          DialogUtil.showLoadingDialog(context);
                        } else if (state is GetPokemonDetailsError) {
                          DialogUtil.dismissLoadingDialog(context);
                          NotificationMessage.showError(
                            context,
                            message: state.message,
                          );
                        } else if (state is GetPokemonDetailsSuccess) {
                          DialogUtil.dismissLoadingDialog(context);
                          context.router.push(PokemonDetails(
                              pokemonDetails: state.pokemonDetailsModel));
                        }
                      },
                      child: InkWell(
                        onTap: () {
                          if (searchController.text.isEmpty) {
                            NotificationMessage.showError(context,
                                message: S.current.enterPokemonName);
                            return;
                          }
                          // search
                          getIt<PokemonDataCubit>()
                              .getPokemonDetails(searchController.text);
                        },
                        child: Container(
                          height: 48.h,
                          width: 48.h,
                          decoration:
                              commonDecoration(Theme.of(context).primaryColor),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            TextButton(
              onPressed: () {
                context.router.push(const PokemonListRoute());
              },
              child: Text(
                S.current.viewAll,
                style: GoogleFonts.sofiaSans(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyShades[100],
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Decoration commonDecoration(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(100.r),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 4),
          spreadRadius: 0,
          blurRadius: 4.r,
          color: Colors.black.withOpacity(.08),
        )
      ],
    );
  }
}
