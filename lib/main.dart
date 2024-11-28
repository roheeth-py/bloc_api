import 'package:flutter/material.dart';
import 'package:untitled/features/post/ui/post_page.dart';

import 'features/home/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostPage(),
    );
  }
}
