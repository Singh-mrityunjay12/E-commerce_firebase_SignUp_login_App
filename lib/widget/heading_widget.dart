import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/appContrant.dart';

class Heading_Widget extends StatefulWidget {
  //reusable widget
  //ye variable ham log isliye bana rahe h ki is widjet hame bar bar use karana padega jisase ham value ko change kar skate h
  final String headingTitle;
  final String headingSubTitle;
  final VoidCallback onTap;
  final String buttonText;
  Heading_Widget(
      {Key? key,
      required this.headingTitle,
      required this.headingSubTitle,
      required this.onTap,
      required this.buttonText})
      : super(key: key);

  @override
  State<Heading_Widget> createState() => _Heading_WidgetState();
}

class _Heading_WidgetState extends State<Heading_Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.headingTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  widget.headingSubTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: widget.onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.buttonText,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                        color: AppConstant.appScendoryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
