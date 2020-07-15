import 'package:flutter/material.dart';

import '../../core/models/models.dart';

class BlogDetailView extends StatelessWidget {
  static const route = '/blog/';
  static final routeMatcher = RegExp(r'^/blog/([\w-]*)$');

  final String id;
  final Blog blog;

  const BlogDetailView({this.blog, this.id});

  /// Whether the user has navigated to this blog via URL
  /// vs. via our UI (i.e. the Feed).
  bool get isStandalone => id != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !isStandalone,
        // leading: isStandalones
        //     ? IconButton(
        //         icon: Icon(Icons.home),
        //         onPressed: () {
        //           Navigator.of(context)..pop()..pop();
        //         },
        //       )
        //     : null,
        title: Text('blahblah'),
      ),
      body: Center(
        child: Text(blog?.title ?? id),
      ),
    );
  }
}
