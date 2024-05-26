import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_online_shop/backend/api_service.dart';
import 'package:flutter_online_shop/screens/categories_list/product_page.dart';
import 'package:flutter_online_shop/models/category_model.dart'
    as categoryModel;

import '../../size_config.dart';

class CategoriesSeeMore extends StatefulWidget {
  @override
  _CategoriesSeeMoreState createState() => _CategoriesSeeMoreState();
}

class _CategoriesSeeMoreState extends State<CategoriesSeeMore> {
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Color(0xFF3B54A4),
        automaticallyImplyLeading: true,
        title: Text(
          'UBreak WeFix',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
              ),
            ),
            categoriesList(),
          ],
        ),
      ),
    );
  }

  Widget categoriesList() {
    return new FutureBuilder(
      future: apiService.getCategories(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<categoryModel.Category>> model,
      ) {
        if (model.hasData) {
          return _buildCategoryList(model.data);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildCategoryList(List<categoryModel.Category> categories) {
    return Container(
      height: getProportionateScreenHeight(600),
      alignment: Alignment.centerLeft,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 5,
        ),
        itemCount: categories.length, //categories.length
        itemBuilder: (context, index) {
          var data = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    categoryId: data.categoryId,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: getProportionateScreenWidth(130.0),
                  height: getProportionateScreenHeight(110.0),
                  alignment: Alignment.center,
                  child: Image.network(
                    data.image.url != null
                        ? data.image.url
                        : "https://www.freeiconspng.com/uploads/no-image-icon-21.png",
                    height: getProportionateScreenHeight(110.0),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 15.0,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      data.categoryName.toString(),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.red,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 14.0,
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
