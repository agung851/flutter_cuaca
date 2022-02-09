import 'package:app_cuaca/models/cuaca_model.dart';
import 'package:app_cuaca/repositories/cuaca_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CuacaEvent{}
class CuacaEventRefresh extends CuacaEvent{}

class CuacaState{
    CuacaModel? cuaca;
    bool isLoading;

    CuacaState({this.cuaca, this.isLoading = false});

    CuacaState copyWith({
      CuacaModel? cuaca,
      bool? isLoading
    }){
        return CuacaState(
          cuaca: cuaca ?? CuacaModel(),
          isLoading: isLoading ?? this.isLoading
        );
    }
}

class CuacaBloc extends Bloc<CuacaEvent, CuacaState>{
  
    CuacaBloc():super(CuacaState( cuaca: CuacaModel() )){
        
        on<CuacaEventRefresh>((event,emit)async{
            emit(state.copyWith( isLoading: true ));

            final hasil = await CuacaRepository().cuacaHariIni();

            emit(state.copyWith( cuaca: hasil, isLoading: false ));
        });

        add(CuacaEventRefresh());

    }
}

