import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:pos_wappsi/components/button_global.dart';
import 'package:pos_wappsi/constant.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Image(image: AssetImage('assets/images/x.png'),)),
        title: Text(
          'Add Category',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppTextField(
              textFieldType: TextFieldType.NAME,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Fashion',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Category name',
              ),
            ),
            ButtonGlobalWithoutIcon(
              buttontext: 'Save',
              buttonDecoration: kButtonDecoration.copyWith(color: Theme.of(context).primaryColor),
              onPressed: () {
                finish(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
