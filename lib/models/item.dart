import 'package:flutter/material.dart';

class Item {
  final String image, title;
  final int id;
  final Color color;

  Item({
    this.title,
    this.image,
    this.color,
    this.id,
  });
}

List<Item> items = [
  Item(
    id: 1,
    image: "assets/images/iphone_batteries/batteri-lirker-b77.jpg",
    title: 'iPhone Batteries',
    color: Color(0xFF4B4A4F),
  ),
  Item(
    id: 2,
    image: "assets/images/iphone_covers/cover-2-stk-skaermbeskyttelse-60b.jpg",
    title: 'iPhone Covers',
    color: Color(0xFF4B4A4F),
  ),
  Item(
    id: 3,
    image:
        "assets/images/iphone_screens/iphone-6-plus-skaerm-komplet-glas-lcd-ncc-pro-fit-colorx-441.png",
    title: 'iPhone Screens',
    color: Color(0xFF4B4A4F),
  ),
  Item(
    id: 4,
    image:
        "assets/images/screen_protection/10-stk-haerdet-9h-panserskaerm-beskyttelsesglas-iphone-6-6s-7-8-glass-pro-bulk-version-d5f.jpg",
    title: 'Screen Protection',
    color: Color(0xFF4B4A4F),
  ),
  Item(
    id: 5,
    image: "assets/images/tools_and_equipment/fillis-pry-tool-pro-b0e.jpg",
    title: 'Tools and Equipment',
    color: Color(0xFF4B4A4F),
  ),
  Item(
    id: 6,
    image: "assets/images/macbook_charger/macbook_oplader_USB-C_1.jpg",
    title: 'Macbook Charger',
    color: Color(0xFF4B4A4F),
  ),
  Item(
    id: 7,
    image: "assets/images/macbook/MAcBook_Air_Batteri_-_Phone-Parts-dk_1.jpg",
    title: 'Macbook Accessories',
    color: Color(0xFF4B4A4F),
  ),
  Item(
    id: 8,
    image: "assets/images/items/iphone.png",
    title: 'iPhones',
    color: Color(0xFF4B4A4F),
  ),
  Item(
    id: 9,
    image: "assets/images/items/ipad.jpg",
    title: 'iPads',
    color: Color(0xFF4B4A4F),
  ),
];
