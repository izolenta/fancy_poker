import 'package:fancy_poker/util/card_id_enum.dart';
import 'package:fancy_poker/widgets/mini_card_widget.dart';

class CardCollection {
  final cardWidgets = <MiniCardWidget>[
    MiniCardWidget(imageLink: 'assets/images/1.png', cardId: CardIdEnum.one),
    MiniCardWidget(imageLink: 'assets/images/2.png', cardId: CardIdEnum.two),
    MiniCardWidget(imageLink: 'assets/images/3.png', cardId: CardIdEnum.three),
    MiniCardWidget(imageLink: 'assets/images/5.png', cardId: CardIdEnum.five),
    MiniCardWidget(imageLink: 'assets/images/8.png', cardId: CardIdEnum.eight),
    MiniCardWidget(
        imageLink: 'assets/images/13.png', cardId: CardIdEnum.thirteen),
    MiniCardWidget(
        imageLink: 'assets/images/21.png', cardId: CardIdEnum.twentyone),
    MiniCardWidget(imageLink: 'assets/images/40.png', cardId: CardIdEnum.forty),
    MiniCardWidget(
        imageLink: 'assets/images/100.png', cardId: CardIdEnum.hundred),
    MiniCardWidget(
        imageLink: 'assets/images/unclear.png', cardId: CardIdEnum.unknown),
    MiniCardWidget(
        imageLink: 'assets/images/break.png', cardId: CardIdEnum.tea),
    MiniCardWidget(
        imageLink: 'assets/images/back.png', cardId: CardIdEnum.back),
  ];

  List<MiniCardWidget> getAllCards() => cardWidgets.where((x) => x.cardId != CardIdEnum.back).toList();

  MiniCardWidget getCard(CardIdEnum id) => cardWidgets.firstWhere((x) => x.cardId == id);
}