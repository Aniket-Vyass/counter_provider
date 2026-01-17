import 'package:counter_provider/providers/CounterModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(context) {
    //final counter = Provider.of<CounterModel>(context);
    return Scaffold(
      body: Center(
        child: Consumer<CounterModel>(
          //here👇
          builder: (BuildContext context, CounterModel counter, Widget? child) {
            //5th line
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Counter Value: ${counter.counter}", //first counter is instance of CounterModel on the 5th line above while other counter is the getter initialised in CounterModel.dart class
                  style: TextStyle(fontSize: 29),
                ),
                ElevatedButton(
                  onPressed: () {
                    counter.increment();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
