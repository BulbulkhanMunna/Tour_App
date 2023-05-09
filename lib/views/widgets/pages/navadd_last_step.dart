



import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourapp/ui/styles/styles.dart';
import 'package:tourapp/views/widgets/customText_field.dart';
import 'package:tourapp/views/widgets/violetButton.dart';

class NavAddLastStep extends StatefulWidget {
  String name;
  String description;
  String cost;
  String facility;
  String destination;
  NavAddLastStep(
      {required this.name,
      required this.description,
      required this.cost,
      required this.facility,
      required this.destination});

  @override
  State<NavAddLastStep> createState() => _NavAddLastStepState();
}

class _NavAddLastStepState extends State<NavAddLastStep> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  var authCredential = FirebaseAuth.instance.currentUser;
  FirebaseStorage storage = FirebaseStorage.instance;
  List<XFile>? multipleImage;
  List<String> imageUrls = [];

  Future multipleImagePicker() async {
    multipleImage = await _picker.pickMultiImage();
    setState(() {});
  }

  Future uploadImages() async {
     try {
      if (multipleImage != null) {
        AppStyles().progressDialog(context);
        for (int i = 0; i < multipleImage!.length; i += 1) {
          // upload to stroage
          File imageFile = File(multipleImage![i].path);

          UploadTask uploadTask = storage
              .ref('${authCredential!.email}')
              .child(multipleImage![i].name)
              .putFile(imageFile);
          TaskSnapshot snapshot = await uploadTask;
          String imageUrl = await snapshot.ref.getDownloadURL();
          imageUrls.add(imageUrl);
        }

        // upload to database
        uploadToDB();
      } else {
        Fluttertoast.showToast(msg: "Something is wrong.");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed");
      Get.back();
    }
  }

  uploadToDB() {
    if (imageUrls.isNotEmpty) {
      CollectionReference data =
          FirebaseFirestore.instance.collection("all-data");
      data.doc(authCredential!.email).collection('images').doc().set({
        "owner_name": widget.name,
        "description": widget.description,
        "cost": widget.cost,
        "facilities": widget.facility,
        "destination": widget.destination,
        "phone": _phoneController.text,
        "gallery_img": FieldValue.arrayUnion(imageUrls),
      }).whenComplete(
        () => Fluttertoast.showToast(msg: "Uploaded Successfully"),
      );
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.name);
    print(widget.description);
    print(widget.cost);
    print(widget.facility);
    print(widget.destination);
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField("Phone Number", _phoneController),
              customTextField("Destination Date & Time", _dateTimeController),
              Text(
                "Choose Image",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
              ),
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EBED),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
                child: Center(
                  child: FloatingActionButton(
                    onPressed: () => multipleImagePicker(),
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: multipleImage?.length ?? 0,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Container(
                        width: 100,
                        child: multipleImage?.length == null
                            ? const Center(
                                child: Text("Images are empty"),
                              )
                            : Image.file(
                                File(multipleImage![index].path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              VioletButton("Upload", () {
                uploadImages();
                Get.back();
                
              }),
            ],
          ),
        ),
      ),
    );
  }
}
