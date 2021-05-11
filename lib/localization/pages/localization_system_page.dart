import 'package:CWCFlutter/localization/myapp.dart';
import 'package:CWCFlutter/localization/provider/locale_provider.dart';
import 'package:CWCFlutter/localization/widgets/language_picker_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LocalizationSystemPage extends StatefulWidget {
  @override
  _LocalizationSystemPageState createState() => _LocalizationSystemPageState();
}

class _LocalizationSystemPageState extends State<LocalizationSystemPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<LocaleProvider>(context, listen: false);

      provider.clearLocale();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text(MyApp2.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LanguageWidget(),
              SizedBox(height: 32),
              Text(
                AppLocalizations.of(context).language,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                AppLocalizations.of(context).helloWorld,
                style: TextStyle(fontSize: 36),
              ),
            ],
          ),
        ),
      );
}
