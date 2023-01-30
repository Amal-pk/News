import 'package:flutter/material.dart';

class HomePageTopContainer extends StatelessWidget {
  const HomePageTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text("data"),
          )
        ],
      ),
    );
  }
}
