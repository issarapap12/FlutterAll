import 'package:CWCFlutter/api/test_api.dart';

import 'package:CWCFlutter/controller/user_notifier.dart';
import 'package:CWCFlutter/localization/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
