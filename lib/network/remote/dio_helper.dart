import 'package:dio/dio.dart';

class DioHelper{
static Dio? dio;
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ad7a03091c1a4254804e9b0251dbb4db
static init(){
  dio= Dio(
    BaseOptions(baseUrl: 'https://newsapi.org/',
    receiveDataWhenStatusError: true,
    )

  );
}

static Future<Response> getData({required String url,
required Map<String, dynamic>? query
})async{
return await dio!.get(url,queryParameters:query);
}

}