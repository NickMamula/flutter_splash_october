import 'package:flutter/material.dart';

class SecondaryMain extends StatelessWidget {
  const SecondaryMain({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Container(

          padding: EdgeInsetsDirectional.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Вітаю!",
                style:  TextStyle(fontStyle: FontStyle.italic,fontSize: 60),
                textAlign: TextAlign.center,
              ),
              Image(
                image:
                const AssetImage("assets/image/big_flutter_logo.png"),
                height: size.height * 0.7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
