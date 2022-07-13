import 'package:dirtcheck_api_test/data/API.dart';
import 'package:flutter/material.dart';
import 'package:dirtcheck_api_test/data/Dirt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          DirtAPI api = DirtAPI();
          List<Dirt> dirtDatas = await api.getDirtData("강서구");
          dirtDatas.removeWhere((element) => element.pm10 == 0);
          int index = 1;
          for (Dirt data in dirtDatas) {
            print("데이터 ${index++} 번 날짜 ${data.dataTime} 미세먼지 수치: ${data.pm10}, 초미세먼지 수치: ${data.pm25}, khai지수: ${data.khai}");
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
