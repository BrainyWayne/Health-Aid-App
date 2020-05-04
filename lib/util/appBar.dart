import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_aid_app/util/search.dart';

Widget buildAppTitle({
  @required Widget leading,
  @required BuildContext context,
  String placeholder = 'Search...',
  Widget trailing,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 2),
    height: 50,
    child: Card(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          leading == null ? Container() : leading,
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              child: Text(
                placeholder,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          SizedBox(width: 10),
          trailing == null ? Container(width: 50) : trailing,
        ],
      ),
    ),
  );
}
