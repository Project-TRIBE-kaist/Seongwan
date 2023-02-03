import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pratice/avatar.dart';
import 'package:pratice/comment.dart';
import 'package:pratice/constants/common_size.dart';
import 'package:pratice/my_progress_indicator.dart';
import 'constants/screen_size.dart';

class Post extends StatelessWidget {
  final int number;

  Post(
      this.number,{
    super.key,});

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader(),
        _postImage(),
        _postActions(),
        _postLikes(),
        _postCaption(),
      ],
    );
  }

  Widget _postCaption(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap, vertical: common_gap),
      child: Comment(
        showImage: false,
        username: 'testingUser',
        text: 'I have money.',
      ),
    );
  }
  Padding _postLikes() {
    return Padding(
        padding: const EdgeInsets.only(left: common_gap),
        child: Text(
          '12000 Likes',
          style: TextStyle(fontWeight: FontWeight.bold),),
      );
  }

  Row _postActions() {
    return Row(
        children: <Widget>[
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/images/bookmark.png'),)
          ),
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/images/comment.png'),)
          ),
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/images/direct_message.png'),)
          ),
          Spacer(),
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/images/heart_selected.png'),)
          ),
        ],
      );
  }

  Widget _postHeader(){
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: Avatar(),
        ),
        Expanded(child: Text('username')),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black87,
            )
        )
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
          imageUrl: "https://picsum.photos/id/$number/2000/2000",
          placeholder: (BuildContext context, String url){
            return MyProgressIndicator(containerSize: size?.width,);
          },// place holder
          imageBuilder: (BuildContext context, ImageProvider imageProvider){
            return AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                  ),
                ),
            );
          },
      );
  }
}


