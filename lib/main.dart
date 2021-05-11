import 'package:CWCFlutter/api/test_api.dart';

import 'package:CWCFlutter/controller/user_notifier.dart';
import 'package:CWCFlutter/l10n/l10n.dart';
import 'package:CWCFlutter/localization/myapp.dart';
import 'package:CWCFlutter/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserNotifier()),
        FutureProvider(
          create: (_) => getProfileUserName(),
          initialData: 'Loading Name...',
        ),
        StreamProvider(
          create: (_) => getSessionTime(),
          initialData: 0,
        )
      ],
      child: MyApp2(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static final String title = 'Localization';
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      allowFontScaling: false,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.amber),
          primarySwatch: Colors.yellow,
          backgroundColor: Colors.white,
        ),
        supportedLocales: L10n.all,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: HomePage(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   static final String title = 'Localization';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(color: Colors.amber),
//         primarySwatch: Colors.yellow,
//         backgroundColor: Colors.white,
//       ),
//       supportedLocales: L10n.all,
//       home: HomePage(),
//     );
//   }
// }
