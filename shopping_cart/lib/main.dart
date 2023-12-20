// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class Product {
  String name;
  double price;
  String image;

  Product({required this.name, required this.price, required this.image});
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _goToShoppingPage(String username, String password) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ShoppingPage(username: username, password: password),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  suffixStyle: TextStyle(fontSize: 18)),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Parola'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  _goToShoppingPage(
                      _usernameController.text, _passwordController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Kullanıcı adı veya parola boş olamaz"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              child: const Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  late List<Product> products;

   ShoppingCart({super.key, required this.products});

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Product> products = [];

  void addToProductsArray(String name, double price, String image) {
    products.add(Product(name: name, price: price, image: image));
  }

  totalPrice() {
    double total = 0;
    for (var i = 0; i < widget.products.length; i++) {
      total += widget.products[i].price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 20),
            children: <TextSpan>[
              const TextSpan(
                  text: 'Sepetim', style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: ' (${widget.products.length})',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFFFF6000))),
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Image.asset(widget.products[index].image),
                title: Text(widget.products[index].name),
                subtitle: Text("${widget.products[index].price} TL"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.products.removeAt(index);
                    });
                  },
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Toplam Tutar:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              " ${totalPrice()}TL",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingPage extends StatefulWidget {
  final String username;
  final String password;

  const ShoppingPage(
      {super.key, required this.username, required this.password});

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<Product> products = [];
  ShoppingCart shoppingCart = ShoppingCart(products: []);



  _gotoLoginPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  _gotoShoppingCart(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoppingCart(products: products),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Hoş geldiniz, ${widget.username}",
            style: const TextStyle(fontSize: 20),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFFF6000),
                ),
                child: Text(
                  'Menü',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    children: [
                      const TextSpan(text: "Sepetim "),
                      const WidgetSpan(
                          child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 20,
                        color: Colors.black,
                      )),
                      TextSpan(
                        text: " (${shoppingCart.products.length})",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF6000)),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _gotoShoppingCart(context);
                },
              ),
              ListTile(
                  title: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      children: [
                        TextSpan(text: "Çıkış Yap "),
                        WidgetSpan(
                            child: Icon(
                          Icons.logout,
                          size: 20,
                          color: Colors.black,
                        )),
                      ],
                    ),
                  ),
                  onTap: () {
                    _gotoLoginPage(context);
                  }),
            ],
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(8.0),
          children: List.generate(8, (index) {
            return Center(
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                child: Wrap(runSpacing: 55, children: [
                  Column(mainAxisSize: MainAxisSize.max, children: [
                    Image.asset(
                      "./img/products/${index + 1}.jpg",
                      width: 90,
                    ),
                    Text(
                      "${index + 1}. Ürün",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Fiyat: ${(index + 1) * 1587} TL",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF6000),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                elevation: 0,
                                textStyle: const TextStyle()),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("${index + 1}. Ürün Sepete Eklendi"),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                              setState(() {
                                products.add(Product(
                                  name: "${index + 1}. Ürün",
                                  price: (index + 1) * 1587,
                                  image: "./img/products/${index + 1}.jpg",
                                ));

                                shoppingCart.products = products;

                              });
                            },
                            child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "Sepete Ekle",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )))),
                  ]),
                ]),
              ),
            );
          }),
        ));
  }
}
