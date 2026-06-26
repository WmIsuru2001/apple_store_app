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
      id: '1',
      image: 'assets/images/iphone.png',
      title: 'iPhone 14 Pro Max',
      price: 599.99,
      rating: 4.8,
      reviewCount: 2341,
      category: 'iPhone',
      description:
          'The iPhone 14 Pro Max features a stunning 6.7-inch Super Retina XDR display with ProMotion technology. Powered by the A16 Bionic chip, it delivers exceptional performance and efficiency. The 48MP main camera with second-generation sensor-shift optical image stabilization captures incredible detail in any light.',
    ),
    Product(
      id: '2',
      image: 'assets/images/ipad.png',
      title: 'iPad Pro 12.9"',
      price: 999.99,
      rating: 4.7,
      reviewCount: 1523,
      category: 'iPad',
      description:
          'The iPad Pro 12.9" features the world-class Apple M2 chip and a Liquid Retina XDR display. With Thunderbolt connectivity and Wi-Fi 6E, it\'s a powerhouse for creative professionals. Supports Apple Pencil (2nd generation) and Magic Keyboard.',
    ),
    Product(
      id: '3',
      image: 'assets/images/mac.png',
      title: 'MacBook Pro 16"',
      price: 2399.99,
      rating: 4.9,
      reviewCount: 987,
      category: 'MacBook',
      description:
          'MacBook Pro 16" with M3 Pro chip takes the notebook to a new level of performance and battery life. With a stunning Liquid Retina XDR display, up to 22 hours of battery life, and advanced connectivity, it\'s the ultimate pro laptop.',
    ),
    Product(
      id: '4',
      image: 'assets/images/iwatch.png',
      title: 'Apple Watch Series 9',
      price: 399.99,
      rating: 4.6,
      reviewCount: 3102,
      category: 'Apple Watch',
      description:
          'Apple Watch Series 9 features the powerful S9 chip for a magical double-tap gesture. With advanced health sensors for ECG, blood oxygen, and temperature, plus a bright Always-On Retina display, it\'s the most capable Apple Watch ever.',
    ),
    Product(
      id: '5',
      image: 'assets/images/airpods.png',
      title: 'AirPods Pro (2nd Gen)',
      price: 249.99,
      rating: 4.7,
      reviewCount: 5241,
      category: 'AirPods',
      description:
          'AirPods Pro (2nd generation) deliver up to 2x more Active Noise Cancellation than the previous generation. Adaptive Audio dynamically blends ANC and Transparency mode. With personalized Spatial Audio and up to 30 hours of battery life with the case.',
    ),
    Product(
      id: '6',
      image: 'assets/images/iphone.png',
      title: 'iPhone 15',
      price: 799.99,
      rating: 4.7,
      reviewCount: 1876,
      category: 'iPhone',
      description:
          'iPhone 15 features a durable color-infused back glass and a new contoured edge design. The Dynamic Island delivers alerts and Live Activities. The 48MP main camera captures stunning detail with 2x Telephoto.',
    ),
    Product(
      id: '7',
      image: 'assets/images/ipad.png',
      title: 'iPad Air 5th Gen',
      price: 599.99,
      rating: 4.6,
      reviewCount: 1102,
      category: 'iPad',
      description:
          'iPad Air features the blazing-fast M1 chip, a stunning 10.9-inch Liquid Retina display, and 5G capability. Compatible with Apple Pencil (2nd generation) and Magic Keyboard, it\'s versatile and powerful.',
    ),
    Product(
      id: '8',
      image: 'assets/images/mac.png',
      title: 'MacBook Air 15"',
      price: 1299.99,
      rating: 4.8,
      reviewCount: 743,
      category: 'MacBook',
      description:
          'MacBook Air 15" with M2 chip is the world\'s best consumer laptop. With a 15.3-inch Liquid Retina display, up to 18 hours of battery life, and fanless design, it\'s incredibly capable and silent.',
    ),
    Product(
      id: '9',
      image: 'assets/images/iphone.png',
      title: 'iPhone 16 Pro Max',
      price: 1099.99,
      rating: 4.8,
      reviewCount: 2341,
      category: 'iPhone',
      description:
          'The iPhone 16 Pro Max features a stunning 6.7-inch Super Retina XDR display with ProMotion technology. Powered by the A16 Bionic chip, it delivers exceptional performance and efficiency. The 48MP main camera with second-generation sensor-shift optical image stabilization captures incredible detail in any light.',
    ),
    Product(
      id: '10',
      image: 'assets/images/iphone.png',
      title: 'iPhone 17 Pro Max',
      price: 1299.99,
      rating: 4.8,
      reviewCount: 2341,
      category: 'iPhone',
      description:
          'The iPhone 17 Pro Max features a stunning 6.7-inch Super Retina XDR display with ProMotion technology. Powered by the A16 Bionic chip, it delivers exceptional performance and efficiency. The 48MP main camera with second-generation sensor-shift optical image stabilization captures incredible detail in any light.',
    ),
    Product(
      id: '11',
      image: 'assets/images/iwatch.png',
      title: 'Apple Watch Series 8',
      price: 299.99,
      rating: 4.6,
      reviewCount: 3102,
      category: 'Apple Watch',
      description:
          'Apple Watch Series 8 features the powerful S8 chip for a magical double-tap gesture. With advanced health sensors for ECG, blood oxygen, and temperature, plus a bright Always-On Retina display, it\'s the most capable Apple Watch ever.',
    ),
    Product(
      id: '12',
      image: 'assets/images/airpods.png',
      title: 'AirPods Pro (3th Gen)',
      price: 349.99,
      rating: 4.7,
      reviewCount: 5241,
      category: 'AirPods',
      description:
          'AirPods Pro (3th generation) deliver up to 3x more Active Noise Cancellation than the previous generation. Adaptive Audio dynamically blends ANC and Transparency mode. With personalized Spatial Audio and up to 30 hours of battery life with the case.',
    ),
    Product(
      id: '13',
      image: 'assets/images/airpods.png',
      title: 'AirPods Pro (4nd Gen)',
      price: 449.99,
      rating: 4.7,
      reviewCount: 5241,
      category: 'AirPods',
      description:
          'AirPods Pro (4th generation) deliver up to 4x more Active Noise Cancellation than the previous generation. Adaptive Audio dynamically blends ANC and Transparency mode. With personalized Spatial Audio and up to 30 hours of battery life with the case.',
    ),
  ];
}
