import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:health_aid_app/util/gradient_icon.dart';
import 'package:health_aid_app/util/url_luncher.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme _theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: KBackButton(),
        centerTitle: true,
        title: Text(
          'health Aid',
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // _firstTop(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    coverImage(),
                    SizedBox(height: 10),
                    ListTile(
                      // onTap: () =>
                      //     Url.launchURL('https://info-winmart.web.app/terms'),
                      title: Text(
                        'Terms and Conditions',
                      ),
                    ),
                    ListTile(
                      // onTap: () {
                      //   Url.launchURL('https://info-winmart.web.app/privacy');
                      // },
                      title: Text(
                        'Privacy Policy',
                      ),
                    ),
                    ListTile(
                      // onTap: () {
                      //   Url.launchURL('https://info-winmart.web.app/refund');
                      // },
                      title: Text(
                        'Refund Policy',
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Url.launchURL('https://dsc-knust.web.app/');
                      },
                      title: Text(
                        'Our Website',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        'Built with \♥ by DSC KNUST',
                        style: _theme.caption,
                      ),
                    )
                  ],
                ),
              ),
            ),
            _socialIcons(),
          ],
        ),
      ),
    );
  }
}

Widget _firstTop() {
  return Container(
    color: Colors.green,
  );
}

Widget coverImage() {
  return Container(
    padding: EdgeInsets.all(30),
    child: Center(),
  );
}

Widget _socialIcons() {
  return FittedBox(
    child: Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Url.launchURL('https://wa.me/233501652647');
            },
            icon: Icon(EvaIcons.messageCircleOutline),
            iconSize: 40,
            color: Color.fromRGBO(37, 211, 102, 1),
          ),
          IconButton(
            onPressed: () {
              Url.launchURL(
                  'mailto:paulboamah22@gmail.com?subject=subject&body=body');
            },
            icon: Icon(EvaIcons.at),
            iconSize: 40,
            color: Color.fromRGBO(221, 75, 57, 1),
          ),
          IconButton(
            onPressed: () {
              Url.launchURL('https://web.facebook.com/paul.boamah.9699');
            },
            icon: Icon(EvaIcons.facebook),
            iconSize: 40,
            color: Color.fromRGBO(59, 89, 152, 1),
          ),
          IconButton(
            onPressed: () {
              Url.launchURL('https://bit.ly/winmart-ig');
            },
            icon: GradientIcon(
              gradient: Gradients.backToFuture,
              icon: Icon(
                EvaIcons.image,
                color: Colors.white,
              ),
            ),
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {
              Url.launchURL('tel:+233501652647');
            },
            icon: Icon(EvaIcons.phone),
            iconSize: 40,
            color: Color.fromRGBO(10, 191, 83, 1),
          )
        ],
      ),
    ),
  );
}

Widget socialBotton(image) {
  return Material(
    shape: CircleBorder(),
    child: Image.asset(
      image,
    ),
  );
}
