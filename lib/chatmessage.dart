// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {super.key,
      required this.text,
      required this.sender,
      this.isImage = false});

  final String text;
  final String sender;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return sender == "user"
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: Container(
                    margin: EdgeInsets.only(left: 30, bottom: 5, top: 10),
                    // margin:
                    //     EdgeInsets.only(left: 30, top: 10, bottom: 5, right: 3),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 111, 255, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        text.replaceFirst("\n\n", ''),
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
              SizedBox(
                width: 10.0,
              ),
              Image.asset(
                'assets/images/user-placeholder.png',
                height: 25.0,
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10.0,
              ),
              Image.asset(
                'assets/images/robot.png',
                height: 25.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: Container(
                    margin: EdgeInsets.only(bottom: 5, right: 30),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        text.replaceAll("\n\n", ''),
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    )),
              ),
            ],
          ).py8();
  }
}
