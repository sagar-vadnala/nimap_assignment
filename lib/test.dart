import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                color: Colors.amber,
              ),
              Container(
                height: 150,
                color: Colors.lightBlue,
              ),
            ],
          ),
          Positioned(
            top: 130,
            left: 5,
            right: 100,
            bottom: 500,
            // bottom: 5,
              child: Card(
            elevation: 5,
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0,left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("data",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      Icon(Icons.favorite)
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text("data"),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}


