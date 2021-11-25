import 'dart:convert';
import 'package:demo2_eye/config/url_config.dart';

// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';

class HttpManager{
  // utf8decoder 在 Convert 包中，目的是修复中文乱码
  static Utf8Decoder utf8decoder = Utf8Decoder();

  static requestHttpData(String url,{
    required Function onSuccess,
    Function? onFail,
    Function? complete
  }) async {
    print('===requestHttpData===');
    try {
      // Uri.parse
      // var response = await http.get(Uri.parse(url));
      var response = await Dio().get(url);
      print("szj网络数据code:${response}}\n接口为:$url");

      if(response.statusCode == 200){
        // dynamic result = json.decode(utf8decoder.convert(response.bodyBytes));
        onSuccess(response);
      }
    } catch(e){
      print("szj网络数据失败返回:$e");
      if(onFail != null){
        onFail(e);
      }
    } finally {
      if(complete != null){
        complete();
      }
    }
  }
}
