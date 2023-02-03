import 'package:flutter/material.dart';
import 'package:pratice/avatar.dart';

import 'constants/common_size.dart';

class Comment extends StatelessWidget {

  final bool showImage;
  final String username;
  final String text;
  final DateTime? dateTime;

  const Comment({
    super.key, this.showImage=true, required this.username, required this.text, this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(showImage)
          Avatar(size: 24,),
        if(showImage)
          SizedBox(width: common_xxs_gap,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: username,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                        text: text,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ]
                )
            ),
            if(dateTime != null)
              Text(
              dateTime!.toIso8601String(),
              style: TextStyle(color: Colors.grey[400], fontSize: 10),
            )
          ],
        ),
      ],
    );
  }
}
