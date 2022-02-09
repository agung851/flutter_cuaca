import 'package:app_cuaca/models/cuaca_model.dart';
import 'package:app_cuaca/utils/services_api.dart'; 

class CuacaRepository{
     
     Future<CuacaModel> cuacaHariIni([String kota='Pontianak'])async{
        final alamat = ServicesAPI.URI_OW + 
                       'weather?q=$kota&appid=${ServicesAPI.APPID_OW}';
                       
        final r = await ServicesAPI().get(alamat);

        return CuacaModel.fromMap( r['data'] ?? [] );
     }

    Future<List<CuacaModel>> prediksiCuaca([String kota='Bekasi'])async{
        final alamat = ServicesAPI.URI_OW + 
                       'forecast?q=$kota&appid=${ServicesAPI.APPID_OW}';

        final r =  await ServicesAPI().get(alamat);
        final data = r['data'] ?? [];

        List<CuacaModel> ls = [];
        for(var n in data['list'] ?? []){
            ls.add( CuacaModel.fromMap(n) );
        }

        return ls;
     }
}