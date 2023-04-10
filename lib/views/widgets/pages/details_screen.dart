import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/state_manager.dart';
import 'package:tourapp/views/widgets/details_heading_description.dart';

class DetailsScreen extends StatelessWidget {
  final List _carouseImages = [
    'assets/images/cover-one.jpeg',
    'assets/images/cover-two.jpeg',
    'assets/images/cover-three.jpeg'
  ];
  //DetailsScreen(this.dtailsData);
  //Map dtailsData;

  final RxInt _currentIndex = 0.obs;

  String description = "In literary theory, a text is any object that can be read whether this object is a work of literature a street sign an arrangement of buildings on a city block or styles of clothing";
  String facilities = "In literary theory, a text is any object that can be read whether this object is a work of literature a street sign an arrangement of buildings on a city block or styles of clothing";
  String destination = " literature a street sign an arrangement of buildings on a city block or styles of clothing";

  //add to favourite
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Details"),
       /* actions: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: chekFav(context),
            builder: ((context, snapshot) {
              if (snapshot.data == null) return Text("");
              return IconButton(
                icon: snapshot.data!.docs.length == 0
                    ? Icon(
                        Icons.favorite_outlined,
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                onPressed: () {
                  snapshot.data!.docs.length == 0
                      ? addtoFavourite()
                      : Fluttertoast.showToast(
                          msg: "Already Added",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.deepOrange,
                          textColor: Colors.white,
                          fontSize: 13.0);
                },
              );
            }),
          )
        ],*/
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  
                 /* AspectRatio(aspectRatio: 3,
                  child: Image.network(widget.dtailsData['list_image'][0],
                  fit: BoxFit.cover,),
                  ),*/

                  detailsHeadingDescription("Description", description),
                  detailsHeadingDescription("Facilities", facilities),
                  detailsHeadingDescription("Destination", destination),
                  detailsHeadingDescription("Journey Date & Time", destination),
                  detailsHeadingDescription("Cost", "3000 taka"),

                ],
              ),
          
            ),
          ),
            Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                   "Owner Name",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            
                            
                          }, icon: Icon(Icons.call_outlined)),
                      IconButton(
                          onPressed: () {
                           
                          }, icon: Icon(Icons.message_outlined)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
