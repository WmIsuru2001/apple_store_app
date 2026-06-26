import 'package:apple/controllers/cart_controller.dart';
import 'package:apple/screens/auth_screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static final List<Map<String, dynamic>> _mockOrders = [
    {
      'id': '#ORD-001',
      'date': 'Jun 20, 2026',
      'items': 'iPhone 14 Pro Max',
      'total': 1099.99,
      'status': 'Delivered',
      'statusColor': Colors.green,
    },
    {
      'id': '#ORD-002',
      'date': 'Jun 15, 2026',
      'items': 'AirPods Pro (2nd Gen) × 2',
      'total': 499.98,
      'status': 'Shipped',
      'statusColor': Colors.blue,
    },
    {
      'id': '#ORD-003',
      'date': 'Jun 5, 2026',
      'items': 'MacBook Pro 16"',
      'total': 2399.99,
      'status': 'Processing',
      'statusColor': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Color(0xFF333333)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade700,
                    child: Text(
                      'IS',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Isuru Sandaruwan',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'isuru@example.com',
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.grey.shade400),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const _StatItem(label: 'Orders', value: '3'),
                      _StatItem(
                          label: 'Cart Items', value: '${cart.itemCount}'),
                      const _StatItem(label: 'Wishlist', value: '5'),
                    ],
                  ),
                ],
              ),
            ),
            // Order History
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Orders',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ..._mockOrders.map((order) => _OrderCard(order: order)),
                  const SizedBox(height: 20),
                  Text(
                    'Account Settings',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const _SettingsTile(
                      icon: Icons.person_outline, title: 'Edit Profile'),
                  const _SettingsTile(
                      icon: Icons.location_on_outlined,
                      title: 'Shipping Address'),
                  const _SettingsTile(
                      icon: Icons.credit_card_outlined,
                      title: 'Payment Methods'),
                  const _SettingsTile(
                      icon: Icons.notifications_outlined,
                      title: 'Notifications'),
                  const _SettingsTile(
                      icon: Icons.help_outline, title: 'Help & Support'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Sign Out',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(label,
            style:
                GoogleFonts.poppins(fontSize: 12, color: Colors.grey.shade400)),
      ],
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order['id'],
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: (order['statusColor'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  order['status'],
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: order['statusColor'] as Color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  order['items'],
                  style: GoogleFonts.poppins(
                      fontSize: 13, color: Colors.grey.shade600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '\$${(order['total'] as double).toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              order['date'],
              style: GoogleFonts.poppins(
                  fontSize: 12, color: Colors.grey.shade400),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const _SettingsTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: GoogleFonts.poppins(fontSize: 14)),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {},
    );
  }
}
