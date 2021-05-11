import 'package:CWCFlutter/Food_Delivery_App_Demo/colors/colors.dart';
import 'package:CWCFlutter/Food_Delivery_App_Demo/constants/constants.dart';
import 'package:CWCFlutter/Food_Delivery_App_Demo/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FoodDetail extends StatelessWidget {
  final String imagePath;
  FoodDetail(this.imagePath);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: ElevatedButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryText(
                text: 'Place an Order',
                fontWeight: FontWeight.w600,
                size: 18,
              ),
              Icon(Icons.chevron_right)
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => {},
        ),
      ),
      body: ListView(
        children: [
          customAppBar(context),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 25.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: 'Primavera\nPizza',
                  size: 48,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/dollar.svg',
                      color: AppColors.tertiary,
                      width: 15,
                    ),
                    PrimaryText(
                      text: '5.99',
                      size: 45,
                      fontWeight: FontWeight.w700,
                      color: AppColors.tertiary,
                      height: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: 'Size',
                            color: AppColors.lightGray,
                            size: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          PrimaryText(
                              text: 'Medium 14"', fontWeight: FontWeight.w600),
                          SizedBox(
                            height: 20,
                          ),
                          PrimaryText(
                            text: 'Crust',
                            color: AppColors.lightGray,
                            size: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          PrimaryText(
                            text: 'Thin Crust',
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PrimaryText(
                            text: 'Delivery in',
                            color: AppColors.lightGray,
                            size: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          PrimaryText(
                              text: '30 min', fontWeight: FontWeight.w600),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lightGray,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Hero(
                        tag: imagePath,
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 50),
            child: PrimaryText(
              text: 'Ingredients',
              fontWeight: FontWeight.w700,
              size: 22,
            ),
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ingredients.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                child: ingredientCard(ingredients[index]['imagePath']),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Container ingredientCard(String imagePath) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: EdgeInsets.only(
        right: 20,
        top: 15,
        bottom: 15,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.grey[300]),
          ]),
      child: Image.asset(
        imagePath,
        width: 90,
      ),
    );
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.grey[400])),
              child: Icon(Icons.chevron_left),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.star, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
