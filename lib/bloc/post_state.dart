part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final Post postModel;
  const PostLoaded(this.postModel);
}

class PostError extends PostState {
  final String? message;
  const PostError(this.message);
}
