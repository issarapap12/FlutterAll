import 'package:CWCFlutter/api/test_api.dart';

import 'package:CWCFlutter/controller/user_notifier.dart';
import 'package:CWCFlutter/screens/home.dart';
import 'package:CWCFlutter/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
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
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      allowFontScaling: false,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.amber),
          primarySwatch: Colors.yellow,
          backgroundColor: Colors.white,
        ),
        home: HomePage(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(color: Colors.amber),
//         primarySwatch: Colors.yellow,
//         backgroundColor: Colors.white,
//       ),
//       home: HomePage(),
//     );
//   }
// }
