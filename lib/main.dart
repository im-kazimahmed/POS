import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pos/providers/message_provider.dart';
import 'package:pos/providers/notification_provider.dart';
import 'package:pos/providers/settings_provider.dart';
import 'package:pos/providers/store_provider.dart';
import 'package:pos/screens/activation_screen.dart';
import 'package:pos/screens/prototype_welcome.dart';
import 'package:pos/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:pos/constant/constants.dart';

import 'providers/app_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/food_screen_provider.dart';
import 'screens/main_screen.dart';
import 'package:flutter/gestures.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_) => runApp(const MyApp()));
  // runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'POS',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => StoreProvider()..loadStore()),
          ChangeNotifierProvider(create: (context) => MenuAppProvider()),
          ChangeNotifierProvider(create: (context) => FoodScreenProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => MessageProvider()),
          ChangeNotifierProvider(create: (_) => NotificationProvider()),
          ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ],
        child: Consumer<StoreProvider>(
          builder: (context, storeProvider, _) {
            return LoginScreen();
            // return MainScreen();
            // return PrototypeWelcome();
            // return storeProvider.isActivated ? MainScreen() : const ActivationScreen();
          },
        ),
      ),
    );
  }
}
