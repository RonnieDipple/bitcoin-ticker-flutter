import 'package:http/http.dart' as http;
import '../apiKey.dart';
// allows jason decoding
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<int> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      double rate = decodedData['rate'];

      // crypto added for future implementation
      // String assetID = decodedCryptoData['asset_id'];
      // var typeIsCrypto = decodedCryptoData['type_is_crypto'];
      // if (typeIsCrypto == 1) {
      //   cryptoList.add(assetID);
      // }
      print('Networking working ${rate.toInt()}');
      return rate.toInt();
    } else {
      print('Network ERROR: ${response.statusCode}');
    }
  }
}
