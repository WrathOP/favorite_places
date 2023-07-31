import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  // final Function onSelectImage;
  final void Function(File image) onPickImage;


  ImageInput({super.key, required this.onPickImage});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _takeImage;


  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedImage == null) {
      return;
    }

    setState(() {
      _takeImage = File(pickedImage.path);
    });

    widget.onPickImage(_takeImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
        onPressed: _takePicture,
        icon: Icon(Icons.camera),
        label: Text('Take Picture'),
        style: TextButton.styleFrom(
          primary: Theme.of(context).colorScheme.onBackground,
        ));

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground,
          width: 1,
        ),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: _takeImage != null
          ? GestureDetector(
              onTap: _takePicture,
              child: Image.file(
                _takeImage!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            )
          : content,
    );
  }
}
