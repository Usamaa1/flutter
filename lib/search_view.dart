import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_viewmodel.dart';

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: TextField(
            onChanged: viewModel.updateValueInput,
            decoration: InputDecoration(
              labelText: 'Search Products',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        body: StreamBuilder(
            stream: viewModel.searchResult,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              final products = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${products[index]['prodName']}"),
                    );
                  });
            }));
  }

  @override
  SearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewModel();
}
