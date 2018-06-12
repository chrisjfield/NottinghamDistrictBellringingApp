import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String parse(String url) {
    return Uri.parse(url).toString();
  }
}
