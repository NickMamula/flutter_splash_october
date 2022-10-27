import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Image(image: AssetImage("assets/image/screen_login_image.png")),
            Text("Верхній рядок"),
            Text("Нижній рядок"),
            Row(
              children: [
                OutlinedButton(onPressed: () {}, child: Text("Login")),
                OutlinedButton(onPressed: () {}, child: Text("SignUp"))
              ],
            )
          ],
        ),
      ],
    ));
  }
}
