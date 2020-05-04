import 'package:algolia/algolia.dart';

class Application {
  static final Algolia algolia = Algolia.init(
    applicationId: '66GSH2JTIO',
    apiKey: 'd7d520fb5f06a5e2485ff97fd367649b',
  );
}

class AlgoliaService {
  AlgoliaService._privateConstructor();
  Algolia _algolia = Application.algolia.instance;
  static final AlgoliaService instance = AlgoliaService._privateConstructor();

  AlgoliaIndexReference get _productIndex => _algolia.index('prod_products');

  Future<List> performMovieQuery({String text}) async {
    // List<FIREPRODUCT> _products;
    // var _str = Observable.just(text);

    // _str
    //     .debounceTime(Duration(seconds: 1))
    //     .where((String query) => query.isNotEmpty)
    //     .where((String query) => query != null)
    //     .distinct()
    //     .where((String query) => query.length > 1)
    //     .listen((onData) async {
    //   final query = _productIndex.search(onData.trim());
    //   final AlgoliaQuerySnapshot snap = await query.getObjects();
    //   print('Hits count: ${snap.nbHits}');

    //   final products =
    //       snap.hits.map((f) => FIREPRODUCT.fromJSON(f.data)).toList();
    //   return _products = products;
    // });

    print('=================> ${text}');
    // if (text.trim().length > 1 && text != null) {
    //   print('=================> searching for $text');
    //   final query = _productIndex.search(text.trim());
    //   final AlgoliaQuerySnapshot snap = await query.getObjects();
    //   print('Hits count: ${snap.nbHits}');

    //   final products =
    //       snap.hits.map((f) => FIREPRODUCT.fromJSON(f.data)).toList();
    //   return products;
    // }
    // return  _products;
  }
}
