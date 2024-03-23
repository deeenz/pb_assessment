import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pokebook/shared/navigation/routes.gr.dart';
import 'package:pokebook/shared/utils/asset_images.dart';
import '../configs/app_configs.dart';
import '../shared/analytics/analytics_service.dart';
import '../shared/utils/colors.dart';
import '../shared/utils/storage.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isFirstTime;

  @override
  void initState() {
    GetIt.I<AnalyticService>().addEvent(name: "App_Launched");
    isUserFirstTime().then((value) => isFirstTime = value);
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.router.replace(const HomeRoute());
    });
  }

  Future<bool> isUserFirstTime() async {
    var firstTime = await LocalStorageUtils.read(AppConstants.isUserFirstTime);
    return firstTime == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetResources.NOISE_BG),
            fit: BoxFit.cover,
          ),
        ),
        child: Hero(
          tag: "logo",
          child: SvgPicture.asset(
            AssetResources.POKE_LOGO,
          ),
        ),
      ),
    );
  }
}
