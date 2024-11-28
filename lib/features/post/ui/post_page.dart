import 'package:flutter/material.dart';
import 'package:untitled/features/post/bloc/post_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  PostBloc postBloc = PostBloc();

  @override
  void initState() {
    // TODO: implement initState
    postBloc.add(PostInitialFetchEvent());
    super.initState();
  }
  @override
  void dispose() {
    postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Page"),),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch(state.runtimeType){
            case PostSuccessState:
              var result  = state as PostSuccessState;
              return ListView.builder(itemCount: result.posts.length, itemBuilder: (ctx, item){
                return ListTile(
                  title: Text(result.posts[item].title),
                );
              });
            default:
              return Text("data");
          }
        },
      ),
    );
  }
}
