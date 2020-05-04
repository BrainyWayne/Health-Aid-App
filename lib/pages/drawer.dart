import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/locator.dart';
import 'package:health_aid_app/pages/login/login.dart';
import 'package:health_aid_app/services/navigation_service.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  final NavigationService _nav = locator.get<NavigationService>();
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    FirebaseUser _user = Provider.of<FirebaseUser>(context);
    return Container(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: _theme.primaryColor,
          ),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35,
                backgroundImage: CachedNetworkImageProvider('doctor.profile'),
                child: Icon(EvaIcons.personAddOutline, size: 20),
              ),
              SizedBox(height: 10),
              Container(
                child: Text(
                  '${_user.displayName}',
                  style: _theme.textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 7),
              Container(
                  child: Text(
                '${_user.email}',
                style: _theme.textTheme.subtitle2,
              )),
            ],
          ),
        ),
        buildDrawerItem(
          context,
          leading: EvaIcons.homeOutline,
          title: 'Home',
          callback: (title) {
            // _nav.navigateBack();
            // _nav.replaceWith('/home');
          },
        ),
        buildDrawerItem(
          context,
          leading: EvaIcons.personOutline,
          title: 'Profile',
          callback: (title) {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/profile');
          },
        ),
        buildDrawerItem(
          context,
          leading: EvaIcons.bellOutline,
          title: 'Notifications',
          callback: (title) {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/notifications');
          },
        ),
        // buildDrawerItem(
        //   context,
        //   leading: EvaIcons.bellOutline,
        //   title: 'Notifications',
        //   callback: (title) {
        //     Navigator.of(context).pop();
        //     Navigator.of(context).pushNamed('/notifications');
        //   },
        // ),
        buildDrawerItem(
          context,
          leading: EvaIcons.doneAll,
          title: 'Health Tips',
          callback: (title) {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/health_tips');
          },
        ),
        buildDrawerItem(
          context,
          leading: EvaIcons.activityOutline,
          title: 'About Us',
          callback: (title) {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/about_us');
          },
        ),
      ],
    ));
  }

  Widget buildDrawerItem(
    BuildContext context, {
    String title,
    String subtitle,
    IconData leading,
    bool enabled = true,
    Function(String title) callback,
  }) {
    ThemeData _theme = Theme.of(context);

    return ListTile(
      title: Text(
        title,
        style: _theme.textTheme.headline5,
      ),
      leading: Icon(
        leading,
        size: _theme.textTheme.headline5.fontSize,
        color: _theme.primaryColor,
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      onTap: () => callback('title'),
      enabled: enabled,
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper3(),
          child: Container(
            child: Column(),
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Color(0x44ff3a5a), Colors.blue])),
          ),
        ),
        ClipPath(
          clipper: WaveClipper1(),
          child: Container(
            child: Stack(
              children: <Widget>[
                Image.asset('assets/heart.png'),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.blue.withOpacity(0.9),
                    Colors.blue.withOpacity(0.9)
                  ])),
                )
              ],
            ),
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.blue])),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Prince Amofah",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "angellosprince@gmail.com",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        )
      ],
    );
  }
}
