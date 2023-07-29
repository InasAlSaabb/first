import 'package:dartz/dartz.dart';
import 'package:quiz/core/data/models/apis/photo_model.dart';
import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/common_response.dart';
import '../network/endpoints/photo.endpoints.dart';
import '../network/network_config.dart';
class  PhotoRepository {

  Future<Either<String,List<PhotoModel>>>getAll() async{
    try{
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
         url:PhotoEndpoints.getAll,
      headers: NetworkConfig.getHeaders(needAuth: false,  type: RequestType.GET,),
     
      ).then((response){
        CommonResponse<List<dynamic>> commonResponse=CommonResponse.fromJson(response);
        if(commonResponse.getStatus){
          List<PhotoModel> resultList=[];
commonResponse.data!.forEach((element){
  resultList.add(PhotoModel.fromJson(element));
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
}