import 'package:flutter/material.dart';

import '../../common/food_card.dart';
import '../../common/placeholder.dart';
import '../../core/data/mock_data.dart';
import '../../core/model/product.dart';
import '../dashboard/basket.dart';
import '../../theme/food_theme.dart';

class HomeScreen extends StatefulWidget {
  final String name;

  const HomeScreen({super.key, required this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<String> favoriteIds = {};
  final Map<String, int> cart = {};
  int selectedCategory = 0;

  static const categories = ['Hottest', 'Popular', 'New combo', 'Top'];

  void toggleFavorite(String id) {
    setState(() {
      if (!favoriteIds.add(id)) favoriteIds.remove(id);
    });
  }

  void addToCart(String id) {
    setState(() => cart[id] = (cart[id] ?? 0) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 28, 30, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/more_icon.png',
                    width: 28,
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              BasketScreen(cart: cart, name: widget.name),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/basket.png',
                            width: 24,
                            height: 24,
                          ),
                          const Text(
                            'My basket',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Brandon Grotesque',
                              color: Color(0xFF27214D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Hello ${widget.name}, What fruit salad\ncombo do you want today?',
                style: const TextStyle(
                  fontSize: 20,
                  height: 1.45,
                  fontFamily: 'Brandon Grotesque',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF27214D),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                    child: CustomTextField(
                      hintText: 'Search for fruit salad combos',
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Image.asset(
                    'assets/images/icon_loc.png',
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
              const SizedBox(height: 36),
              const Text(
                'Recommended Combo',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Brandon Grotesque',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF27214D),
                ),
              ),
              SizedBox(
                height: 270,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: products.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return FoodCard(
                      product: product,
                      onTap: () => openFoodDetail(product),
                      isFavorite: favoriteIds.contains(product.id),
                      onFavorite: () => toggleFavorite(product.id),
                      onAdd: () => addToCart(product.id),
                    );
                  },
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 45,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 34),
                  itemBuilder: (context, index) {
                    final isSelected = selectedCategory == index;
                    return GestureDetector(
                      onTap: () => setState(() => selectedCategory = index),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categories[index],
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xFF27214D)
                                  : const Color(0xFF9691BE),
                              fontSize: 20,
                              fontFamily: 'Brandon Grotesque',
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            height: 3,
                            width: isSelected ? 38 : 0,
                            color: const Color(0xFFFFA451),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 262,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: 24),
                  itemCount: saladProducts.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 26),
                  itemBuilder: (context, index) {
                    final product = saladProducts[index];
                    return FoodCard(
                      product: product,
                      onTap: () => openFoodDetail(product),
                      width: 245,
                      imageWidth: 142,
                      backgroundColor: index.isEven
                          ? const Color(0xFFFFF9E9)
                          : const Color(0xFFFFF0F1),
                      isFavorite: favoriteIds.contains(product.id),
                      onFavorite: () => toggleFavorite(product.id),
                      onAdd: () => addToCart(product.id),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openFoodDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FoodDetailScreen(product: product, cart: cart),
      ),
    );
  }
}
