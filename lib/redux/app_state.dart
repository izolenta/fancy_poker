library app_state;

import 'package:built_value/built_value.dart';
import 'package:fancy_poker/util/card_id_enum.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void updates(AppStateBuilder b)]) = _$AppState;

  factory AppState.initial() {
    return AppState((b) {
      b.activeCard = CardIdEnum.grid;
      b.isCardHidden = true;
    });
  }

  AppState._();

  CardIdEnum get activeCard;

  bool get isCardHidden;
}