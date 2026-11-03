import 'interfaces.dart';

abstract class Device implements Switchable {
  final String name;
  Device(this.name);
  void showInfo() {
    print('Device: $name');
  }
}

class SmartLamp extends Device with BatteryPowered implements Adjustable {
  int brightness = 50;
  SmartLamp(String name) : super(name);

  @override
  void turnOn() {
    print('$name is turned on.');
  }

  @override
  void turnOff() {
    print('$name is turned off.');
  }

  @override
  void increase() {
    brightness = (brightness + 10).clamp(0, 100);
    print('Lamp $name brightness increased to $brightness');
  }

  @override
  void decrease() {
    brightness = (brightness - 10).clamp(0, 100);
    print('Lamp $name brightness decreased to $brightness');
  }
  @override
  void showInfo() {
    print('Device: $name, Brightness: $brightness');
  }
}

class SmartSpeaker extends Device with BatteryPowered implements Adjustable {
  int volume = 30;
  SmartSpeaker(String name) : super(name);

  @override
  void turnOn() {
    print(' Speaker $name is turned on.');
  }

  @override
  void turnOff() {
    print('Speaker $name is turned off.');
  }

  @override
  void increase() {
    volume = (volume + 5).clamp(0,100);
    print('Speaker $name volume increased to $volume');
    
  }

  @override
  void decrease() {
    volume = (volume - 5).clamp(0,100);
    print('Speaker $name volume decreased to $volume');
  }
  @override
  void showInfo() {
    print('Device: $name , Volume:$volume%');
  }
}
class SmartThermostat extends Device {
  int temperature;
  SmartThermostat(String name, {this.temperature = 22}):  super(name) ;
   @override
  void turnOn() {
    print('Termostat $name is ON');
  }
  @override
  void turnOff() {
    print('Termostat $name is OFF');
  }
  @override
  void showInfo() {
    print('Device: $name, Temperature: $temperature');
  }
}