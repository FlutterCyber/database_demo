import 'package:database_demo/model/user_model.dart';
import 'package:database_demo/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void doLogin() {
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user = User(username: username, password: password);
    HiveDB().storeUser(user);
    var user2 = HiveDB().loadUser();
    print(user2.username);
    print(user2.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: "User name",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                hintText: "User name",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                doLogin();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
