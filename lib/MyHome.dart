import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App bar'),
      ),
      body:
          // scrollDirection: Axis.horizontal,
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              // padding: EdgeInsets.only(left: 20, top: 10),
              // padding: EdgeInsets.all(20),
              // padding: EdgeInsets.fromLTRB(10, 19, 15, 20),
              // margin: EdgeInsets.only(bottom: 10),
              width: 100,
              height: 100,
              color: const Color.fromRGBO(169, 73, 247, 1),
              child: const Text(
                "Container 1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromRGBO(169, 73, 247, 1),
              child: const Text(
                "Container 2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromRGBO(169, 73, 247, 1),
              child: const Text(
                "Container 3",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            // Container(
            //   width: 100,
            //   height: 100,
            //   color: const Color.fromRGBO(169, 73, 247, 1),
            //   child: const Text(
            //     "Container 4",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
            // Container(
            //   width: 100,
            //   height: 100,
            //   color: const Color.fromRGBO(169, 73, 247, 1),
            //   child: const Text(
            //     "Container 5",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
            // Container(
            //   width: 100,
            //   height: 100,
            //   color: const Color.fromRGBO(169, 73, 247, 1),
            //   child: const Text(
            //     "Container 6",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
            // Container(
            //   width: 100,
            //   height: 100,
            //   color: Color.fromARGB(255, 247, 73, 209),
            //   child: const Text(
            //     "Container 7",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
