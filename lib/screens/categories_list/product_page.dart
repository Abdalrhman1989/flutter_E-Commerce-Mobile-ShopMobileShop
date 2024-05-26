import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/product_card_modified.dart';
import 'package:flutter_online_shop/models/product_model.dart';
import 'package:flutter_online_shop/screens/categories_list/components/body.dart';
import 'package:flutter_online_shop/size_config.dart';
import 'package:flutter_online_shop/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends Body {
  //CategoriesScreen is ProductPage in the tutorial
  //Body as BasePage
  static String routeName = "/categories_screen";
  final int categoryId;

  ProductPage({
    Key key,
    this.categoryId,
  });

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends BodyState<ProductPage> {
  int _pageNumber = 1; // _page in the tutorial
  ScrollController _scrollController = new ScrollController();

  final _searchQuery = new TextEditingController();
  Timer _debounce;

  final _sortByOptions = [
    SortBy(value: "popularity", text: "Popularity", sortOrder: "asc"),
    SortBy(value: "modified", text: "Latest", sortOrder: "asc"),
    SortBy(value: "price", text: "Price: High to Low", sortOrder: "desc"),
    SortBy(value: "price", text: "Price: Low to High", sortOrder: "asc"),
  ];

  @override
  void initState() {
    var productList = Provider.of<ProductProvider>(context, listen: false);
    productList.resetStreams();
    productList.setLoadingState(LoadMoreStatus.INITIAL);
    productList.fetchProducts(_pageNumber);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        productList.setLoadingState(LoadMoreStatus.LOADING);
        productList.fetchProducts(++_pageNumber);
      }
    });

    _searchQuery.addListener(onSearchChange);
    super.initState();
  }

  onSearchChange() {
    var productList = Provider.of<ProductProvider>(context, listen: false);

    if (_debounce?.isActive ?? false) {
      _debounce.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      productList.resetStreams();
      productList.setLoadingState(LoadMoreStatus.INITIAL);
      productList.fetchProducts(_pageNumber, strSearch: _searchQuery.text);
    });
  }

  @override
  Widget pageUI() {
    return _productList();
  }

  Widget _productList() {
    return new Consumer<ProductProvider>(
      builder: (context, productModel, child) {
        if (productModel.allProducts != null &&
            productModel.allProducts.length > 0 &&
            productModel.getLoadMoreStatus() != LoadMoreStatus.INITIAL) {
          return _buildList(productModel.allProducts,
              productModel.getLoadMoreStatus() == LoadMoreStatus.LOADING);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildList(List<Product> items, bool isLoadMore) {
    return Column(
      children: [
        _productFilters(),
        Flexible(
          child: GridView.count(
            shrinkWrap: true,
            controller: _scrollController,
            crossAxisCount: 2,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: items.map((Product item) {
              return CategoriesCardBackend(
                data: item,
              );
            }).toList(),
          ),
        ),
        Visibility(
          child: Container(
            padding: EdgeInsets.all(5.0),
            height: getProportionateScreenHeight(35.0),
            width: getProportionateScreenWidth(35.0),
            child: CircularProgressIndicator(),
          ),
          visible: isLoadMore,
        ),
      ],
    );
  }

  Widget _productFilters() {
    return Container(
      height: getProportionateScreenHeight(51.0),
      margin: EdgeInsets.fromLTRB(10, 70, 10, 5),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _searchQuery,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search for an item",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xFFE6E6EC),
                filled: true,
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(15.0),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE6E6EC),
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: PopupMenuButton(
              onSelected: (sortBy) {
                var productList =
                    Provider.of<ProductProvider>(context, listen: false);
                productList.resetStreams();
                productList.setSortOrder(sortBy);
                productList.fetchProducts(_pageNumber);
              },
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map((item) {
                  return PopupMenuItem(
                    value: item,
                    child: Container(
                      child: Text(item.text),
                    ),
                  );
                }).toList();
              },
              icon: Icon(Icons.tune),
            ),
          ),
        ],
      ),
    );
  }
}
