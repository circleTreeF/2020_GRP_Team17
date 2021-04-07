
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


/// This class defines the developer information interface.
class AboutUs extends StatefulWidget {
  /// Constructs the [AboutUs] widget
  AboutUs({Key key}) : super(key: key);

  @override
  AboutUsState createState() => AboutUsState();



}

/// This class defines the state of the widgets in AboutUs interface
class AboutUsState extends State<AboutUs> {
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


  /**
   *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
   *** @date: 2021/3/11 6:43 PM
   *** @version:1.0
   **/

  ///Returns the button used to launcher the [url].
  ///the parameter [text] is the text in the button
  ///the parameter [url] is the Uniform Resource Locator of certain website
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

  /**
   *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
   *** @date: 2021/3/11 6:43 PM
   *** @version:1.0
   **/

  ///Launches the certain [url].
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
