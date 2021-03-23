
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


/// [AboutUs] defines the info page.
class AboutUs extends StatefulWidget {
  /// Constructs the [AboutUs] widget
  AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();



}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Column(

          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo.png',
                width: 250,
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
            Text(
              'GRP Team 2020 17',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
            launcherButton('Find project on GitLab', 'https://csprojects.nottingham.edu.cn/scyyf1/2020_grp_17'),
            launcherButton('More about us', 'http://cslinux.nottingham.edu.cn/~Team202017/'),
            Padding(
              padding: EdgeInsets.only(bottom: 60),
            ),
          ],
    );
  }

  ///Returns the button used to launcher the url.
  Widget launcherButton(String text, String url) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 50,
      margin: const EdgeInsets.only(top: 24.0),
      alignment: Alignment.center,
      child: SizedBox.expand(
        child: RaisedButton(
          textTheme: Theme.of(context).buttonTheme.textTheme,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          padding: EdgeInsets.all(8),
          child: Text(text),
          onPressed: () => launchURL(url),
        ),
      ),
    );
  }


  ///launch the url.
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
