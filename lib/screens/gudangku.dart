import 'package:flutter/material.dart';
import 'package:firebase_art/utils/colors.dart';

class gudangkuScreen extends StatefulWidget {
  const gudangkuScreen({Key? key}) : super(key: key);

  @override
  _gudangkuScreenState createState() => _gudangkuScreenState();
}

class _gudangkuScreenState extends State<gudangkuScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Photographer"),
          backgroundColor: Color.fromARGB(255, 187, 166, 147),
        ),
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 44,
                      backgroundImage: AssetImage(
                        'assets/images/scrap.jpeg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Aisyah Beningsari Mahadi",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "rahmad17012003@gmail.com",
                        style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Color.fromARGB(43, 3, 3, 3), // Warna garis
                thickness: 1, // Ketebalan garis
                indent: 10, // Jarak awal garis dari sisi kiri
                endIndent: 0, // Jarak akhir garis dari sisi kanan
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "gudangku", // Gantilah dengan teks yang sesuai
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 173, 171, 171),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/scrap.jpeg', width: 110, height: 110),
                  Image.asset('images/foto.jpeg', width: 110, height: 110),
                  Image.asset('images/scrap.jpeg', width: 110, height: 110),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/foto.jpeg', width: 110, height: 110),
                  Image.asset('images/scrap.jpeg', width: 110, height: 110),
                  Image.asset('images/scrap.jpeg', width: 110, height: 110),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/scrap.jpeg', width: 110, height: 110),
                  Image.asset('images/scrap.jpeg', width: 110, height: 110),
                  Image.asset('images/foto.jpeg', width: 110, height: 110),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/scrap.jpeg', width: 110, height: 110),
                  Image.asset('images/foto.jpeg', width: 110, height: 110),
                  Image.asset('images/scrap.jpeg', width: 110, height: 110),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Scrapy Art',
          ),
        ]),
      ),
    );
  }
}
