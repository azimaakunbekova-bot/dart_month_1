import 'rpg_game.dart';

enum SuperAbility { heal, boost, criticalDamage, blockRevert, golemDefense, luck,resurrect, ludoman }

abstract class GameCharacter {
  String name;
  int _health;
  int damage;

  set health(int value) {
    if (value < 0) {
      _health = 0;
    } else {
      _health = value;
    }
  }

  int get health => _health;

  GameCharacter(this.name, this._health, this.damage);

  bool isAlive() {
    return health > 0;
  }

  @override
  String toString() {
    return '${runtimeType.toString()} $name health: $health damage: $damage';
  }
}

class Boss extends GameCharacter {
  SuperAbility? defence;
  bool isStunned = false;

  Boss(super.name, super.health, super.damage);

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    int randomIndex = RpgGame.random.nextInt(variants.length); // 0,1,2,3
    defence = variants[randomIndex];
  }

  void attack(List<Hero> heroes) {
    Golem? golem;
    for (Hero h in heroes) {
      if (h is Golem && h.isAlive()) {
        golem = h;
        break;
      }
    if (golem != null && h != golem){
      int absorbedDamage = damage ~/ 5;
      damage -= absorbedDamage;
      golem.health -= absorbedDamage;
      if (golem.health < 0) {
        golem.health = 0;
      }

    }
    }
    for (Hero h in heroes) {
      if (h.isAlive()) {
        if (h is Lucky && RpgGame.random.nextInt(100) < 25) {
          print('Lucky ${h.name} avoided the attack!');
          continue;
        }
        if (h is Berserk && defence != SuperAbility.blockRevert) {
          int block = (RpgGame.random.nextInt(2) + 1) * 5; // 5,10
          h.blockedDamage = block;
          h.health -= (damage - block);
        } else {
          h.health -= damage;
        }
      }
    }
  }

  @override
  String toString() {
    if (defence == null) {
      return '${super.toString()} defence: No defence';
    } else {
      return '${super.toString()} defence: ${defence!.name}';
    }
  }
}

abstract class Hero extends GameCharacter {
  SuperAbility ability;

  Hero(super.name, super.health, super.damage, this.ability);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Warrior extends Hero {
  Warrior(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.criticalDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = (RpgGame.random.nextInt(5) + 2) * damage; // 2,3,4,5,6
    boss.health -= crit;
    print('Warrior $name hit critically $crit');
  }
}

class Magic extends Hero {
  Magic(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.boost);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int boostAmount = RpgGame.random.nextInt(11) + 5; // 5,6,7,8,9,10,11,12,13,14,15
    if (RpgGame.roundNumber <= 4){
      for (Hero h in heroes) {
        if (h.isAlive() && h != this) {
          h.damage += boostAmount;
        }
      }
    print('Magic $name boosted all heroes by $boostAmount');
    }
  }
}

class Berserk extends Hero {
  int blockedDamage = 0;

  Berserk(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= blockedDamage;
    print('Berserk $name reverted $blockedDamage');
  }
}

class Healer extends Hero {
  int healPoints;

  Healer(String name, int health, int damage, this.healPoints)
    : super(name, health, damage, SuperAbility.heal);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (Hero h in heroes) {
      if (h.isAlive() && h != this) {
        h.health += healPoints;
      }
    }
  }
}
class Golem extends Hero {
  Golem(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.golemDefense);

  @override
  void hit(Boss boss, List<Hero> heroes) {
    boss.health -= this.damage;
  }

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
  }
}
class Lucky extends Hero {
  Lucky(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.luck);

  @override
  void hit(Boss boss, List<Hero> heroes) {
    boss.health -= this.damage;
  }
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
  }
  }
class Witcher extends Hero {
  bool hasResurrected = false;
  Witcher(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.resurrect);
  @override
  void hit(Boss boss, List<Hero> heroes) {}
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (this.isAlive() && !hasResurrected) {
      for (Hero h in heroes) {
        if (!h.isAlive()) {
          h.health = 100; // Resurrect the hero with 100 health
          hasResurrected = true;
          print('Witcher $name sacrificed himself to resurrect ${h.name}!');
        break;
      }
    }
  }
  }
}
class Thor extends Hero {
  Thor(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.criticalDamage);

  @override
  void hit(Boss boss, List<Hero> heroes) {
    boss.health -= this.damage;
  }

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if(this.isAlive() && RpgGame.random.nextBool()) {
      boss.isStunned = true;
      print('Thor $name stunned the boss!');
}
}
}
class Ludoman extends Hero {
  Ludoman(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.ludoman);

  @override
  void hit(Boss boss, List<Hero> heroes) {
    boss.health -= this.damage;
  }

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (this.isAlive() ) {
      int dice1 = RpgGame.random.nextInt(6) + 1; // 1-6
      int dice2 = RpgGame.random.nextInt(6) + 1; //

      if (dice1 == dice2) {
        int damageToBoss = dice1 * dice2;
        boss.health -=damageToBoss;
        if(boss !=isAlive());
        print('Ludoman $name hit z jackpot! Dice:[$dice1,$dice2].Boss loses $damageToBoss HP');
      }else{
        int damageToAlly = dice1 + dice2;
        var aliveHeroes = heroes.where((h) => h.isAlive() && h != this).toList();
        if (aliveHeroes.isNotEmpty) {
          var ally = aliveHeroes[RpgGame.random.nextInt(aliveHeroes.length)];
          ally.health -= damageToAlly;
          print('Ludoman $name hit a bad roll! Dice:[$dice1,$dice2]. Ally ${ally.name} loses $damageToAlly HP');
      }

            }      }
    } 
  }
