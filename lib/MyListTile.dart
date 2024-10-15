import 'package:flutter/material.dart';
import 'package:myapp/MyWhatsApp.dart';

class MylistTile extends StatelessWidget {
  const MylistTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        MyWhatsApp(
          titleName: "Usama Riaz",
          message: "Kidhar hoo",
          time: "11:00 Am",
          image:
              "https://plus.unsplash.com/premium_photo-1664536392779-049ba8fde933?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ),
        MyWhatsApp(
          titleName: "Zahid Khan",
          message: "Bahir aooo",
          time: "10:00 Am",
          image:
              "https://images.unsplash.com/photo-1722322426803-101270837197?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ),
        MyWhatsApp(
          titleName: "Ayaan Sheikh",
          message: "Khana tyaar hai",
          time: "03:00 Pm",
          image:
              "https://images.unsplash.com/photo-1669475576662-af6f022dad1a?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ),
        MyWhatsApp(
          titleName: "Talha Raees",
          message: "Cow Mandi ajao",
          time: "06:00 Am",
          image:
              "https://images.unsplash.com/photo-1669475535925-a011d7c31d45?q=80&w=1372&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ),
      ],
    )));
  }
}
