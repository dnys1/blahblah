import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('blahblah'),
      ),
      body: Center(
        child: Text('Route not found'),
      ),
    );
  }
}
