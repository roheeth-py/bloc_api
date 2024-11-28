import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/features/post/models/post_data_ui_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  Future<void> postInitialFetchEvent(PostInitialFetchEvent event, Emitter<PostState> emit) async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];

    try{
      var response = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      final List result = jsonDecode(response.body);
      for(int i=0; i<result.length; i++){
        PostDataUiModel post = PostDataUiModel.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      print(posts);
      emit(PostSuccessState(posts: posts));
    }catch (e){
      log(e.toString());
    }finally{
      client.close();
    }
  }
}
