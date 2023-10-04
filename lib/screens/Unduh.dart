import 'package:flutter/material.dart';

class UnduhScreen extends StatefulWidget {
  const UnduhScreen({Key? key}) : super(key: key);

  @override
  _UnduhScreenState createState() => _UnduhScreenState();
}

class _UnduhScreenState extends State<UnduhScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScrapyBook',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 148, 72, 0),
          title: Text(
            "Unduh Photo",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(
                  255, 250, 249, 249), // Ubah warna ikon menjadi merah
              size: 30.0, // Ubah ukuran ikon
            ),
            onPressed: () {
              // Tambahkan logika ketika ikon close ditekan+
              // Misalnya, untuk menutup halaman profil setting
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            // Ikon check (centang)
            IconButton(
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(
                    255, 254, 254, 255), // Ubah warna ikon menjadi hijau
                size: 35.0, // Ubah ukuran ikon
              ),
              onPressed: () {
                // Tambahkan logika ketika ikon check ditekan
                // Misalnya, untuk menyimpan perubahan pengaturan
              },
            ),
          ],
        ),
        // Isi halaman ditambahkan di sini
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16), // Spacer
            Image.asset(
              'assets/images/logo.png',
              width: 450,
              height: 238, // Ubah tinggi sesuai kebutuhan Anda
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 156, 89, 74),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Ubah radius sesuai kebutuhan
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Edit Kembali",
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  height: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 156, 89, 74),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Ubah radius sesuai kebutuhan
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Ngorder",
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Bagikan", // Gantilah dengan teks yang sesuai
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 173, 171, 171),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Instagram.png',
                      width: 50, // Atur lebar gambar sesuai kebutuhan Anda
                      height: 50, // Atur tinggi gambar sesuai kebutuhan Anda
                    ),
                    // Tambahkan gambar dan tombol sosial media lainnya di sini
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/facebook.png',
                      width: 25, // Atur lebar gambar sesuai kebutuhan Anda
                      height: 25, // Atur tinggi gambar sesuai kebutuhan Anda
                    ),
                    // Tambahkan gambar dan tombol sosial media lainnya di sini
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Wa.png',
                      width: 32, // Atur lebar gambar sesuai kebutuhan Anda
                      height: 32, // Atur tinggi gambar sesuai kebutuhan Anda
                    ),
                    // Tambahkan gambar dan tombol sosial media lainnya di sini
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google_logo.png',
                      width: 25, // Atur lebar gambar sesuai kebutuhan Anda
                      height: 25, // Atur tinggi gambar sesuai kebutuhan Anda
                    ),
                    // Tambahkan gambar dan tombol sosial media lainnya di sini
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Link1.png',
                      width: 25, // Atur lebar gambar sesuai kebutuhan Anda
                      height: 25, // Atur tinggi gambar sesuai kebutuhan Anda
                    ),
                    // Tambahkan gambar dan tombol sosial media lainnya di sini
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
