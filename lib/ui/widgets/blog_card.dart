import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/models/models.dart';
import 'responsive_builder.dart';

class BlogCard extends StatelessWidget {
  final User user;
  final Blog blog;

  const BlogCard({
    @required this.blog,
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    var child;
    if (size < 400) {
      child = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _Headline(blog.title),
          ),
          const SizedBox(height: 5),
          _Subhead(blog.subtitle),
        ],
      );
    } else {
      child = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Topic(blog.topic),
          const Spacer(),
          _Headline(blog.title),
          const Spacer(),
          _Subhead(blog.subtitle),
          const Spacer(flex: 3),
          _AuthorInfo(user),
        ],
      );
    }
    return AspectRatio(
      aspectRatio: 3,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(blog.thumbnail),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Topic extends StatelessWidget {
  final String topic;

  const _Topic(this.topic);

  Widget get empty => Container();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      breakpoint: 450,
      smallBuilder: (context) => empty,
      largeBuilder: (context) => topic == null
          ? empty
          : Text(
              topic,
              style: Theme.of(context).textTheme.caption,
            ),
    );
  }
}

class _Headline extends StatelessWidget {
  final String headline;

  const _Headline(this.headline);

  String _buildFittedText() {
    final length = min(headline.length, 36);
    var index = 0;
    var words = [];
    for (var word in headline.split(' ')) {
      words.add(word);
      index += word.length;
      if (index >= length) {
        break;
      }
    }

    var built = words.join(' ');
    var addEllispses = headline.length > built.length;

    return built + (addEllispses ? '...' : '');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: Theme.of(context).textTheme.headline6,
      maxLines: 3,
    );
  }
}

class _Subhead extends StatelessWidget {
  final String subtitle;

  const _Subhead(this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.caption,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final User user;

  const _AuthorInfo(this.user);

  String get name => '${user.firstName} ${user.lastName}';

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      breakpoint: 585,
      smallBuilder: (context) {
        return Text(
          name,
          style: Theme.of(context).textTheme.caption,
        );
      },
      largeBuilder: (context) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.profilePicture),
          ),
          title: Text(name),
          subtitle: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(user.email),
          ),
        );
      },
    );
  }
}
