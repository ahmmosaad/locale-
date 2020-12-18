import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:local/app_local.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      supportedLocales: [
        Locale('ar', ''),
        Locale('en', ''),
        Locale('fr', ''),
      ],
      localizationsDelegates: [
        AppLocal.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      localeListResolutionCallback: (supportedLocal , currentLocal){
        if(currentLocal != null){
          for(Locale locale in supportedLocal){
            if(locale.languageCode == currentLocal.toString()){
              print('localies isentical');
              return currentLocal as Locale;
            }
          }

        }

        return supportedLocal.first;

      },
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, }) : super(key: key);




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.of(context).getTranslate('app_title')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocal.of(context).getTranslate('counter_lang'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
