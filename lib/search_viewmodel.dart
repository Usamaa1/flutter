import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

class SearchViewModel extends BaseViewModel {
  String values = '';

  Stream<QuerySnapshot> get searchResult {
    return FirebaseFirestore.instance
        .collection('products')
        .orderBy('prodName')
        .startAt([values]).endAt([values + '\uf8ff']).snapshots();
  }

  void updateValueInput(query) {
    values = query;
    rebuildUi();
  }
}
