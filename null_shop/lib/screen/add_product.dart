import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:null_shop/themes/color.dart';
import 'package:null_shop/widget/input_decorition.dart';
import 'package:null_shop/widget/main_btn_widget.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();
  String? productCategory = "Pen",
      productName,
      productPrice,
      productQuantity,
      productDescription;

  File? imageFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //ปุ่มย้อนกลับ
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            color: kColorsWhite,
          ),
          onPressed: () {
            Navigator.pop(context, "/home");
          },
        ),
        //พื้นหลังของ AppBar
        backgroundColor: kColorsPurple,
        //หัวเรื่องของ AppBar
        title: Text(
          "ADD PRODUCT",
          style: Theme.of(context).textTheme.headline3,
        ),
        //ความสุงของ AppBar
        toolbarHeight: 60,
        //เงา
        elevation: 0,
        //เส้นคั่น
        shape: Border(bottom: BorderSide(color: kColorsCream, width: 1.5)),
        //Icon
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/msg.svg',
              color: kColorsWhite,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/profile");
              },
              icon: SvgPicture.asset(
                'assets/icons/me.svg',
                color: kColorsWhite,
              ))
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          //รูป
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showBottomSheet(context);
                      },
                      child: imageFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                imageFile!,
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: kColorsPurple),
                            ),
                    ),
                    CreateProductCategory(),
                    CreateProductName(),
                    CreateProductPrice(),
                    CreateProductQuantity(),
                    CreateProductDescription()
                  ],
                )),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                }
              },
              child: MainBtnWidget(
                  colorBtn: kColorsPurple,
                  textBtn: "Comfirm",
                  isTransparent: false,
                  haveIcon: false),
            ),
          ))
        ],
      ),
    );
  }

  Widget CreateProductCategory() {
    List<String> category = [
      'Pen',
      'Book',
      'Paper',
      'Eraser',
      'Marker',
      'Folder'
    ];
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: InputDecorator(
          decoration: InputDecoration(
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10),
                borderSide: BorderSide(color: kColorsGrey, width: 1),
              ),
              errorStyle: Theme.of(context).textTheme.bodyText2),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                value: productCategory,
                icon: SvgPicture.asset('assets/icons/down.svg',
                    color: kColorsGrey),
                elevation: 3,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: kColorsPurple),
                items: category.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    productCategory = value.toString();
                  });
                }),
          ),
        ));
  }

  Widget CreateProductName() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: kColorsPurple),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please Enter again.";
            } else {
              return null;
            }
          },
          onChanged: (value) {
            productName = value;
          },
          decoration: InputDecorationWidget(context, "Name")),
    );
  }

  Widget CreateProductPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: kColorsPurple),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please Enter again.";
            } else {
              return null;
            }
          },
          onChanged: (value) {
            productPrice = value;
          },
          decoration: InputDecorationWidget(context, "Price")),
    );
  }

  Widget CreateProductQuantity() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.number,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: kColorsPurple),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please Enter again.";
            } else {
              return null;
            }
          },
          onChanged: (value) {
            productQuantity = value;
          },
          decoration: InputDecorationWidget(context, "Quantity")),
    );
  }

  Widget CreateProductDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: kColorsPurple),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please Enter again.";
            } else {
              return null;
            }
          },
          onChanged: (value) {
            productDescription = value;
          },
          decoration: InputDecorationWidget(context, "Description")),
    );
  }

  //Add picture Product
  Future<void> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Wrap(
              children: [
                ListTile(
                  onTap: () {
                    openGallery(context);
                  },
                  leading: SvgPicture.asset(
                    'assets/icons/gallery.svg',
                    color: kColorsBlack,
                  ),
                  title: Text(
                    "Gellery",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    openCamera(context);
                  },
                  leading: SvgPicture.asset(
                    'assets/icons/camera.svg',
                    color: kColorsBlack,
                  ),
                  title: Text(
                    "Camera",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )
              ],
            ),
          );
        });
  }

  openGallery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No Image selected');
      }
    });
    Navigator.of(context).pop();
  }

  openCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No Image selected');
      }
    });
    Navigator.of(context).pop();
  }
}
