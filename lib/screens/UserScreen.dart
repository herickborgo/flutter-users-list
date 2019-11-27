import 'package:flutter/material.dart';

import 'package:my_first_app/models/User.dart';
import 'package:my_first_app/Services/UserService.dart';

class UserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserScreenState();
  }
}

class _UserScreenState extends State<UserScreen> {
  List<User> _items;

  _UserScreenState();

  UserService campaignService;

  @override
  void initState() {
    super.initState();
    campaignService = UserService();
    _items = [];
    this.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Users'),
      ),
      body: _items.length == 0
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, i) {
            return Card(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 124,
                      width: 124,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(_items[i].avatar),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(_items[i].name,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(_items[i].email,
                            style: TextStyle(
                                fontSize: 12
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  void fetchAll() {
    campaignService.fetchAll().then((onValue) {
      setState(() {
        _items = onValue;
        print(_items);
      });
    }).catchError((onError) {
      print('catchError: $onError');
    });
  }
}
