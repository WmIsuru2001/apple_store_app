import 'package:apple/data/demo_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const Categories({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final allCategories = ['All', ...DemoData.categories.map((c) => c.name)];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Categories',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: allCategories.length,
              itemBuilder: (context, index) {
                final cat = allCategories[index];
                final isSelected = selectedCategory == cat;
                if (index == 0) {
                  return GestureDetector(
                    onTap: () => onCategorySelected('All'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.black : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: isSelected ? Colors.black : Colors.grey.shade200),
                      ),
                      child: Text(
                        'All',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }
                final catData = DemoData.categories[index - 1];
                return GestureDetector(
                  onTap: () => onCategorySelected(catData.name),
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: isSelected ? Colors.black : Colors.grey.shade200),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(catData.image, height: 48, fit: BoxFit.contain),
                        const SizedBox(height: 4),
                        Text(
                          catData.name,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
