
import 'package:flutter/material.dart';

Widget buildSectionHeaderView(String title) {
  return Container(
    padding: EdgeInsets.only(left: 10.0),
    margin: EdgeInsets.only(bottom: 5, top: 10),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
