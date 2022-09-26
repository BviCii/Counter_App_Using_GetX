import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: Home(),
  ));
}

class Counter extends GetxController {
  RxInt count = 0.obs;

  void add() {
    count++;
  }
}

class Home extends StatelessWidget {
  final counter = Get.put(Counter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text(
                  '${counter.count}',
                  style: TextStyle(fontSize: 50, color: Colors.blue),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(SecondPage());
                },
                child: Text('Go to second page')),
            ElevatedButton(
                onPressed: () {
                  Get.to(ThirdPage());
                },
                child: Text('Go to third page')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            counter.add();
            print(counter.count);
          }),
    );
  }
}

class SecondPage extends StatelessWidget {
  final Counter secondCounter = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Obx(
        () => Text('${secondCounter.count}'),
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            secondCounter.add();
            print(secondCounter.count);
          }),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            child: Text('hello'),
            onPressed: (() {
              Get.snackbar('he', 'message',
                  snackPosition: SnackPosition.BOTTOM,
                  icon: Icon(Icons.access_alarm_outlined));
            }),
          ),
          ElevatedButton(
            child: Text('Back'),
            onPressed: (() {
              Get.back();
            }),
          ),
        ]));
  }
}
