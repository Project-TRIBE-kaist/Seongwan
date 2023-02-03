import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pratice/avatar.dart';
import 'package:pratice/constants/screen_size.dart';

import 'constants/common_size.dart';

class ProfileBody extends StatefulWidget {
  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTab _selectedTab = SelectedTab.Left;
  double _leftImagesPageMargin = 0;
  double _rightImagesPageMargin = size!.width;

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(common_gap),
                      child: Avatar(
                        size: 80,
                      ),
                    ),
                    Expanded(
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              _valueText('12'),
                              _valueText('568'),
                              _valueText('524'),
                            ]
                          ),
                          TableRow(
                            children:[
                              Text('',style: TextStyle(fontSize: 5),),
                              Text('',style: TextStyle(fontSize: 5),),
                              Text('',style: TextStyle(fontSize: 5),),
                            ]
                          ),
                          TableRow(
                            children: [
                              _labelText('Posts'),
                              _labelText('Followers'),
                              _labelText('Following'),
                            ]
                          ),
                        ],
                      ),
                    ),
                  ],

                ),
                _username(),
                _userBio(),
                _editProfileBtn(),
                _tabButtons(),
                _selectedIndicator(),
              ])
          ),
          _imagesPager()
        ],
      ),
    );
  }

  Text _valueText(String value) => Text(
    value,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontWeight: FontWeight.bold,
            fontSize: 20,
    ),
  );

  Text _labelText(String value) => Text(
    value,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
    ),
  );

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                transform: Matrix4.translationValues(_leftImagesPageMargin, 0, 0),
                curve: Curves.fastOutSlowIn,
                child: _images(),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                transform: Matrix4.translationValues(_rightImagesPageMargin, 0, 0),
                curve: Curves.fastOutSlowIn,
                child: _images(),
              ),
            ],
          )
        );
  }

  GridView _images() {
    return GridView.count(
                  crossAxisCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 1,
                children: List.generate(
                  30,
                      (index) => CachedNetworkImage(
                          fit: BoxFit.cover,
                            imageUrl: "https://picsum.photos/id/$index/100/100"),
                )
              );
  }

  Widget _selectedIndicator(){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      alignment: _selectedTab==SelectedTab.Left ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        height: 3,
        width: size!.width / 2,
        color: Colors.black87,
      ),
      curve: Curves.fastOutSlowIn,
    );
  }

  Row _tabButtons() {
    return Row(
                children: [
                  Expanded(
                    child: IconButton(
                        onPressed: (){
                          _tabSelected(SelectedTab.Left);
                        },
                        icon: ImageIcon(
                          AssetImage("assets/images/grid.png"),
                          color: _selectedTab==SelectedTab.Left ? Colors.black : Colors.black26,
                        ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: (){
                        _tabSelected(SelectedTab.Right);
                      },
                      icon: ImageIcon(
                        AssetImage("assets/images/saved.png"),
                        color: _selectedTab==SelectedTab.Right ? Colors.black : Colors.black26,
                      ),
                    ),
                  ),
                ],
              );
  }

  _tabSelected(SelectedTab selectedTab) {
    setState(() {
      switch (selectedTab) {
        case SelectedTab.Left:
          _selectedTab = SelectedTab.Left;
          _leftImagesPageMargin = 0;
          _rightImagesPageMargin = size!.width;
          break;
        case SelectedTab.Right:
          _selectedTab = SelectedTab.Right;
          _leftImagesPageMargin = -size!.width;
          _rightImagesPageMargin = 0;
          break;
      }
    });
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap,vertical: common_xxs_gap),
      child: SizedBox(
        height: 24,
        child: OutlinedButton(
          onPressed: (){},
          child: Text(
            'Edit Proflie',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.black45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
              )
          ),
        ),
      ),
    );
  }

  Widget _username(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
          'username',
          style: TextStyle(fontWeight: FontWeight.bold,)
      ),
    );
  }

  Widget _userBio(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
          'This is What I believe',
          style: TextStyle(fontWeight: FontWeight.w400,)
      ),
    );
  }
}

enum SelectedTab{Left,Right}