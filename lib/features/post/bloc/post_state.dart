part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class PostSuccessState extends PostState{
  final List<PostDataUiModel> posts;

  PostSuccessState({required this.posts});
}
