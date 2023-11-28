import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: GudangkuScreen(),
    ),
  );
}

class GudangkuScreen extends StatefulWidget {
  const GudangkuScreen({Key? key}) : super(key: key);

  @override
  _GudangkuScreenState createState() => _GudangkuScreenState();
}

class _GudangkuScreenState extends State<GudangkuScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final firestoreService = FirestoreService();
  final userCollection = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color.fromARGB(255, 187, 166, 147),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser?.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Map<String, dynamic> userData =
                (snapshot.data!.data() as Map<String, dynamic>?) ?? {};
            return Padding(
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
                          radius: 38,
                          backgroundImage:
                              AssetImage('assets/images/scrap.jpeg'),
                          //profile
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onDoubleTap: () => editField('profile'),
                            child: Text(
                              '${userData['username']}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'Email: ${currentUser?.email}',
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
                          .collection('videoDetails')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          List<QueryDocumentSnapshot> documents =
                              snapshot.data!.docs;

                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Number of columns
                                childAspectRatio: 0.6, // Aspect ratio
                              ),
                              itemCount: documents.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic>? data = documents[index]
                                    .data() as Map<String, dynamic>?;
                                String thumbnailUrl =
                                    data?['thumbnailUrl'] ?? '';

                                return GestureDetector(
                                  onLongPress: () {
                                    // Show the context menu when long-pressed
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CupertinoContextMenu(
                                          actions: <Widget>[
                                            CupertinoContextMenuAction(
                                              onPressed: () {
                                                firestoreService.deleteImage(
                                                    documents[index].id);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return GudangkuScreen();
                                                    },
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                'Delete',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                          child: Center(
                                            child: Container(
                                              width: 400,
                                              height: 400,
                                              child:
                                                  Image.network(thumbnailUrl),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.network(thumbnailUrl),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return Center(child: Text('No data available'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No user data available'));
          }
        },
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
    );
  }

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: Text(
            "Edit $field",
            style: const TextStyle(color: Colors.white),
          ),
          content: TextFormField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              newValue = value;
            },
          ),
          actions: [
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text('Save', style: TextStyle(color: Colors.white)),
              onPressed: () => Navigator.of(context).pop(newValue),
            ),
          ],
        );
      },
    );
  }
}

class FirestoreService {
  final videoDetails = FirebaseFirestore.instance.collection('videoDetails');

  Future<void> deleteImage(String docID) {
    return videoDetails.doc(docID).delete();
  }
}
