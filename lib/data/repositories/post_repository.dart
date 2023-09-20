
import 'package:api_using_bloc_dio/data/models/post_model.dart';
import 'package:api_using_bloc_dio/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository {

  API api = API();

  Future< List<PostModel> > fetchPost() async {

    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch (ex) {
      throw ex;
    }

  }


}