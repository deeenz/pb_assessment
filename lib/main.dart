import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'configs/app_startup.dart';
import 'generated/l10n.dart';
import 'shared/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft]);
  await AppStartUp().setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeData>(
      valueListenable:theme ,
      builder: (context, value, wid) {
        return ScreenUtilInit(
          designSize: const Size(430, 932),
          builder: (BuildContext context, child) => MaterialApp.router(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            title: 'Pokebook',
            themeMode: ThemeMode.light,
            theme: value,
            routerConfig: _appRouter.config(),
          ),
        );
      }
    );
  }
}
