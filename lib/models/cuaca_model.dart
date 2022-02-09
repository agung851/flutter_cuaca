class CuacaModel{
   int? id;
   String? main;
   String? description;
   String? icon;
   double? temp = 0;
   double? tempMin = 0;
   double? tempMax = 0;
   int? pressure = 0;
   int? humidity = 0;

   CuacaModel({this.id, this.main, this.description, this.icon = '',
    this.temp = 0, this.tempMin=0, this.tempMax=0, 
    this.pressure=0, this.humidity=0
   });

   factory CuacaModel.fromMap(Map map){
     final weather = map['weather'];
     final main    = map['main'];
 
     return CuacaModel(
                id: int.tryParse('${weather[0]['id']}'),
              main: weather[0]['main'],
       description: weather[0]['description'],
              icon: weather[0]['icon'],
              temp: double.tryParse('${main['temp']}') ?? 0,
           tempMin: double.tryParse('${main['temp_min']}') ?? 0,
           tempMax: double.tryParse('${main['temp_max']}') ?? 0,
          pressure: int.tryParse('${main['pressure']}'),
          humidity: int.tryParse('${main['humidity']}'),
     );
   }

}

