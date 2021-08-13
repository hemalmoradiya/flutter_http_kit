import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_kit/http_kit.dart';
import 'package:http_provider/src/Model/post_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoader = true;
  PostModel _posts;
  @override
  void initState() {
    super.initState();
    _getPost();
  }

  Future _getPost() async {
    const String url = 'https://jsonplaceholder.typicode.com/posts';
    final RequestResponse _response = await HttpKit.get(url);
    print(_response);
    _posts = PostModel.fromJson(_response.data);
    _isLoader = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Kit'),
      ),
      body: _showList(),
    );
  }

  Widget _showList() {
    switch (_isLoader) {
      case true:
        return _loader();
      default:
        return _listView();
    }
  }

  Widget _loader() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: _posts.postList.length,
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Text(_posts.postList[index].title),
        );
      },
    );
  }
}
