enum Type { bug, dark, dragon, electric, fairy, fighting, fire, flying, ghost, grass, ground, ice, normal, poison, psychic, rock, steel, water }
enum AttackRate { bad, regular, good }

AttackRate getAttackRate(Type attacker, Type defender) {
  switch (attacker) {
    case Type.bug:
      return getAttackRateWithLists(defender, [Type.dark, Type.grass, Type.psychic], [Type.fairy, Type.fighting, Type.fire, Type.flying, Type.ghost, Type.poison, Type.steel]);
    case Type.dark:
      return getAttackRateWithLists(defender, [Type.ghost, Type.psychic], [Type.dark, Type.fairy, Type.fighting]);
    case Type.dragon:
      return getAttackRateWithLists(defender, [Type.dragon], [Type.fairy, Type.steel]);
    case Type.electric:
      return getAttackRateWithLists(defender, [Type.flying, Type.water], [Type.dragon, Type.electric, Type.grass, Type.ground]);
    case Type.fairy:
      return getAttackRateWithLists(defender, [Type.dark, Type.dragon, Type.fighting], [Type.fire, Type.poison, Type.steel]);
    case Type.fighting:
      return getAttackRateWithLists(defender, [Type.dark, Type.ice, Type.normal, Type.poison, Type.psychic, Type.rock, Type.steel], [Type.bug, Type.fairy, Type.flying, Type.ghost]);
    case Type.fire:
      return getAttackRateWithLists(defender, [Type.bug, Type.grass, Type.ice, Type.steel], [Type.dragon, Type.fire, Type.rock, Type.water]);
    case Type.flying:
      return getAttackRateWithLists(defender, [Type.bug, Type.fighting, Type.grass], [Type.electric, Type.rock, Type.steel]);
    case Type.ghost:
      return getAttackRateWithLists(defender, [Type.ghost, Type.psychic], [Type.dark, Type.normal]);
    case Type.grass:
      return getAttackRateWithLists(defender, [Type.ground, Type.rock, Type.water], [Type.bug, Type.dragon, Type.fire, Type.flying, Type.grass, Type.poison, Type.steel]);
    case Type.ground:
      return getAttackRateWithLists(defender, [Type.electric, Type.fire, Type.poison, Type.rock, Type.steel], [Type.bug, Type.flying, Type.grass]);
    case Type.ice:
      return getAttackRateWithLists(defender, [Type.dragon, Type.flying, Type.grass, Type.ground], [Type.fire, Type.ice, Type.steel, Type.water]);
    case Type.normal:
      return getAttackRateWithLists(defender, [], [Type.ghost, Type.rock, Type.steel]);
    case Type.poison:
      return getAttackRateWithLists(defender, [Type.fairy, Type.grass], [Type.ghost, Type.ground, Type.poison, Type.rock, Type.steel]);
    case Type.psychic:
      return getAttackRateWithLists(defender, [Type.fighting, Type.poison], [Type.dark, Type.psychic, Type.steel]);
    case Type.rock:
      return getAttackRateWithLists(defender, [Type.bug, Type.fire, Type.flying, Type.ice], [Type.fighting, Type.ground, Type.steel]);
    case Type.steel:
      return getAttackRateWithLists(defender, [Type.fairy, Type.ice, Type.rock], [Type.electric, Type.fire, Type.steel, Type.water]);
    case Type.water:
      return getAttackRateWithLists(defender, [Type.fire, Type.ground, Type.rock], [Type.dragon, Type.grass, Type.water]);
  }
}

AttackRate getAttackRateWithLists(Type defender, List<Type> goodList, List<Type> badList) {
  AttackRate ar = AttackRate.regular;
  if (goodList.contains(defender)) ar = AttackRate.good;
  else if (badList.contains(defender)) ar = AttackRate.bad;
  return ar;
}