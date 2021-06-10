import 'package:flutter/material.dart';

Future<T> showTextDialog<T>(
    BuildContext context, {
      String title,
      String value,
    }) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        value: value,
      ),
    );

class TextDialogWidget extends StatefulWidget {
  final String title;
  final String value;

  const TextDialogWidget({
    Key key,
    this.title,
    this.value,
  }) : super(key: key);

  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<TextDialogWidget>  {
  String _chosenValue;

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.title),
    content: DropdownButton<String>(
      value: _chosenValue,
      //elevation: 5,
      style: TextStyle(color: Colors.black),

      items: <String>[
        'HS',
        'PT',
        'RT',

      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(
        "Cause ? ",
        style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      onChanged: (String value) {
        setState(() {
          _chosenValue = value;
        });
      },
    ),

    /*TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    ),*/
    actions: [
      ElevatedButton(
        child: Text('Done'),
        onPressed: () {
          print('value is  *------------------------> $_chosenValue');
          Navigator.of(context).pop(_chosenValue);
        }
      )
    ],
  );
}

