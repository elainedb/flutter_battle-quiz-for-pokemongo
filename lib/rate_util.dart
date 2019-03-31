enum Type { bug, dark, dragon, electric, fairy, fighting, fire, flying, ghost, grass, ground, ice, normal, poison, psychic, rock, steel, water }

enum AttackRate { not_very_effective, regular, super_effective }

List<Type> bugSE = [Type.dark, Type.grass, Type.psychic];
List<Type> bugNVE = [Type.fairy, Type.fighting, Type.fire, Type.flying, Type.ghost, Type.poison, Type.steel];

List<Type> darkSE = [Type.ghost, Type.psychic];
List<Type> darkNVE = [Type.dark, Type.fairy, Type.fighting];

List<Type> dragonSE = [Type.dragon];
List<Type> dragonNVE = [Type.fairy, Type.steel];

List<Type> electricSE = [Type.flying, Type.water];
List<Type> electricNVE = [Type.dragon, Type.electric, Type.grass, Type.ground];

List<Type> fairySE = [Type.dark, Type.dragon, Type.fighting];
List<Type> fairyNVE = [Type.fire, Type.poison, Type.steel];

List<Type> fightingSE = [Type.dark, Type.ice, Type.normal, Type.poison, Type.psychic, Type.rock, Type.steel];
List<Type> fightingNVE = [Type.bug, Type.fairy, Type.flying, Type.ghost];

List<Type> fireSE = [Type.bug, Type.grass, Type.ice, Type.steel];
List<Type> fireNVE = [Type.dragon, Type.fire, Type.rock, Type.water];

List<Type> flyingSE = [Type.bug, Type.fighting, Type.grass];
List<Type> flyingNVE = [Type.electric, Type.rock, Type.steel];

List<Type> ghostSE = [Type.ghost, Type.psychic];
List<Type> ghostNVE = [Type.dark, Type.normal];

List<Type> grassSE = [Type.ground, Type.rock, Type.water];
List<Type> grassNVE = [Type.bug, Type.dragon, Type.fire, Type.flying, Type.grass, Type.poison, Type.steel];

List<Type> groundSE = [Type.electric, Type.fire, Type.poison, Type.rock, Type.steel];
List<Type> groundNVE = [Type.bug, Type.flying, Type.grass];

List<Type> iceSE = [Type.dragon, Type.flying, Type.grass, Type.ground];
List<Type> iceNVE = [Type.fire, Type.ice, Type.steel, Type.water];

List<Type> normalSE = [];
List<Type> normalNVE = [Type.ghost, Type.rock, Type.steel];

List<Type> poisonSE = [Type.fairy, Type.grass];
List<Type> poisonNVE = [Type.ghost, Type.ground, Type.poison, Type.rock, Type.steel];

List<Type> psychicSE = [Type.fighting, Type.poison];
List<Type> psychicNVE = [Type.dark, Type.psychic, Type.steel];

List<Type> rockSE = [Type.bug, Type.fire, Type.flying, Type.ice];
List<Type> rockNVE = [Type.fighting, Type.ground, Type.steel];

List<Type> steelSE = [Type.fairy, Type.ice, Type.rock];
List<Type> steelNVE = [Type.electric, Type.fire, Type.steel, Type.water];

List<Type> waterSE = [Type.fire, Type.ground, Type.rock];
List<Type> waterNVE = [Type.dragon, Type.grass, Type.water];

AttackRate getAttackRate(Type attacker, Type defender) {
  switch (attacker) {
    case Type.bug:
      return getAttackRateWithList(defender, bugSE, bugNVE);
    case Type.dark:
      return getAttackRateWithList(defender, darkSE, darkNVE);
    case Type.dragon:
      return getAttackRateWithList(defender, dragonSE, dragonNVE);
    case Type.electric:
      return getAttackRateWithList(defender, electricSE, electricNVE);
    case Type.fairy:
      return getAttackRateWithList(defender, fairySE, fairyNVE);
    case Type.fighting:
      return getAttackRateWithList(defender, fightingSE, fightingNVE);
    case Type.fire:
      return getAttackRateWithList(defender, fireSE, fireNVE);
    case Type.flying:
      return getAttackRateWithList(defender, flyingSE, flyingNVE);
    case Type.ghost:
      return getAttackRateWithList(defender, ghostSE, ghostNVE);
    case Type.grass:
      return getAttackRateWithList(defender, grassSE, grassNVE);
    case Type.ground:
      return getAttackRateWithList(defender, groundSE, grassNVE);
    case Type.ice:
      return getAttackRateWithList(defender, iceSE, iceNVE);
    case Type.normal:
      return getAttackRateWithList(defender, normalSE, normalNVE);
    case Type.poison:
      return getAttackRateWithList(defender, poisonSE, poisonNVE);
    case Type.psychic:
      return getAttackRateWithList(defender, psychicSE, psychicNVE);
    case Type.rock:
      return getAttackRateWithList(defender, rockSE, rockNVE);
    case Type.steel:
      return getAttackRateWithList(defender, steelSE, steelNVE);
    case Type.water:
      return getAttackRateWithList(defender, waterSE, waterNVE);
  }

  return AttackRate.regular;
}

AttackRate getAttackRateWithList(Type defender, List<Type> SE, List<Type> NVE) {
  AttackRate ar = AttackRate.regular;
  if (SE.contains(defender)) ar = AttackRate.super_effective;
  else if (NVE.contains(defender)) ar = AttackRate.not_very_effective;
  return ar;
}
