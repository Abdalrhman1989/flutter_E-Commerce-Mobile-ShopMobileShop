import 'package:flutter/material.dart';

class IPhoneItem {
  final String iphoneName;
  final String iphoneImage;
  final int price;
  final String availability;
  final Color textColor;
  final int id;

  IPhoneItem({
    @required this.iphoneImage,
    @required this.iphoneName,
    this.price,
    this.availability,
    this.textColor,
    this.id,
  });
}

List<IPhoneItem> iphoneBatteries = [
  IPhoneItem(
    id: 1,
    iphoneName: 'iPhone 5 ',
    iphoneImage:
        'assets/images/iphone_batteries/iphone-5-batteri-oem-original-kapacitet-e3f.jpg',
    price: 52,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 2,
    iphoneName: 'iPhone 5c ',
    iphoneImage:
        'assets/images/iphone_batteries/iphone-5c-batteri-oem-original-kapacitet-b70.jpg',
    price: 63,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 3,
    iphoneName: 'iPhone 5s ',
    iphoneImage:
        'assets/images/iphone_batteries/iphone-5s-batteri-oem-original-kapacitet-15c.jpg',
    price: 59,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 4,
    iphoneName: 'iPhone 6',
    iphoneImage:
        'assets/images/iphone_batteries/iphone-6-batteri-oem-original-kapacitet-781.jpg',
    price: 44,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 5,
    iphoneName: 'iPhone 6 plus',
    iphoneImage:
        'assets/images/iphone_batteries/iphone-6-plus-batteri-oem-original-kapacitet-0d2.jpg',
    price: 76,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
];

List<IPhoneItem> iphoneCovers = [
  IPhoneItem(
    id: 1,
    iphoneImage:
        'assets/images/iphone_covers/iphone-5-5s-se-cover-anti-shock-1f1.jpg',
    iphoneName: 'iPhone 5-5s-se',
    price: 21,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 2,
    iphoneImage:
        'assets/images/iphone_covers/iphone-6-6s-cover-anti-shock-fc5.jpg',
    iphoneName: 'iPhone 6-6s',
    price: 25,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 3,
    iphoneImage:
        'assets/images/iphone_covers/iphone-6-plus-6s-plus-cover-anti-shock-0ad.jpg',
    iphoneName: 'iPhone 6-6plus',
    price: 27,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 4,
    iphoneImage:
        'assets/images/iphone_covers/iphone-7-8-se2-2020-cover-anti-shock-ff0.jpg',
    iphoneName: 'iPhone 7-8-se2',
    price: 35,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
];

List<IPhoneItem> iphoneScreens = [
  IPhoneItem(
    id: 1,
    iphoneImage:
        'assets/images/iphone_screens/iphone-6-plus-skaerm-komplet-glas-lcd-ncc-pro-fit-colorx-441.png',
    iphoneName: 'iPhone 6',
    price: 10,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 2,
    iphoneImage:
        'assets/images/iphone_screens/iphone-6s-skaerm-advanced-in-cell-komplet-glas-lcd-in-cell-tech-5ab.jpg',
    iphoneName: 'iPhone 6s',
    price: 10,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 3,
    iphoneImage:
        'assets/images/iphone_screens/iphone-7-skaerm-advanced-in-cell-komplet-glas-lcd-in-cell-tech-178.jpg',
    iphoneName: 'iPhone 7',
    price: 10,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 4,
    iphoneImage:
        'assets/images/iphone_screens/iphone-7-plus-skaerm-advanced-in-cell-komplet-glas-lcd-in-cell-tech-4f2.jpg',
    iphoneName: 'iPhone 7 plus',
    price: 10,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
];
List<IPhoneItem> macBookCharger = [
  IPhoneItem(
    id: 1,
    iphoneImage:
        'assets/images/macbook_charger/apple-magsafe-61w-usb-c-oplader-macbook-pro-13-oem-d8c.jpg',
    iphoneName: 'Macbook Pro',
    price: 10,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 2,
    iphoneImage: 'assets/images/macbook_charger/macbook_oplader_USB-C_1.jpg',
    iphoneName: 'Macbook Pro',
    price: 10,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 3,
    iphoneImage:
        'assets/images/macbook_charger/Magsaafe_85W_oplader_og_kabel_1.jpg',
    iphoneName: 'Macbook Pro',
    price: 10,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 4,
    iphoneImage: 'assets/images/macbook_charger/magsafe_2_oplader_1.jpg',
    iphoneName: 'Macbook Pro',
    price: 10,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
];
List<IPhoneItem> screenProtection = [
  IPhoneItem(
    id: 1,
    iphoneImage:
        'assets/images/screen_protection/10-stk-iphone-x-xs-11-pro-glass-pro-haerdet-beskyttelsesglas-bulk-143.jpg',
    iphoneName: 'iPhone X',
    price: 10,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 2,
    iphoneImage:
        'assets/images/screen_protection/10-stk-iphone-xr-11-glass-pro-haerdet-beskyttelsesglas-bulk-69f.jpg',
    iphoneName: 'iPhone XR',
    price: 10,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 3,
    iphoneImage:
        'assets/images/screen_protection/10-stk-iphone-xs-max-11-pro-max-glass-pro-haerdet-beskyttelsesglas-bulk-654.jpg',
    iphoneName: 'iPhone XS',
    price: 10,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 4,
    iphoneImage:
        'assets/images/screen_protection/ipad-air-3-ipad-pro-10-5-glass-pro-haerdet-beskyttelsesglas-258.jpg',
    iphoneName: 'iPad Air 3',
    price: 10,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
];
List<IPhoneItem> toolsAndEquipment = [
  IPhoneItem(
    id: 1,
    iphoneImage: 'assets/images/tools_and_equipment/3m-tape-1m-01b.jpg',
    iphoneName: '3M Tape',
    price: 10,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 2,
    iphoneImage: 'assets/images/tools_and_equipment/batteri-lirker-b77.jpg',
    iphoneName: 'Battery Remover',
    price: 10,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 3,
    iphoneImage:
        'assets/images/tools_and_equipment/fillis-pry-tool-pro-b0e.jpg',
    iphoneName: 'Screen Cleaner',
    price: 10,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
];
List<IPhoneItem> macbook_accessories = [
  IPhoneItem(
    id: 1,
    iphoneImage:
        'assets/images/macbook/MAcBook_Air_Batteri_-_Phone-Parts-dk_1.jpg',
    iphoneName: 'Macbook Accessory',
    price: 10,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 2,
    iphoneImage: 'assets/images/macbook/MacBook_batteri.png',
    iphoneName: 'Macbook Accessory',
    price: 10,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 3,
    iphoneImage: 'assets/images/macbook/macbook_batteri_oversigt_1.png',
    iphoneName: 'Macbook Accessory',
    price: 10,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 4,
    iphoneImage: 'assets/images/macbook/MacBook_oplader_-_phone-parts-dk_1.jpg',
    iphoneName: 'Macbook Accessory',
    price: 10,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 5,
    iphoneImage: 'assets/images/macbook/macbook_pro_battteri_1.jpg',
    iphoneName: 'Macbook Accessory',
    price: 10,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
];
List<IPhoneItem> ipads = [
  IPhoneItem(
    id: 5,
    iphoneImage: 'assets/images/ipads/ipad2-reservedele_phone-parts_1.jpg',
    iphoneName: 'iPad 2',
    price: 200,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
  IPhoneItem(
    id: 5,
    iphoneImage: 'assets/images/ipads/ipad3-4-reservedele_phone-parts_1.jpg',
    iphoneName: 'iPad 3',
    price: 150,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
];

List<IPhoneItem> iphones = [
  IPhoneItem(
    id: 5,
    iphoneImage:
        'assets/images/iphones/iPhone_5C_Reservedele_-_Phone-Parts.dk_1.png',
    iphoneName: 'iPhone 5c',
    price: 900,
    availability: 'in Stock',
    textColor: Colors.green,
  ),
  IPhoneItem(
    id: 5,
    iphoneImage:
        'assets/images/iphones/iPhone_5_Reservedele_-_Phone-Parts.dk_1.png',
    iphoneName: 'iPhone 5',
    price: 700,
    availability: 'Unavailable!',
    textColor: Colors.red,
  ),
];
