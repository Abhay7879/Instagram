import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://webneel.com/wallpaper/sites/default/files/images/08-2018/3-nature-wallpaper-mountain.jpg',
            ),
            radius: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'username',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'some description to insert',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '21/01/2023',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.favorite,
              size: 15,
            ),
          )
        ],
      ),
    );
  }
}
