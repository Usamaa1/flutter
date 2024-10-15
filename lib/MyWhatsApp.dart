import 'package:flutter/material.dart';

class MyWhatsApp extends StatelessWidget {
  final String titleName;
  final String message;
  final String time;
  final String image;

  const MyWhatsApp(
      {super.key,
      required this.titleName,
      required this.message,
      required this.time,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      title: Text(titleName),
      subtitle: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.only(right: 10),
            child: Text(
              "1",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text(message)
        ],
      ),
      trailing: Column(
        children: [
          Text(time),
          Icon(
            Icons.done_all,
            color: Colors.blueAccent,
          )
        ],
      ),
      tileColor: const Color.fromARGB(255, 235, 235, 235),
    );
  }
}
