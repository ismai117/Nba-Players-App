import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model/nba_model.dart';



@immutable
abstract class NBAState extends Equatable{}


class NBALoadingState extends NBAState {

  @override
  List<Object?> get props => [];

}


class NBASuccessState extends NBAState {

  final List<NBAModel> players;

  NBASuccessState({required this.players});

  @override
  List<Object?> get props => [players];

}

class NBAErrorState extends NBAState {

  final String error;

  NBAErrorState({required this.error});

  @override
  List<Object?> get props => [error];

}








