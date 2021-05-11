import 'package:CWCFlutter/api/test_api.dart';
import 'package:CWCFlutter/controller/user_notifier.dart';
import 'package:CWCFlutter/model/user.dart';
import 'package:CWCFlutter/screens/user_list_screen.dart';
import 'package:CWCFlutter/widget/button_p.dart';
import 'package:CWCFlutter/widget/input_p.dart';
import 'package:CWCFlutter/widget/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String _name;
  String _city;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("Home rebuilding");
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          context.watch<String>(),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Center(
            child: Selector<UserNotifier, int>(
              selector: (_, notifier) => notifier.age,
              builder: (_, age, __) => Text(
                age.toString(),
              ),
            ),
          )
        ],
        leading: Center(
          child: Text(
            context.watch<int>().toString(),
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureProvider(
                create: (_) => getCurrentTime(),
                initialData: "Loading Time",
                child: Consumer<String>(
                  builder: (_, timeString, __) => Text(
                    timeString,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CheetahInput(
                labelText: 'Name',
                onSaved: (String value) {
                  _name = value;
                },
              ),
              SizedBox(height: 16),
              CheetahInput(
                labelText: 'City',
                onSaved: (String value) {
                  _city = value;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheetahButton(
                    text: 'Add',
                    onPressed: () {
                      if (!_formKey.currentState.validate()) return;

                      _formKey.currentState.save();

                      context.read<UserNotifier>().addUser(User(_name, _city));
                      // addUser(User(_name, _city));
                    },
                  ),
                  SizedBox(width: 5),
                  CheetahButton(
                    text: 'List',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserListScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 5),
                  CheetahButton(
                    text: 'Age',
                    onPressed: () {
                      context.read<UserNotifier>().incrementAge();
                    },
                  ),
                  SizedBox(width: 5),
                  CheetahButton(
                    text: 'Height',
                    onPressed: () {
                      context.read<UserNotifier>().incrementHeight();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              UserList(),
            ],
          ),
        ),
      ),
    );
  }
}
