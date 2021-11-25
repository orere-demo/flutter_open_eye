import 'dart:convert';
import 'package:demo2_eye/config/url_config.dart';

// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';

class HttpResponse {
  static BaseOptions _options = BaseOptions(
      // baseUrl: UrlConfig.baseUrl,
      // 打开超时时间
      connectTimeout: 5000000,
      // 接收超时时间
      receiveTimeout: 3000000
  );

  // 创建Dio实例
  static Dio _dio = Dio(_options);

  // _request核心函数，所有请求都走这里
  static Future _request(String path, {String? method = 'get', Map? params, data }) async{
    if(params != null){
      params.forEach((key, value) {
        if(path.indexOf(key) != -1){
          // path 是这样吗 : '/api/xxx?name=:name&age=:age'
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }

    // 日志v 只在debug模式输出
    LogUtil.v(data, tag: '发送的数据为：');

    try {
      // 以application/x-www-form-urlencoded格式发送数据
      // print('$path$data$method');
      Response response = await _dio.request(path, data: data, options: Options(method: method));
      if (response.statusCode == 200) { //  || response.statusCode == 201
        // print('${response.data}');
        try{
          String dataStr = json.encode(response.data);
          var data = json.decode(dataStr);
          return data;
        } catch(e){
          return Future.error('解析响应数据异常$e');
        }
      } else{
        LogUtil.v(response.statusCode, tag: 'HTTP错误，状态码为：');
        // _handleHttpError(response.statusCode!);
        return Future.error(_handleHttpError(response.statusCode!));
      }
    } on DioError catch (e, s) {
      LogUtil.v(_dioError(e), tag: '请求异常：');
      return Future.error(_dioError(e));
    } catch(e, s){
      LogUtil.v(e, tag: '===未知异常1===');
      return Future.error('===未知异常===');
    }
  }

  // 处理Dio异常
  static String _dioError(DioError error){
    switch(error.type){
      case DioErrorType.connectTimeout:
        return "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.receiveTimeout:
        return "服务器异常，请稍后重试！";
        break;
      case DioErrorType.sendTimeout:
        return "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.response:
        return "服务器异常，请稍后重试！";
        break;
      case DioErrorType.cancel:
        return "请求已被取消，请重新请求";
        break;
      case DioErrorType.other:
        return "网络异常，请稍后重试！";
        break;
      default:
        return "Dio异常";
    }
  }

  // 处理Http错误码
  static String _handleHttpError(int errorCode){
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      case 505:
        message = 'HTTP版本不受支持';
        break;
      default:
        message = '请求失败，错误码：$errorCode';
    }
    return message;
  }

  static Future get(String path, {Map? params}){
    print('get: --- ${path} ---');
    return _request(path, method: 'get', params: params);
  }

  static Future post(String path, {Map? params, data}){
    return _request(path, method: 'post', params: params, data: data);
  }

}
