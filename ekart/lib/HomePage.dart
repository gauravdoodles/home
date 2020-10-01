import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mykart/ProductPage.dart';
import 'package:mykart/models/Product.dart';
import 'package:mykart/widgets/CategoryItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List bannerAdSlider = [
    "assets/banner1.jpg",
    "assets/banner2.jpg",
    "assets/banner3.jpg",
    "assets/banner4.jpg",
    "assets/banner5.jpg",
    "assets/banner6.jpg",
    "assets/banner7.jpg",
    "assets/banner8.jpg"
  ];

  List<Product> products = [
    Product(
        image: "assets/product1.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "iPad mini"),
    Product(
        image: "assets/product2.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "iPad Pro"),
    Product(
        image: "assets/product3.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "iPhone Pro Max"),
    Product(
        image: "assets/product4.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Apple Watch Series 3"),
    Product(
        image: "assets/product5.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Apple Watch Series 4"),
    Product(
        image: "assets/product6.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Macbook Pro 16 inch"),
    Product(
        image: "assets/product7.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Macbook Pro"),
    Product(
        image: "assets/product8.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "iMac 4k Retina"),
    Product(
        image: "assets/product9.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "T-Shirts"),
    Product(
        image: "assets/product10.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Ethnic Wear - Dress"),
    Product(
        image: "assets/product11.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Dress"),
    Product(
        image: "assets/product12.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "T-Shirt"),
  ];

  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      key: drawerKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MyKart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            drawerKey.currentState.openDrawer();
          },
          icon: Icon(EvaIcons.menu2Outline),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.shoppingBagOutline),
          ),
        ],
      ),
      drawerEdgeDragWidth: 0,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(16),
              ),
              accountEmail: Text(
                "person@mail.com",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              accountName: Text(
                "Allice",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/1065084/pexels-photo-1065084.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Home"),
              leading: Icon(EvaIcons.homeOutline),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Account"),
              leading: Icon(EvaIcons.personOutline),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Electronics"),
              leading: Icon(EvaIcons.bulbOutline),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Fashion"),
              leading: Icon(EvaIcons.heartOutline),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16/5,
                  child: Image.asset(
                    "assets/banner8.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: <Widget>[
                    CategoryItem(
                      icon: EvaIcons.giftOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFffe291),
                    ),
                    CategoryItem(
                      icon: EvaIcons.headphonesOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFF91bfff),
                    ),
                    CategoryItem(
                      icon: EvaIcons.hardDriveOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFff91c1),
                    ),
                    CategoryItem(
                      icon: EvaIcons.printerOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFF5340de),
                    ),
                    CategoryItem(
                      icon: EvaIcons.videoOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFF47e6a9),
                    ),
                    CategoryItem(
                      icon: EvaIcons.umbrellaOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFff788e),
                    ),
                    CategoryItem(
                      icon: EvaIcons.tvOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFff9378),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),
              // banner ad slider

              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                ),
                items: bannerAdSlider.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image(
                            image: AssetImage(i),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              // banner ad slider

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Products",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              GridView.count(
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 1 / 1.25,
                children: products.map((product) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Hero(
                              tag: product.image,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Image(
                                  image: AssetImage(product.image),
                                ),
                              ),
                            ),
                            Text(
                              product.productName,
                            ),
                            Text(
                              "${product.price}\$",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                    product: product,
                                  ),
                                ));
                          },
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
