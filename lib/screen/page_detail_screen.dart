import 'package:flutter/material.dart';
import 'package:lamphun_application/services/page_service.dart';

class PageDetailScreen extends StatefulWidget {
  final String id;
  const PageDetailScreen({super.key, required String this.id});

  @override
  State<PageDetailScreen> createState() => _PageDetailScreenState();
}

class _PageDetailScreenState extends State<PageDetailScreen> {
  dynamic _page = {};

  @override
void initState() {
  super.initState();
  PageService.fetchPage(widget.id).then((page) {
    setState(() {
      _page = page;
    });
  });
}

  @override
  Widget build(BuildContext context) {
    if (_page.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Page Detail'),),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(title: Text('Page Detail'),),
        body: Container(
          child: Text(_page['content']),
        ),
    );
  }
}