class Config {
  static String key = "ck_2c0bd46da44352525476ddaffdfa97e122efc36c";
  static String secretKey = "cs_c7dce015c03b26c06c666704f2e8bb1f81baf416";
  static String url = "https://ubreakwefix.dk/shop/wp-json/wc/v3/";
  static String customerUrl = "customers";
  static String tokenURL =
      "https://ubreakwefix.dk/shop/wp-json/jwt-auth/v1/token";
  static String categoriesURL = "products/categories";
  static String productsURL = "products";
  static String addToCartURL = "addtocart";
  static String cartURL = "cart";
  static String orderURL = "orders";
  static int userID = 8;
  static String currency = "Kr";

  //PAYPAL API
  static String paypalClientId = "";
  static String paypalSecretKey = "";
  static String paypalURL = "https://api.sandbox.paypal.com"; //for Sandbox mode
  //static String paypalURL = "https://api.paypal.com"; //for production mode

  //TAGS should go here
  //static String todayOffersTagId = "";
  //static String popularProductsTagId = "";
  static String iphoneBatteriesTagId = "428"; //posted
  static String iphoneCoversTagId = "433"; //posted
  static String iphoneScreensTagId = "454"; //range error
  static String toolsAndEquipmentsTagId = "431";
  static String cablesTagId = "442"; //posted
  static String microbCablesTagId = "444"; //posted
  static String typecCablesTagId = "443"; //posted
  static String mobileHolderTagId = "445"; //posted
  static String screenProtectionTagId = "447"; //posted
  static String macbookChargerTagId = "440"; //posted
  static String macbookProBatteriesTagId = "436"; //posted
  static String macbookAirBatteriesTagId = "437"; //posted
  static String ipadCoversTagId = "451"; //posted
}
