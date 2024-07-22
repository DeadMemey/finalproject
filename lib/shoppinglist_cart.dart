import 'package:flutter/material.dart';

class ShoppinglistCart extends StatefulWidget {
  @override
  _ShoppinglistCartState createState() => _ShoppinglistCartState();
}

class _ShoppinglistCartState extends State<ShoppinglistCart> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Item 1', 'price': 29.99},
    {'name': 'Item 2', 'price': 19.99},
    {'name': 'Item 3', 'price': 49.99},
    // Add more items as needed
  ];

  void _editItem(int index) {
    final TextEditingController nameController =
        TextEditingController(text: items[index]['name']);
    final TextEditingController priceController =
        TextEditingController(text: items[index]['price'].toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Item Name'),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Item Price'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  items[index] = {
                    'name': nameController.text,
                    'price': double.tryParse(priceController.text) ??
                        items[index]['price']
                  };
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  double _calculateTotalPrice() {
    return items.fold(0, (sum, item) => sum + (item['price'] as double));
  }

  void _pay() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment'),
          content: Text(
              'Total amount of \$${_calculateTotalPrice().toStringAsFixed(2)} will be processed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add payment processing logic here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Payment Successful'),
                      content: Text(
                          'Your payment of \$${_calculateTotalPrice().toStringAsFixed(2)} has been processed.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Pay'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Untitled_1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.1),
            child: Text(
              'My Shopping List',
              style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 219, 182, 18),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.3),
            child: Container(
              height: 290,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.shopping_cart, color: Colors.white),
                        title: Text(
                          items[index]['name'],
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Text(
                          '\$${items[index]['price'].toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () => _editItem(index),
                      ),
                      if (index < items.length - 1)
                        Divider(color: Colors.black),
                    ],
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${_calculateTotalPrice().toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _pay,
                  child: Text('Pay'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
