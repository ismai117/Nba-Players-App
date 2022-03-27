import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_players/feature%201/model/nba_model.dart';
import 'package:nba_players/feature%201/players/playersDetail.dart';

import '../bloc/nba_bloc.dart';
import '../bloc/nba_event.dart';
import '../bloc/nba_state.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  PlayersState createState() => PlayersState();
}

class PlayersState extends State<PlayersScreen> {

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text("NBA Players");

  List<NBAModel> _players = [];
  String queryValue = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        NBABloc()
          ..add(LoadNBAEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: customSearchBar,
          ),
          body: BlocBuilder<NBABloc, NBAState>(builder: (context, state) {
            if (state is NBALoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NBAErrorState) {
              return Center(child: Text(state.error));
            }
            if (state is NBASuccessState) {

              _players = state.players;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.white,
                          fontSize: 16.0
                        ),
                        label: Text("Search Player")
                      ),
                      onChanged: (value){
                        setState(() {
                          queryValue = value.toLowerCase();
                        });
                      }
                    )
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _players.length,
                      itemBuilder: (context, i) {

                        
                        final fullName = "${_players[i].firstName} ${_players[i].lastName}";


                        return fullName
                          .toLowerCase()
                          .contains(queryValue)
                          ? ListTile(
                            leading: CircleAvatar(
                              child: CachedNetworkImage(
                                imageUrl: _players[i].headShotUrl,
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                              backgroundColor: Colors.transparent,
                              maxRadius: 30,
                            ),
                            title: Text("${_players[i].firstName} ${_players[i].lastName}"),
                          onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlayersDetail(players: _players[i])
                                )
                              );
                          },
                        )
                            : Container();

                      },
                    ),
                  )
                ],
              );
            }
            return Container();
          }),
        ));
  }



}


