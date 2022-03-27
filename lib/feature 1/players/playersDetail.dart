import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nba_players/feature%201/model/nba_model.dart';

class PlayersDetail extends StatefulWidget {
  const PlayersDetail({Key? key, required this.players}) : super(key: key);

  final NBAModel players;

  @override
  PlayersDetailState createState() => PlayersDetailState();
}

class PlayersDetailState extends State<PlayersDetail> {
  @override
  Widget build(BuildContext context) {
    final players = widget.players;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Players",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  child: CachedNetworkImage(
                    imageUrl: players.headShotUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      size: 100,
                    ),
                    fit: BoxFit.cover,
                  ),
                  backgroundColor: Colors.transparent,
                  maxRadius: 100,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 40, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${players.team} | ${players.jerseyNumber} |",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${players.position}",
                        style: TextStyle(fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "${players.firstName}",
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          "${players.lastName}",
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: SizedBox(
                            height: 40,
                            width: 160,
                            child: TextButton.icon(
                              icon: Icon(Icons.star_outline),
                              label: Text("Favourte"),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg: "${players.firstName}",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1
                                );
                              },
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  side: BorderSide(
                                      width: 1, color: Colors.black)),
                            ),
                          )),
                    ],
                  ),
                )),
          ]),
          Column(
            children: [
              Text("Career Stats"),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: statBox("PPG", players.careerPoints),
                  ),
                  Expanded(
                    child: statBox("RPG", players.careerRebounds),
                  ),
                  Expanded(
                    child: statBox("APG", players.carrerAssists),
                  ),
                ],
              ),),
              Padding(
                  padding: EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            '${players.height} | ${players.weight} | ${players.age} years',
                          ),
                        )
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget statBox(String title, double value) {
    return SizedBox(
      child: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$title"),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                "$value",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey, width: 0.8)),
      ),
    );
  }
}
