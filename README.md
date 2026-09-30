# Battle Quiz for Pokémon GO

A tiny quiz for Pokémon GO players who want to get better at type match-ups. Written for the [Flutter Create](https://flutter.dev/create) contest in 2019, which capped entries at 5 KB of Dart.

> **Archived.** Kept as it was submitted.

## How it plays

Two Pokémon types are drawn at random. You decide how the attacker fares against the defender. A correct answer scores a point.

The attack-rate table lives in `lib/rate_util.dart` and follows the community type chart (for example the one at pokemongo.gamepress.gg). The code was minified to fit under the 5 KB limit, then partly de-minified afterwards.

## Running

```bash
flutter pub get
flutter run
```
