import 'package:apple/screens/home_page/widget/catogories.dart';
import 'package:apple/screens/home_page/widget/custom_app_bar.dart';
import 'package:apple/screens/home_page/widget/product_grid.dart';
import 'package:apple/screens/home_page/widget/slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(height: 8),
                NewSlider(size: size),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomIconButton(
                          text: 'My Profile',
                          icon: Icons.emoji_people,
                          bgColor: Colors.green.shade100,
                          color: Colors.green,
                        ),
                        CustomIconButton(
                          text: 'Favorites',
                          icon: Icons.favorite,
                          bgColor: Colors.red.shade100,
                          color: Colors.red,
                        ),
                        CustomIconButton(
                          text: 'My Orders',
                          icon: Icons.shopping_cart_rounded,
                          bgColor: Colors.blue.shade100,
                          color: Colors.blue,
                        ),
                        CustomIconButton(
                          text: 'Website',
                          icon: Icons.language,
                          bgColor: Colors.purple.shade100,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                ),
                Categories(),
                ProductGrid(size: size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color bgColor;
  final Color color;
  const CustomIconButton({
    super.key,
    required this.text,
    required this.icon,
    this.bgColor = Colors.blue,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: bgColor,
          child: Icon(icon, color: color),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
