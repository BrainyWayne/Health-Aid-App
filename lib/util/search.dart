import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/util/algolia.dart';

class CustomSearchDelegate extends SearchDelegate {
  final algoliaService = AlgoliaService.instance;
  List products;
  showSearch() {}

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(EvaIcons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading on the title bar
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    if (products != null && products.length > 1) {
      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
              // product: products[index],
              // cat: products[index].timestamp.toString(),
              // gridStyle: false,
              );
        },
      );
    } else {
      return buildEmptySearch();
    }
  }

  Container buildEmptySearch() {
    return Container(
      child: Center(
        child: Text('Nothing Found',
            style: TextStyle(
              fontSize: 23,
              letterSpacing: 1.2,
            )),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container(
      child: FutureBuilder<List>(
        future: algoliaService.performMovieQuery(text: query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          List _products = snapshot.data;
          products = _products;

          if (true) {
            return ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                // print({'OwnerID', _products[index].ownerID});
                return Container(
                    // product: _products[index],
                    // cat: _products[index].timestamp.toString(),
                    // gridStyle: false,
                    );
              },
            );
          } else if (snapshot.hasData &&
              _products != null &&
              _products.length < 1) {
            return buildEmptySearch();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

Widget _noResultsFound() {
  return Container(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.search,
          size: 100,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'No Results',
        ),
        Text(
          'Try a more general keyword',
        )
      ],
    ),
  );
}
