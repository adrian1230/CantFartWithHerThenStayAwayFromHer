import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/model/data.dart';
import 'package:flutter_app/src/model/user_model.dart';

class Slot extends StatefulWidget {
  Slot({Key key}) : super(key: key);

  @override
  _Slot createState() => _Slot();
}

class _Slot extends State<Slot> {
  List<UserModel> userDataList;
  @override
  void initState() {
    userDataList = userMapList.map((x)=> UserModel.fromJson(x)).toList();
    super.initState();
  }
  Widget _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: Icon(
        Icons.short_text,
        size: 30,
        color: Colors.black,
      ),
      actions: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          child: Container(
            width: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: Image.asset("assets/images/bara.jpg", fit: BoxFit.fill),
          ),
        ),
        SizedBox(width:15)
      ],
    );
  }

  Widget _searchField() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 15,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: InputBorder.none,
          suffixIcon: SizedBox(
              width: 50,
              child: Icon(Icons.search, color: Colors.purple),
        ),
      ),
    )
   );
  }

  Widget _usersList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: Colors.black,
                  ),
              ),
              SizedBox(width: 3,)
            ],
          ),
          getuserWidgetList()
        ],
      ),
    );
  }
  Widget getuserWidgetList(){
    return Column(
        children: userDataList.map((x){
          return  _boxTile(x);
        }).toList()
    );
  }
  Widget _boxTile(UserModel model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              child: Image.asset(
                model.image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(model.name),
          subtitle: Text(
            model.type,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _searchField(),
              ],
            ),
          ),
          _usersList()
        ],
      ),
    );
  }
}