import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Untitled.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Align(
        alignment: FractionalOffset(
            0.5, 0.1), // Adjust the second value to move the text up or down
        child: Text(
          'Cyber Styles',
          style: TextStyle(
            fontSize: 40, // Set the desired font size
            color: Color.fromARGB(255, 219, 182, 18), // Set the text color
            fontWeight: FontWeight.bold, // Set the font weight if needed
          ),
        ),
      ),
      Align(
        alignment: FractionalOffset(-0.3, 0.2), // Adjust to position Eat!.png
        child: Image.asset(
          "images/Eat!.png",
          width: 250, // Set desired width
          height: 100, // Set desired height
        ),
      ),
      Align(
        alignment: FractionalOffset(0.0, 0.3), // Adjust to position Sleep!.png
        child: Image.asset(
          "images/Sleep!.png",
          width: 250, // Set desired width
          height: 90, // Set desired height
        ),
      ),
      Align(
        alignment:
            const FractionalOffset(0.0, 0.4), // Adjust to position Shop!.png
        child: Image.asset(
          "images/Shop!.png",
          width: 200, // Set desired width
          height: 65, // Set desired
        ),
      ),
      Align(
        alignment: FractionalOffset(0.9, 0.6), // Adjust to position Sleep!.png
        child: Image.asset(
          "images/Square.png",
          width: 300, // Set desired width
          height: 300, // Set desired height
        ),
      ),
      Align(
        alignment: FractionalOffset(0.1, 0.9), // Adjust to position Sleep!.png
        child: Image.asset(
          "images/Rectangle 13.png",
          width: 300, // Set desired width
          height: 300, // Set desired height
        ),
      ),
      Align(
        alignment: FractionalOffset(0.1, 0.9), // Adjust to position Sleep!.png
        child: Image.asset(
          "images/FOCUSEXTREME 1.png",
          width: 300, // Set desired width
          height: 300, // Set desired height
        ),
      ),
      Align(
        alignment: FractionalOffset(0.9, 0.6), // Adjust to position Sleep!.png
        child: Image.asset(
          "images/image 2.png",
          width: 300, // Set desired width
          height: 300, // Set desired height
        ),
      ),
      Align(
        alignment: FractionalOffset(0.5, 1.1), // Adjust to position Sleep!.png
        child: Image.asset(
          "images/Rectangle 11.png",
          width: 300, // Set desired width
          height: 300, // Set desired height
        ),
      ),
      Align(
        alignment:
            FractionalOffset(-0.2, 1.10), // Adjust to position Sleep!.png
        child: Image.asset(
          "images/Home Page.png",
          width: 300, // Set desired width
          height: 300, // Set desired height
        ),
      ),
      Align(
        alignment: FractionalOffset(0.3, 1.10), // Adjust to position Sleep!.png
        child: Image.asset(
          "images/Search.png",
          width: 300, // Set desired width
          height: 300, // Set desired height
        ),
      ),
      Align(
        alignment: FractionalOffset(0.8, 1.10), // Adjust to position Sleep!.png
        child: Image.asset(
          "images/Heart.png",
          width: 300, // Set desired width
          height: 300, // Set desired height
        ),
      ),
      Align(
        alignment:
            FractionalOffset(1.30, 1.10), // Adjust to position Sleep!.png
        child: Image.asset(
          "images/Add Shopping Cart.png",
          width: 300, // Set desired width
          height: 300, // Set desired height
        ),
      ),
    ]));
  }
}
