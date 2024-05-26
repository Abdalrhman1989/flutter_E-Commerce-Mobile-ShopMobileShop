import 'package:flutter/cupertino.dart';
import 'package:flutter_online_shop/backend/api_service.dart';
import 'package:flutter_online_shop/models/product_model.dart';

class SortBy {
  final String value;
  final String text;
  final String sortOrder;

  SortBy({
    this.value,
    this.text,
    this.sortOrder,
  });
}

enum LoadMoreStatus {
  INITIAL,
  LOADING,
  STABLE,
}

class ProductProvider with ChangeNotifier {
  APIService apiService;
  List<Product> _productList;
  SortBy _sortBy;
  String tagName; //newly added
  int pageSize = 100;

  List<Product> get allProducts => _productList;

  double get totalRecords => _productList.length.toDouble();

  LoadMoreStatus _loadMoreStatus = LoadMoreStatus.STABLE;

  getLoadMoreStatus() => _loadMoreStatus;

  ProductProvider() {
    resetStreams();
    _sortBy = SortBy(value: "modified", text: "Latest", sortOrder: "asc");
  }

  void resetStreams() {
    apiService = APIService();
    _productList = List<Product>();
  }

  setLoadingState(LoadMoreStatus loadMoreStatus) {
    _loadMoreStatus = loadMoreStatus;
    // notifyListeners(); //comment this to get rid of error
  }

  setSortOrder(SortBy sortBy) {
    _sortBy = sortBy;
    notifyListeners();
  }

  fetchProducts(
    pageNumber, {
    String strSearch,
    String tagName,
    String categoryId,
    String sortBy,
    String sortOrder = "asc",
  }) async {
    List<Product> itemModel = await apiService.getProducts(
      strSearch: strSearch,
      tagName: tagName,
      //tagName
      pageNumber: pageNumber,
      pageSize: this.pageSize,
      categoryId: categoryId,
      sortBy: this._sortBy.value,
      sortOrder: this._sortBy.sortOrder,
    );
    if (itemModel.length > 0) {
      _productList.addAll(itemModel);
    }
    setLoadingState(LoadMoreStatus.STABLE);
    notifyListeners();
  }

  fetchProductsByTag(
    pageNumber,
    String tagName, {
    String strSearch,
    //String tagName,
    String categoryId,
    String sortBy,
    String sortOrder = "asc",
  }) async {
    List<Product> itemModel = await apiService.getProducts(
      strSearch: strSearch,
      tagName: tagName,
      //tagName
      pageNumber: pageNumber,
      pageSize: this.pageSize,
      categoryId: categoryId,
      sortBy: this._sortBy.value,
      sortOrder: this._sortBy.sortOrder,
    );
    if (itemModel.length > 0) {
      _productList.addAll(itemModel);
    }
    setLoadingState(LoadMoreStatus.STABLE);
    notifyListeners();
  }
}
