import 'package:flutter/material.dart';

// Image.asset ,, AssetImage

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},

          icon: Icon(Icons.menu, color: Colors.deepOrange),
        ),
        centerTitle: true,
        title: Text(
          'My App',
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.deepOrange),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.deepOrange),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
                // image: DecorationImage(
                //   fit: BoxFit.cover,
                //   alignment: Alignment.center,
                //   image: AssetImage('assets/images.jpeg'),
                // ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey,
                //     spreadRadius: 6,
                //     blurRadius: 10,
                //     offset: Offset(5, 5),
                //   ),
                // ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://ichef.bbci.co.uk/ace/standard/1920/cpsprodpb/7a14/live/7c0b6fd0-d511-11f0-a892-01d657345866.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Ahmed Ali',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(fontSize: 24, color: Colors.deepOrange),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.facebook, color: Colors.blue),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.redAccent,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.snapchat, color: Colors.yellow),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.telegram, color: Colors.lightBlue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Click',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
