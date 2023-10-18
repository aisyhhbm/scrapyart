import 'package:flutter/material.dart';

class Kirim extends StatefulWidget {
  const Kirim({super.key});

  @override
  State<Kirim> createState() => _KirimState();
}

class _KirimState extends State<Kirim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(onPressed: () {}, child: Text('Upload File')),
          )
        ],
      ),
    );
  }
}
