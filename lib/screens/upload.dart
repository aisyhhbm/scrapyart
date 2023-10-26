import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  PlatformFile? pickedFile;
  String? imageUrl;
  String? thumbnailUrl;

  Future<void> uploadFile(File file) async {
    String fileName = file.path.split('/').last;
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(file);

    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    if (snapshot.state == TaskState.success) {
      thumbnailUrl = await storageReference.getDownloadURL();
      print('Thumbnail URL: $thumbnailUrl');
      setState(() {
        imageUrl = thumbnailUrl;
      });
    } else {
      print('Upload failed');
    }
  }

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      uploadFile(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pickedFile != null)
              Expanded(
                child: Container(
                  color: Colors.blue[100],
                  child: Image.file(
                    File(pickedFile!.path!),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                // Handle the file upload
                if (pickedFile != null) {
                  // You can use the 'imageUrl' here, which contains the download URL
                  print('File uploaded successfully. URL: $imageUrl');
                }
              },
              child: const Text('Upload File'),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: selectFile,
              child: const Text('Select File'),
            ),
          ],
        ),
      ),
    );
  }
}
