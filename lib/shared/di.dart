import 'package:get_it/get_it.dart';
import 'analytics/analytics_service.dart';

setupSharedServices(GetIt ioc) {
  ioc.registerSingleton<AnalyticService>(AnalyticService());
}
