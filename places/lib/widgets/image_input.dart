import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function pickHandler;

  ImageInput(this.pickHandler);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No Image'),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text(
              'Take Picture',
              textAlign: TextAlign.center,
            ),
            textColor: Theme.of(context).primaryColor,
            onPressed: _takePicutre,
          ),
        ),
      ],
    );
  }

  Future<void> _takePicutre() async {
    final File imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) return;
    setState(() {
      _storedImage = imageFile;
    });
    final Directory appDir = await syspath.getApplicationDocumentsDirectory();
    final String fileName = path.basename(imageFile.path);
    final File savedImage = await imageFile.copy('${appDir.path}/$fileName');
    widget.pickHandler(savedImage);
  }
}
