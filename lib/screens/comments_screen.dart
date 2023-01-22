import 'package:flutter/material.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/providers/user_provider.dart';
import 'package:insta_clone/resources/firestore_methods.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/comment_screen.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  final snap;
  const CommentsScreen({super.key, required this.snap});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text('Comments'),
        centerTitle: false,
      ),
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  user.photoUrl,
                ),
                radius: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Comments as ${user.username}',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await FirestoreMethods().PostComment(
                      widget.snap['postId'],
                      _commentController.text,
                      user.uid,
                      user.username,
                      user.photoUrl);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Post",
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
