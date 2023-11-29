import 'dart:io' as io show File, Directory;
import 'dart:convert' as convert show jsonDecode, jsonEncode;

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
// import 'package:teledart/teledart.dart';

void main() async {
  String token = await fetchToken();
  var username = await fetchUsername(token);
  var teledart = TeleDart(token, Event(username ?? ''));
}

Future<String> fetchToken() async {
  final token = convert.jsonDecode(
      await io.File('./.regist/regist.json').readAsString())['BOT_TOKEN'];
  return token;
}

Future<String?> fetchUsername(String token) async {
  final username = (await Telegram(token).getMe()).username;
  return username;
}
