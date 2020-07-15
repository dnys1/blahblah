import 'dart:ui';

import 'package:flutter/material.dart';

import 'core/models/models.dart';
import 'ui/views/views.dart';
import 'ui/helpers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => HomeView(),
      },
      onGenerateRoute: (settings) {
        var route;
        switch (settings.name) {
          case '/':
            route = HomeView();
            break;
          default:
            if (BlogDetailView.routeMatcher.hasMatch(settings.name)) {
              final id = BlogDetailView.routeMatcher
                  .firstMatch(settings.name)
                  .group(1);

              if (id.isNotEmpty) {
                route = BlogDetailView(id: id);
                break;
              }

              assert(settings.arguments != null && settings.arguments is Blog);
              final blog = settings.arguments as Blog;
              route = BlogDetailView(blog: blog);
              settings = RouteSettings(name: '/blog/' + blog.id);
              break;
            }
        }

        route ??= NotFoundView();

        final size = MediaQueryData.fromWindow(window).size.width;
        return MaterialPageRoute(
          builder: (context) => route,
          settings: settings,
          fullscreenDialog: size > UIHelpers.scaffoldBreakpoint,
        );
      },
    );
  }
}
