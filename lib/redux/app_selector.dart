import 'package:fancy_poker/redux/app_state.dart';
import 'package:fancy_poker/util/card_id_enum.dart';

class AppSelector {
  bool areAllCardsDisplayed(AppState state) => state.activeCard == CardIdEnum.grid;

  CardIdEnum getCurrentCard(AppState state) => state.activeCard;

  bool isCardHidden(AppState state) => state.isCardHidden;
}