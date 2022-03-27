import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class NBAEvent extends Equatable{
  const NBAEvent();
}

class LoadNBAEvent extends NBAEvent{

  @override
  List<Object> get props => [];

}