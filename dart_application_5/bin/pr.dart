import 'dart:io';
import 'dart:math';
import 'dart:convert'; 
import 'package:characters/characters.dart';

enum MyMood {
  normal('\u{1F610}', 'Нормально'),
  good('\u{1F642}', 'Пойдет'),
  cool('\u{1F60C}', 'Кайф'),
  superMood('\u{1F60E}', 'Топчик'),
  fire('\u{1F92F}', 'Взрыв мозга');

  final String icon;
  final String label;
  const MyMood(this.icon, this.label);
}

void main() {
  print("Как тебя зовут?");
  var name = stdin.readLineSync(encoding: utf8) ?? "Друг";

  print("Привет, $name! Сейчас узнаем твое настроение...");

  var rng = Random();
  int idx = rng.nextInt(MyMood.values.length);
  var current = MyMood.values[idx];
  print("Твой статус: ${current.icon} — ${current.label}");
  print("Энергия: ${idx + 1}/10");

  print("\nсложный символ? (да/нет)");
  var answer = stdin.readLineSync(encoding: utf8)?.toLowerCase();

  if (answer == 'да') {
    print("Введи смайлик):");
    var input = stdin.readLineSync(encoding: utf8) ?? "";
    showInfo(input);
  }
  print("пока");
}
void showInfo(String text) {
  print('--- Анализ "$text" ---');
  print("Реальных знаков: ${text.characters.length}");
  print("Кодовых точек: ${text.runes.length}");
  print("Длина UTF-16: ${text.length}");

  print("Unicode коды:");
  for (var r in text.runes) {
    print("U+${r.toRadixString(16).toUpperCase()}");
  }
}

// руна - целое число представляющее собой кодовую точку
// кодовая точка - число представляющее символ в стандарте Unicode
// строка - последовательность символов в UTF-16