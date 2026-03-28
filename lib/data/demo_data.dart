import 'package:apple/models/category_model.dart';
import 'package:apple/models/product_model.dart';

class DemoData {
  static List<String> sliderImages = [
    "https://media.licdn.com/dms/image/v2/D5612AQHQ9OUVQn8UGQ/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1684773805107?e=2147483647&v=beta&t=NCXcBfXsZ-L8Bu7_6vd_XNxN96kPBu90kqk8aB2nbic",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhgQB_vKKc5R1-3F2aiJEiB25gucSpj7EANQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsDYhlxIk-v3l7ZBhmj_lSvWkrJGZIvHmwow&s",
    "https://i.ytimg.com/vi/jc-eBnpQI_Q/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDBbpUSCSeV9tRCnCmtiMApkzfDuw",
    "https://cdn.mos.cms.futurecdn.net/n633c6eZCGW2xjbrZPFuAX-1960-80.jpg",
  ];

  static List<CategoryModel> categories = [
    CategoryModel(name: "iPhone", image: 'assets/images/iphone.png'),
    CategoryModel(name: "iPad", image: 'assets/images/ipad.png'),
    CategoryModel(name: "MacBook", image: 'assets/images/mac.png'),
    CategoryModel(name: "Apple Watch", image: 'assets/images/iwatch.png'),
    CategoryModel(name: "AirPods", image: 'assets/images/airpods.png'),
  ];

  static List<Product> products = [
    Product(
      image: 'assets/images/iphone.png',
      title: 'iPhone 14 Pro Max',
      price: 1099.99,
    ),
    Product(image: 'assets/images/ipad.png', title: 'iPad Pro ', price: 999.99),
    Product(
      image: 'assets/images/mac.png',
      title: 'MacBook Pro',
      price: 2399.99,
    ),
    Product(
      image: 'assets/images/iwatch.png',
      title: 'Apple Watch Series 7',
      price: 399.99,
    ),
    Product(
      image: 'assets/images/airpods.png',
      title: 'AirPods Pro',
      price: 249.99,
    ),
  ];
}
