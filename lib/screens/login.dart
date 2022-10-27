import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'secondaryMain.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController loginController = new TextEditingController();
  TextEditingController pswController = new TextEditingController();

  var _foo = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool? _checkBoxValue = false;

    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          body: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //секція картинка і два тайтла
                Image(
                  image: const AssetImage("assets/image/big_flutter_logo.png"),
                  height: size.height * 0.2,
                ),
                Text(
                  "Вхід в застосунок",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  "З вами світ краще",
                  style: Theme.of(context).textTheme.bodyText1,
                ),

                //секція вводу логін і пароль
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_box),
                          labelText: "Логін", //змінити якщо невірний Логін
                          hintText: "Введіть ваш логін",
                          //errorText: 'Невірний логін',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Поле не може бути пустим";
                          }
                          if (value != "admin") {
                            return "Ваш логін невірний";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        controller: loginController,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_rounded),
                          labelText: "Пароль", //змінити якщо невірний Пароль
                          hintText: "Введіть ваш пароль",
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Поле не може бути пустим";
                          }
                          if (value != "123456") {
                            return "Ваш пароль невірний";
                          }
                          return null;
                        },
                        controller: pswController,
                      ),
                      const SizedBox(height: 5),
                      CheckboxListTile(
                        title: Text(
                          "Запам'ятати мене.",
                        ),
                        secondary: Icon(Icons.beach_access),
                        controlAffinity: ListTileControlAffinity.platform,
                        activeColor: Colors.blue,
                        checkColor: Colors.black,
                        value: _foo,
                        onChanged: (bool? value) async {
                          //чек бокс стальная логіка
                          setState(() => _foo = value!);
                          if (_foo == true &&
                              _formKey.currentState!.validate()) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('secritCode', ' ');
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                var login = loginController.text;
                                var password = pswController.text;

                                if (login == "admin" && password == "123456") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SecondaryMain()),
                                  );
                                }
                              }

                              /*// Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }*/

                              /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );*/
                            },
                            child: Text("LOGIN")),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
