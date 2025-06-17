import 'package:flutter/material.dart';

selectOptionImageDialog(
  BuildContext context,
  Function() pickImage,
  Function() pickPhoto,
) => showDialog(
  context: context,
  builder:
      (BuildContext context) => AlertDialog(
        title: Text('Selecciona una opcion'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              pickImage();
            },
            child: Text('Galeria', style: TextStyle(color: Colors.black)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              pickPhoto();
            },
            child: Text('Camara', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
);
