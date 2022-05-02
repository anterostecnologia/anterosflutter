import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import './utils/app.dart';

// An about icon button used on the example's app bar, but only if the
// app is built for web or desktop. Main usage is to show licenses on the Web
// version and to show what version of Flutter the Live version of the
// example app was built with.
class AboutIconButton extends StatelessWidget {
  const AboutIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info),
      onPressed: () {
        showAppAboutDialog(context);
      },
    );
  }
}

/// This [showAppAboutDialog] function is based on the [AboutDialog] example
/// that exist(ed) in the Flutter Gallery App.
void showAppAboutDialog(BuildContext context) {
  final ThemeData themeData = Theme.of(context);
  final TextStyle aboutTextStyle = themeData.textTheme.bodyText1!;
  final TextStyle footerStyle = themeData.textTheme.caption!;
  final TextStyle linkStyle = themeData.textTheme.bodyText1!
      .copyWith(color: themeData.colorScheme.primary);

  showAboutDialog(
    context: context,
    applicationName: App.appName,
    applicationVersion: App.version,
    applicationIcon: const SizedBox(
      height: 100,
      width: 100,
      child: Image(image: AssetImage(App.icon)),
    ),
    applicationLegalese: '${App.copyright} ${App.author} ${App.license}',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: aboutTextStyle,
                text: 'Este exemplo mostra os recursos do '
                    '${App.appName} pacote. Para saber mais, verifique '
                    'fora o pacote em ',
              ),
              LinkTextSpan(
                style: linkStyle,
                url: App.packageUrl,
                text: 'pub.dev',
              ),
              TextSpan(
                style: aboutTextStyle,
                text: '. Ele contém extensa documentação e a fonte '
                    'deste aplicativo de exemplo.\n\n',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

/// An URL link TextSpan that contain an URL link that can be used as a
/// working URL link text when using it in a [Text.rich] or lower
/// level [RichText] widget.
class LinkTextSpan extends TextSpan {
  // Beware!
  // This class is only safe because the TapGestureRecognizer is not
  // given a deadline and therefore never allocates any resources.
  // In any other situation -- setting a deadline, using any of the less trivial
  // recognizers, etc -- you would have to manage the gesture recognizers
  // lifetime and call dispose() when the TextSpan was no longer being rendered.
  // Since TextSpan itself is @immutable, this means that you would have to
  // manage the recognizer from outside the TextSpan, e.g. in the State of a
  // stateful widget that then hands the recognizer to the TextSpan.
  LinkTextSpan({TextStyle? style, String? url, String? text})
      : super(
          style: style,
          text: text ?? url,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launch(url!, forceSafariVC: false);
            },
        );
}
