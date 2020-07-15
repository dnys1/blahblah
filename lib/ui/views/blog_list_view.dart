import 'package:flutter/material.dart';

import '../../core/data/mock_blogs.dart';
import '../../core/data/mock_users.dart';
import '../widgets/blog_card.dart';

class BlogListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 650,
        ),
        child: ListView(
          children: mockBlogs.map((blog) {
            final user =
                mockUsers.firstWhere((user) => blog.authorId == user.id);
            return BlogCard(blog: blog, user: user);
          }).toList(),
        ),
      ),
    );
  }
}

class BlogGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            int count = constraints.maxWidth ~/ 650;
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: count * 650.0,
              ),
              child: GridView.count(
                crossAxisCount: count,
                childAspectRatio: 3,
                children: mockBlogs.map((blog) {
                  final user =
                      mockUsers.firstWhere((user) => blog.authorId == user.id);
                  return BlogCard(blog: blog, user: user);
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
