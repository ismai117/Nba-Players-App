import 'package:bloc/bloc.dart';

import '../data/NBAService.dart';
import '../model/nba_model.dart';
import 'nba_event.dart';
import 'nba_state.dart';


class NBABloc extends Bloc<NBAEvent, NBAState> {

  NBABloc() : super(NBALoadingState()){

    on<LoadNBAEvent>((event, emit) async {

      emit(NBALoadingState());

      try{

        final response = await NBAService.getPlayers();

        emit(NBASuccessState(players: response));

      } catch (e){
        emit(NBAErrorState(error: e.toString()));
      }

    });

  }

}






// NBABloc() : super(NBAInitialState()) {
// on<FetchNBAEvent>((event, emit) async {
// emit(NBALoadingState());
//
// try {
// final response = await NBAService.getPlayers();
// emit(NBASuccessState(playersList: response));
// } catch (e) {
// emit(NBAErrorState(error: e.toString()));
// }
// });
// }