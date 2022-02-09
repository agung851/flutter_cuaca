import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesAPI{
    static const String APPID_OW  = '94db71d018cf9cff1af1126db69fe07f';
    static const String URI_OW    = 'http://api.openweathermap.org/data/2.5/';
    
    Future<Map> get(String alamat)async{
        
        try{
          final r = await http.get( Uri.parse(alamat) )
                              .timeout(const Duration(seconds: 5));

          final data = jsonDecode(r.body);
          print('isi body = ${r.body}');
          return {
            'code' : r.statusCode,
            'data' : data
          };              
        }catch(e){}
        return {'code':500, 'data':'Gagal mendapatkan data'};
    }
 
}
