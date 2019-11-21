import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animation Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class JumpingCurve extends Curve{
  double start;
  double stop;
  JumpingCurve(this.start,this.stop);
  @override
  double transformInternal(double t) {
    if(t >= start && t<(start+stop)/2.0){
      return (2*(t - start) / (stop-start)) ;

    }
    else if(t >= (start+stop)/2.0+0.2 && t<stop){
      return (2*(stop - t) / (stop - start)) ;

    }
    else return 0;
  }
}
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  AnimationController myController;
  Animation<double> animation;


  @override
  void initState() {
    myController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(myController);
    myController.repeat();


    super.initState();


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: new Container(
          width: 300.0,
          height: 200.0,
          decoration: new BoxDecoration(
            color: Colors.white70,
            borderRadius: new BorderRadius.circular(50.0),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SlideTransition(
                position:Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, -0.4))
                    .animate(CurvedAnimation(
                  parent: myController,
                  curve:JumpingCurve(0.0,0.4),
                )),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                      color: Colors.blueGrey,
                      width: 12.0,

                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SlideTransition(
                position:Tween<Offset>(begin:Offset(0.0, 0.0), end: Offset(0.0, -0.4))
                    .animate(CurvedAnimation(
                  parent: myController,
                  curve:JumpingCurve(0.2,0.6),
                )),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                      color: Colors.blueGrey,
                      width: 12.0,

                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SlideTransition(
                position:Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, -0.4))
                    .animate(CurvedAnimation(
                  parent: myController,
                  curve:JumpingCurve(0.4,0.8),
                )),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                      color: Colors.blueGrey,
                      width: 12.0,

                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

            ],
          ),

        ),
      ),

    );
  }
}
