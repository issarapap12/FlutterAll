import 'package:CWCFlutter/Food_Delivery_App_Demo/colors/colors.dart';
import 'package:CWCFlutter/Food_Delivery_App_Demo/constants/constants.dart';
import 'package:CWCFlutter/Food_Delivery_App_Demo/screens/food_detail.dart';
import 'package:CWCFlutter/Food_Delivery_App_Demo/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFood extends StatefulWidget {
  @override
  _HomeFoodState createState() => _HomeFoodState();
}

class _HomeFoodState extends State<HomeFood> {
  int selectedCategorycard = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 10.w),
          //รูปprofile
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/man.jpeg'),
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/menu.svg'),
            onPressed: null,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: PrimaryText(
                    text: 'Food',
                    size: 22,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: PrimaryText(
                    text: 'Delivery',
                    height: 1.1,
                    size: 42,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 20.w),
                    Icon(
                      Icons.search,
                      color: AppColors.secondary,
                      size: 25,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: TextField(
                        decoration:
                            inputDecoration.copyWith(hintText: 'Search...'),
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: PrimaryText(
                      text: 'Categories',
                      fontWeight: FontWeight.w700,
                      size: 22),
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodCategoryList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                      child: foodCategoryCard(
                        foodCategoryList[index]['imagePath'],
                        foodCategoryList[index]['name'],
                        index,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: PrimaryText(
                    text: 'Popular',
                    fontWeight: FontWeight.w700,
                    size: 22,
                  ),
                ),
                Column(
                  children: List.generate(
                    popularFoodList.length,
                    (index) => popularFoodCard(
                      context,
                      popularFoodList[index]['imagePath'],
                      popularFoodList[index]['name'],
                      popularFoodList[index]['weight'],
                      popularFoodList[index]['star'],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget popularFoodCard(BuildContext context, String imagePath, String name,
      String weight, String star) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodDetail(imagePath)))
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 25.0,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.lighterGray,
                blurRadius: 15,
              ),
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 25.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.primary,
                          size: 15,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        PrimaryText(
                          text: 'top of the week',
                          size: 18.0,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.1,
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: PrimaryText(
                      text: name,
                      fontWeight: FontWeight.w800,
                      size: 22,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: PrimaryText(
                      text: weight,
                      size: 18,
                      color: AppColors.lightGray,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 45.0,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          color: AppColors.primary,
                        ),
                        child: Icon(Icons.add, size: 20),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 12),
                          SizedBox(
                            width: 5,
                          ),
                          PrimaryText(
                            text: star,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(15, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightGray,
                      blurRadius: 20,
                    ),
                  ]),
              child: Hero(
                tag: imagePath,
                child: Image.asset(
                  imagePath,
                  width: MediaQuery.of(context).size.width / 2.9,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodCategoryCard(String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () => {
        setState(
          () => {
            print(index),
            selectedCategorycard = index,
          },
        ),
      },
      child: Container(
        margin: EdgeInsets.only(right: 20.w, top: 20.h, bottom: 20.h),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: selectedCategorycard == index
                ? AppColors.primary
                : Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.lighterGray,
                blurRadius: 15,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(imagePath, width: 40.w),
            PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
            RawMaterialButton(
                onPressed: null,
                fillColor: selectedCategorycard == index
                    ? Colors.white
                    : AppColors.tertiary,
                shape: CircleBorder(),
                child: Icon(Icons.chevron_right_rounded,
                    size: 20,
                    color: selectedCategorycard == index
                        ? Colors.black
                        : Colors.white))
          ],
        ),
      ),
    );
  }
}
