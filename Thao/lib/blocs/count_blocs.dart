import 'dart:async';

import 'package:pedometer/pedometer.dart';

class CountBlocs{
StreamController _stepController = StreamController();
Pedometer _pedometer;
StreamSubscription<int> _subscription;
int _stepCountCurrent = 0;
bool initStep = true;
int _stepCount = 0;

Stream get stepStream => _stepController.stream;
Future<void> initPlatformState() async {
  startListening();
}

void startListening() {
  _pedometer = new Pedometer();
  _subscription = _pedometer.pedometerStream.listen(_onData,
      onError: _onError, onDone: _onDone, cancelOnError: true);
}

void stopListening() {
  _subscription.pause();
}
void _onData(int stepCountValue) async {
  int preStep;
  preStep = _stepCountCurrent;
  if(preStep==0){
    _stepCountCurrent = stepCountValue;
  }
  if(preStep !=0 && stepCountValue > preStep){
    _stepCount++;
    _stepCountCurrent = stepCountValue;
    print(_stepCount);
    _stepController.sink.add(_stepCount);
  }
}

int get stepCount => _stepCount;

void _onDone() {}
void _onError(error) => print("Flutter Pedometer Error: $error");
void dispose (){
  _stepController.close();
}
}