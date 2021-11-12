// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'package:woynshet_taem/screens/home/components/prduct_detail.dart';

// class ProductCatagoryPage extends StatefulWidget {
//   @override
//   State<ProductCatagoryPage> createState() => _ProductCatagoryPageState();
// }

// class _ProductCatagoryPageState extends State<ProductCatagoryPage> {
//   // List user = [];
//   // bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     this.fetchUser();
//   }

//   fetchUser() async {
//     final response =
//         await http.get(Uri.parse('https://fakestoreapi.com/users/1'));

//     if (response.statusCode == 200) {
//       var items = json.decode(response.body);
//       return items;
     
//     } else {
      
//       print("error");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Color(0xfffcfaf8),
//         body: Container(
//           padding: EdgeInsets.only(right: 15.0),
//           width: MediaQuery.of(context).size.width - 10.0,
//           height: MediaQuery.of(context).size.height,
//           child: FutureBuilder(
//               future: fetchUser(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                       ),
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (context, index) {
//                         return profile(
//                             id: snapshot.data[index]['id'],
//                             email: snapshot.data[index]['title'],
//                             username: snapshot.data[index]['description'],
//                             phoneNumber: snapshot.data[index]['price'],
//                             password: snapshot.data[index]['category'],
//                            );
//                       });
//                 } else
//                   return CircularProgressIndicator();
//               }),
//         ));
//   }

//   Widget profile({
//     num id,
//     String email,
//     String username,
//     String password,
//     String address,
//     String phoneNumber,
//   }) {
//     return Padding(
//       padding: EdgeInsets.only(top: 5, bottom: 1, left: 5, right: 5),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 3.0,
//                 blurRadius: 5.0,
//               ),
//             ],
//             color: Colors.white),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 15,
//             ),
          
//             SizedBox(
//               height: 4.0,
//             ),
//             /////
//             Text(username,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xffcc8053),
//                   fontFamily: "Overlock",
//                   fontSize: 12,
//                 )),
//             Text(
//               " ${price} Birr",
//               style: TextStyle(
//                 color: Color(0xff575e67),
//                 fontFamily: "Overlock",
//                 fontSize: 14,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8),
//               child: Container(
//                 color: Colors.orange,
//                 height: 1.0,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 5, right: 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   if (!added) ...[
//                     Text(
//                       "See more ...",
//                       style:
//                           TextStyle(color: Color(0xffd17e50), fontSize: 12.0),
//                     ),
//                   ]
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
