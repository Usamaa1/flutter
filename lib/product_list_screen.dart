class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showProductDialog(context),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: products.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No products available.'));
          }

          final productDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: productDocs.length,
            itemBuilder: (context, index) {
              final product = productDocs[index];
              final name = product['name'];
              final price = product['price'];

              return ListTile(
                title: Text(name),
                subtitle: Text('Price: \$${price.toString()}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showProductDialog(context,
                          productId: product.id, name: name, price: price),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteProduct(product.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showProductDialog(BuildContext context,
      {String? productId, String? name, double? price}) {
    final nameController = TextEditingController(text: name);
    final priceController = TextEditingController(
        text: price != null ? price.toString() : '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(productId == null ? 'Add Product' : 'Edit Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final productName = nameController.text.trim();
                final productPrice = double.tryParse(priceController.text.trim());

                if (productName.isNotEmpty && productPrice != null) {
                  if (productId == null) {
                    _addProduct(productName, productPrice);
                  } else {
                    _updateProduct(productId, productName, productPrice);
                  }
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addProduct(String name, double price) async {
    await products.add({'name': name, 'price': price});
  }

  Future<void> _updateProduct(String productId, String name, double price) async {
    await products.doc(productId).update({'name': name, 'price': price});
  }

  Future<void> _deleteProduct(String productId) async {
    await products.doc(productId).delete();
  }
}
