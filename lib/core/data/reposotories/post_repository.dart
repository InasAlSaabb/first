import 'package:dartz/dartz.dart';
import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/apis/post_model.dart';
import '../models/common_response.dart';
import '../network/endpoints/post_endpoints.dart';
import '../network/network_config.dart';

class  PostRepository {

  Future<Either<String,List<PostModel>>>getAll() async{
    try{
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
         url: PostEndpoints.getAll,
      headers: NetworkConfig.getHeaders(needAuth: false,  type: RequestType.GET,),
     
      ).then((response){
        CommonResponse<List<dynamic>> commonResponse=CommonResponse.fromJson(response);
        if(commonResponse.getStatus){
          List<PostModel> resultList=[];
commonResponse.data!.forEach((element){
  resultList.add(PostModel.fromJson(element));
},);
return Right(resultList);
        }
        else{
          return Left(commonResponse.message??'');
        }
      });
 

    }
    catch(e){
return Left(e.toString());
    }
  }
  Future<Either<String,PostModel>>CreatePost

    ({
  
    required String title,
    required String body,
    required int userId
  })
   async{
    
    try{
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
         url:PostEndpoints.create,
      headers: NetworkConfig.getHeaders(needAuth: false,
        type: RequestType.POST,),
          body: {
        'title':title,
        'body':body,
        'userId':userId
      }
     
      ).
      
      then((response){
        CommonResponse<Map<String,dynamic>> commonResponse=CommonResponse.fromJson(response);
        if(commonResponse.getStatus){
     
return Right(PostModel());
        }
        else{
          return Left(commonResponse.message??'');
        }
      });
 

    }
    catch(e){
return Left(e.toString());
    }
  }

  Future<Either<String,PostModel>>DeletePost

    (int id)
   async{
    
    try{
      return NetworkUtil.sendRequest(
        type: RequestType.DELETE,
         url:PostEndpoints.delete+id.toString(),
      headers: NetworkConfig.getHeaders(needAuth: false,
        type: RequestType.DELETE
        ,),
      ).
      
      then((response){
        CommonResponse<Map<String,dynamic>> commonResponse=CommonResponse.fromJson(response);
        if(commonResponse.getStatus){
          // List<SocialHubModel> resultList=[];
return Right(PostModel());
        }
        else{
          return Left(commonResponse.message??'');
        }
      });
 

    }
    catch(e){
return Left(e.toString());
    }
  }

  Future<Either<String,PostModel>>UpdatePost

    ({
  required int id,
    required String title,
    required String body,
    required int userId
  })
   async{
    
    try{
      return NetworkUtil.sendRequest(
        type: RequestType.PUT,
         url:PostEndpoints.update+id.toString(),
      headers: NetworkConfig.getHeaders(needAuth: false,
        type: RequestType.PUT,),
          body: {
        'title':title,
        'body':body,
        'userId':userId,
        'id':id
      }
     
      ).
      
      then((response){
        CommonResponse<Map<String,dynamic>> commonResponse=CommonResponse.fromJson(response);
        if(commonResponse.getStatus){
          // List<SocialHubModel> resultList=[];
return Right(PostModel());
        }
        else{
          return Left(commonResponse.message??'');
        }
      });
 

    }
    catch(e){
return Left(e.toString());
    }
  }

}