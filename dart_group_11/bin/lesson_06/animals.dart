enum Color {
  red('\x1B[31m'),
  yellow('\x1B[33m'),
  green('\x1B[32m');

  final String code;

  const Color(this.code);
}

class Animal {
  int age;
  String name;
  Color color;

  static int _counter = 0;

  static void showCounter() {
    print('Objects created: $_counter');
  }

  Animal(this.age, this.name, this.color) {
    _counter++;
  }

  String getInfo() {
    return '$name Age: $age Color: ${color.code}${color.name}\x1B[0m';
  }
}

class Cat extends Animal {
  Cat(super.age, super.name, super.color);

  void meow() {
    print('Cat $name says meow!');
  }
}

class Dog extends Animal {
  String commands;

  Dog(super.age, super.name, super.color, this.commands);

  @override
  String getInfo() {
    return '${super.getInfo()} Commands: $commands';
  }
}

class FightingDog extends Dog {
  int wins;

  FightingDog(super.age, super.name, super.color, super.commands, this.wins);

  void fight() {
    print('$color dog is fihgting.');
  }

  @override
  String getInfo() {
    return '${super.getInfo()} Wins: $wins';
  }
}
