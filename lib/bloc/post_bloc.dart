import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:redditclone/model/post.dart';
import 'package:redditclone/repos/api_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<PostEvent>((event, emit) async {
      try {
        emit(PostLoading());
        final mList = await _apiRepository.fetchPost();
        emit(PostLoaded(mList));
      } on NetworkError {
        emit(const PostError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
