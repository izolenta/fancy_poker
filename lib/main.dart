import 'package:fancy_poker/redux/actions/get_back_to_grid_action.dart';
import 'package:fancy_poker/redux/app_reducer.dart';
import 'package:fancy_poker/redux/app_selector.dart';
import 'package:fancy_poker/redux/app_state.dart';
import 'package:fancy_poker/util/inject_helper.dart';
import 'package:fancy_poker/util/precacher.dart';
import 'package:fancy_poker/widgets/scene_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:redux/redux.dart';
import 'package:screen/screen.dart';

void main() async {

  final injector = Injector.getInjector();

  injector.map<Precacher>((s) =>  Precacher(), isSingleton: true);
  injector.map<AppSelector>((s) =>  AppSelector(), isSingleton: true);

  final store = new Store<AppState>(
      appReducer,
      initialState: AppState.initial());
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp(this.store);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Fantasy Scrum Poker',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: MyHomePage(title: 'Fantasy Scrum Poker'),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Precacher _precacher = getInjected<Precacher>();
  Precacher get precacher => _precacher;

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _isLoaded = false;
  final _selector = getInjected<AppSelector>();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Screen.keepOn(true);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.widget.precacher.precacheAssets(context).then((_) {
      _isLoaded = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoaded) {
      return new StoreConnector<AppState, OnStateChanged>(
        converter: (store) {
          return () {
            if (!_selector.areAllCardsDisplayed(store.state)) {
              store.dispatch(GetBackToGridAction());
            }
          };
        }, builder: (context, callback) {
        return new WillPopScope(
          onWillPop: callback(),
          child: Scaffold(backgroundColor: Colors.white10,
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: SceneWidget(),
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Increment',
              child: Icon(Icons.question_answer),
            ),
          ),
        );
      });
    }
    return Center();
  }

  @override
  void dispose() {
    this.widget.precacher.dispose();
    super.dispose();
  }
}

typedef OnStateChanged = Function();