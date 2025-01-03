import 'package:flutter/material.dart';

class ExpandedFlexible extends StatelessWidget {
  const ExpandedFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    print(size);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Container(
            //   width: 100,
            //   color: Colors.red,
            //   child: Center(
            //     child: Text(
            //       "Fixed Height (100)",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // ),
            // Flexible(
            //   child: Container(
            //     width: 100,
            //     color: const Color.fromARGB(255, 243, 33, 243),
            //     child: Center(
            //       child: Text(
            //         "Flexible Height",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),
            // Expanded(
            //   child: Container(
            //     width: 100,
            //     color: Colors.blue,
            //     child: Center(
            //       child: Text(
            //         "Expanded Height",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
