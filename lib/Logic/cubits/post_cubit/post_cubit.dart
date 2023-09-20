import 'package:api_using_bloc_dio/Logic/cubits/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/post_model.dart';
import '../../../data/repositories/post_repository.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super( PostLoadingState() ){
    fetchPosts();
  }

  PostRepository postRepository = PostRepository();
  
  void fetchPosts() async{
    try {
      List<PostModel> postModels = await postRepository.fetchPost();
      emit(PostLoadedState(postModels));
    } catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }
}