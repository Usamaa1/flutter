import 'package:flutter/material.dart';

class GridResponsive extends StatelessWidget {
  const GridResponsive({super.key});
  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Grid Responsive Example")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth < 600 ? 2 : 4, // 2 columns for mobile, 4 for tablet/desktop
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            color: Colors.blueAccent,
            child: Center(child: Text("Item $index", style: TextStyle(color: Colors.white))),
          );
        },
      ),
    );
  }
}