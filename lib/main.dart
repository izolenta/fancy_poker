import 'package:fancy_poker/util/inject_helper.dart';
import 'package:fancy_poker/util/precacher.dart';
import 'package:fancy_poker/widgets/grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void main() async {

  final injector = Injector.getInjector();
  injector.map<Precacher>((s) =>  Precacher(), isSingleton: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fantasy Scrum Poker',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Fantasy Scrum Poker'),
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
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      return Scaffold(backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: GridWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.question_answer),
        ),
      );
    }
    return Center();
  }

  @override
  void dispose() {
    this.widget.precacher.dispose();
    super.dispose();
  }
}
