// data returned from backend as Map or List
// create model for map
// parsing from list<map> to list<model>
// use model in UI

import 'package:flutter/cupertino.dart';

class ProductModel {
  String? id;
  String? categoryId;
  String? image;
  String? title;
  String? price;
  String? quantityPerPrice;
  String? description;
  String? tag;

  ProductModel({
    this.id,
    this.categoryId,
    this.image,
    this.title,
    this.price,
    this.quantityPerPrice,
    this.description,
    this.tag,
  });
}

List<ProductModel> offerProducts = [
  ProductModel(
    id: '1',
    image: 'https://5.imimg.com/data5/AK/RA/MY-68428614/apple.jpg',
    title: 'Apple',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '2',
    image:
        'https://m.media-amazon.com/images/I/21ox-V+BgLL._AC_UF1000,1000_QL80_.jpg',
    title: 'Banana',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '3',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO_SbJ68qK4PToBxjI44HU_XG_loCMakwLHw&s',
    title: 'Orange',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '4',
    image:
        'https://cdn.mafrservices.com/sys-master-root/hd7/h23/9342436540446/32603_main.jpg?im=Resize=376',
    title: 'Cabbage',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
];

List<ProductModel> bestSellingProducts = [
  ProductModel(
    id: '1',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO_SbJ68qK4PToBxjI44HU_XG_loCMakwLHw&s',
    title: 'Orange',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '2',
    image:
        'https://cdn.mafrservices.com/sys-master-root/hd7/h23/9342436540446/32603_main.jpg?im=Resize=376',
    title: 'Cabbage',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '3',
    image: 'https://5.imimg.com/data5/AK/RA/MY-68428614/apple.jpg',
    title: 'Apple',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '4',
    image:
        'https://m.media-amazon.com/images/I/21ox-V+BgLL._AC_UF1000,1000_QL80_.jpg',
    title: 'Banana',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
];

List<ProductModel> allProducts = [
  ProductModel(
    id: '1',
    categoryId: '1',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO_SbJ68qK4PToBxjI44HU_XG_loCMakwLHw&s',
    title: 'Orange',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '2',
    categoryId: '2',
    image:
        'https://cdn.mafrservices.com/sys-master-root/hd7/h23/9342436540446/32603_main.jpg?im=Resize=376',
    title: 'Cabbage',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '3',
    categoryId: '1',
    image: 'https://5.imimg.com/data5/AK/RA/MY-68428614/apple.jpg',
    title: 'Apple',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '4',
    categoryId: '1',
    image:
        'https://m.media-amazon.com/images/I/21ox-V+BgLL._AC_UF1000,1000_QL80_.jpg',
    title: 'Banana',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '1',
    categoryId: '3',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO_SbJ68qK4PToBxjI44HU_XG_loCMakwLHw&s',
    title: 'Orange',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '2',
    image:
        'https://cdn.mafrservices.com/sys-master-root/hd7/h23/9342436540446/32603_main.jpg?im=Resize=376',
    title: 'Cabbage',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '3',
    image: 'https://5.imimg.com/data5/AK/RA/MY-68428614/apple.jpg',
    title: 'Apple',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
  ProductModel(
    id: '4',
    image:
        'https://m.media-amazon.com/images/I/21ox-V+BgLL._AC_UF1000,1000_QL80_.jpg',
    title: 'Banana',
    price: '\$10.99',
    quantityPerPrice: '1kg',
    tag: UniqueKey().toString(),
    description:
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
  ),
];

List<ProductModel> getProductsByCategoryId(String categoryId) {
  return allProducts.where((item) => item.categoryId == categoryId).toList();

  // List<ProductModel> filteredProducts = [];
  // for (var item in allProducts) {
  //   if (item.categoryId == categoryId) {
  //     filteredProducts.add(item);
  //   }
  // }

  // return filteredProducts;
}

List<ProductModel> getProductsByName(String searchKey) {
  return allProducts
      .where((item) => item.title?.toLowerCase().contains(searchKey) == true)
      .toList();
}
