import 'package:apple/controllers/cart_controller.dart';
import 'package:apple/data/demo_data.dart';
import 'package:apple/models/product_model.dart';
import 'package:apple/screens/cart/cart_screen.dart';
import 'package:apple/screens/home_page/widget/catogories.dart';
import 'package:apple/screens/home_page/widget/slider.dart';
import 'package:apple/screens/product_detail/product_detail_screen.dart';
import 'package:apple/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();

  List<Product> get _filteredProducts {
    return DemoData.products.where((p) {
      final matchSearch =
          p.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.category.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchCategory =
          _selectedCategory == 'All' || p.category == _selectedCategory;
      return matchSearch && matchCategory;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartController>();
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, Isuru 👋',
                          style: GoogleFonts.poppins(
                              fontSize: 13, color: Colors.grey.shade500)),
                      Text('Apple Store',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const ProfileScreen())),
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.black,
                          child: Text('IS',
                              style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.shopping_bag_outlined),
                            onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const CartScreen())),
                          ),
                          if (cart.itemCount > 0)
                            Positioned(
                              right: 6,
                              top: 6,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle),
                                child: Center(
                                  child: Text('${cart.itemCount}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 10)),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (v) => setState(() => _searchQuery = v),
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.grey.shade400),
                    prefixIcon:
                        const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.close, size: 18),
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _searchQuery = '');
                            },
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_searchQuery.isEmpty) ...[
                      const SizedBox(height: 8),
                      NewSlider(size: size),
                      const SizedBox(height: 12),
                      // Quick actions row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _QuickAction(
                                  text: 'My Profile',
                                  icon: Icons.emoji_people,
                                  bgColor: Colors.green.shade100,
                                  color: Colors.green,
                                  onTap: () => Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (_) => const ProfileScreen())),
                                ),
                                _QuickAction(
                                  text: 'Favorites',
                                  icon: Icons.favorite,
                                  bgColor: Colors.red.shade100,
                                  color: Colors.red,
                                  onTap: () {},
                                ),
                                _QuickAction(
                                  text: 'My Cart',
                                  icon: Icons.shopping_cart_rounded,
                                  bgColor: Colors.blue.shade100,
                                  color: Colors.blue,
                                  onTap: () => Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (_) => const CartScreen())),
                                ),
                                _QuickAction(
                                  text: 'Orders',
                                  icon: Icons.receipt_long_outlined,
                                  bgColor: Colors.purple.shade100,
                                  color: Colors.purple,
                                  onTap: () => Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (_) => const ProfileScreen())),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Categories(
                        selectedCategory: _selectedCategory,
                        onCategorySelected: (cat) =>
                            setState(() => _selectedCategory = cat),
                      ),
                    ],
                    // Products Grid
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            _searchQuery.isNotEmpty
                                ? 'Results for "$_searchQuery"'
                                : _selectedCategory == 'All'
                                    ? 'The latest.'
                                    : _selectedCategory,
                            style: GoogleFonts.poppins(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          if (_searchQuery.isEmpty && _selectedCategory == 'All')
                            Text('Take a look at what\'s new, right now.',
                                style: GoogleFonts.poppins(
                                    fontSize: 13, color: Colors.grey.shade500)),
                          const SizedBox(height: 12),
                          _filteredProducts.isEmpty
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(32),
                                    child: Column(
                                      children: [
                                        Icon(Icons.search_off,
                                            size: 48,
                                            color: Colors.grey.shade300),
                                        const SizedBox(height: 8),
                                        Text('No products found',
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey.shade500)),
                                      ],
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _filteredProducts.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12,
                                    childAspectRatio: 0.78,
                                  ),
                                  itemBuilder: (context, index) {
                                    final product = _filteredProducts[index];
                                    return _ProductCard(
                                      product: product,
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ProductDetailScreen(
                                              product: product),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color bgColor;
  final Color color;
  final VoidCallback onTap;

  const _QuickAction({
    required this.text,
    required this.icon,
    required this.bgColor,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 4),
          Text(text,
              style: const TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white)),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const _ProductCard({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Hero(
                  tag: 'product_${product.id}',
                  child: Image.asset(product.image, fit: BoxFit.contain),
                ),
              ),
            ),
            // Info
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      const SizedBox(width: 2),
                      Text(
                        '${product.rating}',
                        style: GoogleFonts.poppins(
                            fontSize: 11, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
