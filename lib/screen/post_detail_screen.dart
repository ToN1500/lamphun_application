import 'package:flutter/material.dart';
import 'package:lamphun_application/services/post_service.dart';

class PostDetailScreen extends StatefulWidget {
  final String id;
  const PostDetailScreen({super.key, required String this.id});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  dynamic _post = {};
  @override
  void initState() {
  super.initState();
  PostService.fetchPost(widget.id).then((page) {
    setState(() {
      _post = page;
    });
  });
}
  Widget build(BuildContext context) {
    if (_post.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Page Detail'),),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Detail'),
      ),
      body: Container(
        child: Text(_post['content']),
      ),
    );
  }
}
