import 'package:app_cuaca/bloc/cuaca_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart'; 

class CuacaUI extends StatelessWidget {
  const CuacaUI({ Key? key }) : super(key: key);

  Widget background()=>Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
          Colors.blue.shade200,
          Colors.blue.shade900
      ])
    ),
    height: 200,
  );

  Widget itemField(Widget kiri, Widget kanan)=>Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex:4, child: kiri), 
        Flexible(flex:1, child: kanan), 
      ],
  );

  Widget cardKonten()=>BlocBuilder<CuacaBloc, CuacaState>(
    builder: (context, state) {
      return ListView(
        children: [
            const SizedBox(height: 130,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow( blurRadius: 5, color: Colors.grey )
                ]
              ),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      itemField(
                        Text('Cuaca Saat ini', 
                              style: GoogleFonts.poppins(fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              )  
                        ), 
                        Image.network( 'http://openweathermap.org/img/w/${state.cuaca?.icon}.png' )
                      ),

                      Text('${state.cuaca?.description}',
                        style: GoogleFonts.adventPro(fontSize: 18),
                      ),
                      const SizedBox(height: 10,),
                      itemField( const Text('Suhu min'), Text('${state.cuaca?.tempMin}')),
                      itemField( const Text('Suhu max'), Text('${state.cuaca?.tempMax}')),
                      itemField( const Text('Kelembapan'), Text('${state.cuaca?.humidity}%')),
                      itemField( const Text('Tekanan udara'), Text('${state.cuaca?.pressure}'))
                  ],
                ), 
            ),
        ]
      );
    }
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c)=>CuacaBloc(),
      child: Builder(
        builder: (context) {
          
          return Scaffold(
              body: Stack(
                children: [
                    background(),
                    cardKonten()
                ],
              ),
          );
        }
      ),
    );
  }
}