class UrlConfig{
  static String baseUrl = 'https://baobab.kaiyanapp.com/api/';

  static Map<String, String> httpHeader = {
    'Accept': 'application/json, text/plain, */*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'zh-CN,zh;q=0.9',
    'Connection': 'keep-alive',
    'Content-Type': 'application/json',
  };

  static String feedUrl = '${baseUrl}v2/feed?num=1';

}