import 'package:client/services/facebook_signin_services.dart';
import 'package:client/services/googlemap_service.dart';
import 'package:client/services/login_services.dart';
import 'package:client/services/user_services.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.I;

void setupLocator(){

  locator.registerFactory<LogInService>(() => LogInService());
  locator.registerFactory<facebookSignInServices>(() => facebookSignInServices());
  locator.registerSingleton(UserServices());
  locator.registerFactory<GoogleMapService>(() => GoogleMapService());
}