import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

class ScreenAddPlace extends StatefulWidget {
  @override
  _ScreenAddPlaceState createState() => _ScreenAddPlaceState();
}

class _ScreenAddPlaceState extends State<ScreenAddPlace> {
  TextEditingController _titleController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: _layout(context),
    );
  }

  Widget _layout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(),
                ],
              ),
            ),
          ),
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Add Place'),
          onPressed: () {},
          elevation: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }
}
