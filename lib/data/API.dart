
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dirtcheck_api_test/data/Dirt.dart';


class DirtAPI {
  final BASE_URL = "http://apis.data.go.kr";
  final String key = "BeiV3Hqv%2B%2F9Uz3bswUm4L%2B8rv4xOfKKf44x9oCG5VmtfbFE3JksgI%2FCsHqqiu9XHIkg2N%2FnohLyuUeKMuNAuNg%3D%3D";

  Future<List<Dirt>> getDirtData(String stationName) async {
    String url = "$BASE_URL/B552584/"
        "ArpltnInforInqireSvc/"
        "getMsrstnAcctoRltmMesureDnsty?"
        "serviceKey=BeiV3Hqv%2B%2F9Uz3bswUm4L%2B8rv4xOfKKf44x9oCG5VmtfbFE3JksgI%2FCsHqqiu9XHIkg2N%2FnohLyuUeKMuNAuNg%3D%3D&"
        "returnType=json&"
        "numOfRows=100&"
        "pageNo=1&"
        "stationName=${Uri.encodeQueryComponent(stationName)}&"
        "dataTerm=DAILY&ver=1.0";

    final response = await http.get(Uri.parse(url));

    var data = utf8.decode(response.bodyBytes);
    print(data);
    if(response.statusCode == 200) {
      List<Dirt> datas = [];
      String body = data;
      var res = json.decode(body) as Map<String, dynamic>;

      for (var _item in res["response"]["body"]["items"]) {
        var dirt = Dirt.fromJson(_item);
        datas.add(dirt);
      }
      return datas;
    } else {
      return [];
    }
  }
}