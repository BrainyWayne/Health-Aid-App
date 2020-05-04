import 'package:flutter/material.dart';
import 'package:health_aid_app/data/data.dart';
import 'package:health_aid_app/locator.dart';
import 'package:health_aid_app/models/menu_model.dart';
import 'package:health_aid_app/pages/drawer.dart';
import 'package:health_aid_app/pages/home/home_model.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:provider/provider.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String _selection;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    MediaQueryData _media = MediaQuery.of(context);

    return ChangeNotifierProvider(
      create: (context) => HomeModel(),
      child: Consumer<HomeModel>(
        builder: (context, model, child) => Scaffold(
          // appBar: AppBar(
          //   title: Text("healthAid"),
          // ),
          key: model.scaffoldKey,
          drawer: Drawer(
            child: NavDrawer(),
          ),
          body: Stack(
            children: <Widget>[
              Background(),
              Center(
                child: GridMenu(),
              ),
              SafeArea(
                child: PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () =>
                            model.scaffoldKey.currentState.openDrawer(),
                      ),
                      Spacer(),
                      KNotification()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _media = MediaQuery.of(context);
    return Container(
      height: _media.size.height * 0.55,
      width: _media.size.width,
      foregroundDecoration: BoxDecoration(
        ///! TODO: implement gradient
        gradient: Gradients.coldLinear,
      ),
      child: Image(
        // alignment: Alignment.topCenter,
        // height: 200,
        fit: BoxFit.cover,
        image: AssetImage('assets/heart.png'),
      ),
    );
  }
}

class GridMenu extends StatelessWidget {
  List<MENU> menu = locator.get<TestData>().menu;
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    MediaQueryData _media = MediaQuery.of(context);
    return ListView(
      shrinkWrap: true,
      // physics: _media.orientation == Orientation.portrait
      //     ? NeverScrollableScrollPhysics()
      //     : AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 100),
                    Image(
                      width: 100,
                      height: 100,
                      image: AssetImage('assets/cancer-2.png'),
                    ),
                    RichText(
                      text: TextSpan(
                          style: _theme.textTheme.headline5,
                          children: [
                            TextSpan(text: 'health'),
                            TextSpan(
                              text: 'Aid',
                              style: _theme.textTheme.headline4.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: menu.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index) => menuItem(context,
                    menu[index].title, menu[index].icon, menu[index].path),
              ),
            ],
          ),
        ),
      ],
    );
  }

  menuItem(BuildContext context, String menu, IconData icon, String path) {
    ThemeData _theme = Theme.of(context);
    return Material(
      animationDuration: Duration(seconds: 2),
      borderRadius: BorderRadius.circular(7),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(path),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ShaderMask(
                child: Icon(
                  icon,
                  size: 90,
                  color: Colors.white,
                ),
                shaderCallback: (bounds) =>
                    Gradients.coldLinear.createShader(bounds),
              ),
            ),
            SizedBox(height: 5),
            Container(
              child: Text(
                menu,
                style: _theme.textTheme.bodyText2.copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
