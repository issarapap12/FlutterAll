import 'package:CWCFlutter/l10n/l10n.dart';
import 'package:CWCFlutter/localization/pages/main_page.dart';
import 'package:CWCFlutter/localization/provider/locale_provider.dart';
import 'package:CWCFlutter/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp2 extends StatelessWidget {
  static final String title = 'Localization';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: title,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.deepPurple.shade100,
              appBarTheme: AppBarTheme(color: Colors.amber),
              primarySwatch: Colors.yellow,
              backgroundColor: Colors.white,
            ),
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: HomePage(),
          );
        },
      );
}

// class MyApp extends StatelessWidget {
//   static final String title = 'Localization';
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: Size(375, 812),
//       allowFontScaling: false,
//       builder: () => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(
//           appBarTheme: AppBarTheme(color: Colors.amber),
//           primarySwatch: Colors.yellow,
//           backgroundColor: Colors.white,
//         ),
//         supportedLocales: L10n.all,
//         localizationsDelegates: [
//           AppLocalizations.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//         ],
//         home: HomePage(),
//       ),
//     );
//   }
// }
