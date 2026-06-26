import 'package:ecommerce_admin_panel/app.dart';
import 'package:ecommerce_admin_panel/data/repositories/authentication/authentication_repositoary.dart';
import 'package:ecommerce_admin_panel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Initialize GETX local storage
  await GetStorage.init();

  /// REMOVE # SIGN FROM URL
  setPathUrlStrategy();

  ///FIREBASE INITIALIZED
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}
