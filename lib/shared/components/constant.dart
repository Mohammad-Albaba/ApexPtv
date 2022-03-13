
import 'package:video_player/video_player.dart';

String? token;
String? uId;

String printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
  return text;
}
final urlLandscapeVideo =
    'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/197432.mp4';
late VideoPlayerController controller;
