import 'dart:async';

import 'package:fimber/fimber.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ExternalUrl {
  static void openLink(String url) async {
    if (await canLaunchUrlString(url)) {
      unawaited(launchUrlString(url));
    } else {
      Fimber.w('Unable to launch URL, no browser installed.');
    }
  }
}
