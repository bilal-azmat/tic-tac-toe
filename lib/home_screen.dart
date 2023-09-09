import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const  BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkTwk1we-SqsBHGT0u6bm6F2k0nJsJGB84416LVEMGsSeVNM8sRmM7xqzPybR_a1sMp4o&usqp=CAU")
          )
        ),
      ),
    );
  }
}
