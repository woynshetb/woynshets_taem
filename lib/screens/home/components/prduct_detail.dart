import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/carts/cart_screen.dart';

class ProductDet extends StatefulWidget {
  final String assetPath, productTitle, produtDesc, catagory, shopeName;
  final double productPrice;

  const ProductDet(
      {Key key,
      this.assetPath,
      this.productPrice,
      this.productTitle,
      this.produtDesc,
      this.shopeName,
      this.catagory})
      : super(key: key);

  @override
  _ProductDetState createState() => _ProductDetState();
}

class _ProductDetState extends State<ProductDet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ItemImage(
              imgSrc: widget.assetPath,
            ),
            ItemInfo(
              title: widget.productTitle,
              assetPath: widget.assetPath,
              catagory: widget.catagory,
              productPrice: widget.productPrice,
              shopename: widget.shopeName,
              produtDesc: widget.produtDesc,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  final String title, assetPath, productTitle, produtDesc, shopename, catagory;
  final double productPrice;
  ItemInfo(
      {this.title,
      this.assetPath,
      this.catagory,
      this.productPrice,
      this.productTitle,
      this.shopename,
      this.produtDesc});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          shopeName(name: shopename),
          TitlePriceRating(
            name: title,
            numOfReviews: 24,
            rating: 4,
            price: productPrice,
            onRatingChanged: (value) {},
          ),
          Text(
            produtDesc,
            style: TextStyle(
              height: 1.5,
            ),
          ),
          SizedBox(height: size.height * 0.1),

          // give add to cart function

          OrderButton(
            size: size,
            press: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartScreen(
                          title: title,
                          imagePath: assetPath,
                          price: productPrice,
                        ))),
          ),
        ],
      ),
    );
  }

  Row shopeName({String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: kSecondaryColor,
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}

class ItemImage extends StatelessWidget {
  final String imgSrc;
  const ItemImage({
    Key key,
    this.imgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Image(
        image: NetworkImage(imgSrc),
        height: size.height * 0.25,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}

class TitlePriceRating extends StatelessWidget {
  final double price;
  final int numOfReviews;
  final double rating;
  final String name;
  final RatingChangeCallback onRatingChanged;
  const TitlePriceRating({
    Key key,
    this.price,
    this.numOfReviews,
    this.rating,
    this.name,
    this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  // style: Theme.of(context).textTheme.headline,
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    SmoothStarRating(
                      borderColor: kPrimaryColor,
                      rating: rating,
                      onRated: onRatingChanged,
                    ),
                    SizedBox(width: 10),
                    Text("$numOfReviews reviews"),
                  ],
                ),
              ],
            ),
          ),
          priceTag(context, price: price),
        ],
      ),
    );
  }

  ClipPath priceTag(BuildContext context, {double price}) {
    return ClipPath(
      clipper: PricerCliper(),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 66,
        width: 65,
        color: kPrimaryColor,
        child: Text(
          "\$$price",
          // style: Theme.of(context)
          //     .textTheme
          //     .title
          //     .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key key,
    @required this.size,
    this.press,
  }) : super(key: key);

  final Size size;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 10),
                  Text(
                    "Add to cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
