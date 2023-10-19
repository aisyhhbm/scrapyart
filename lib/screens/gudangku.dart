import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package

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
        primarySwatch: Colors.blue, // Menggunakan warna biru sebagai contoh
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
                      backgroundImage: AssetImage('assets/images/scrap.jpeg'),
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
                color: Color.fromARGB(43, 3, 3, 3),
                thickness: 1,
                indent: 10,
                endIndent: 0,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "gudangku",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 173, 171, 171),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('imageURLs')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.builder(
                      itemCount: snapshot.data.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(3),
                          child: Image.network(
                            snapshot.data.docs[index]['url'],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Text('Error Loading Image');
                            },
                          ),
                        );
                      }, 
                    );
                  },
                ),
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
