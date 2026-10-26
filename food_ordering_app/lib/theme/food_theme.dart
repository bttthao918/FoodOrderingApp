import 'package:flutter/material.dart';

import '../core/model/product.dart';
import 'app_theme.dart';

abstract final class FoodTheme {
  static const heroColor = AppColors.primary;
  static const detailSurface = Colors.white;
  static const accent = Color(0xFFFF8B3D);
  static const price = AppTextStyles.price;
  static const ingredients =
      'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.';
}

class FoodDetailScreen extends StatefulWidget {
  final Product product;
  final Map<String, int> cart;

  const FoodDetailScreen({
    super.key,
    required this.product,
    required this.cart,
  });

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.cart[widget.product.id] ?? 1;
  }

  void addToBasket() {
    widget.cart[widget.product.id] = quantity;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodTheme.detailSurface,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 298,
              color: FoodTheme.heroColor,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
                      child: TextButton.icon(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.text,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        icon: const Icon(Icons.chevron_left, size: 26),
                        label: const Text('Go back'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(45, 0, 45, 22),
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(24, 34, 24, 24),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(18),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: const TextStyle(
                              color: AppColors.text,
                              fontFamily: 'Brandon Grotesque',
                              fontSize: 27,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              _RoundButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  if (quantity > 1) setState(() => quantity--);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 22,
                                ),
                                child: Text(
                                  '$quantity',
                                  style: AppTextStyles.body,
                                ),
                              ),
                              _RoundButton(
                                icon: Icons.add,
                                onPressed: () => setState(() => quantity++),
                              ),
                              const Spacer(),
                              Text(
                                '₦ ${widget.product.price * quantity}',
                                style: FoodTheme.price,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'One Pack Contains:',
                            style: TextStyle(
                              color: AppColors.text,
                              fontFamily: 'Brandon Grotesque',
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationColor: FoodTheme.accent,
                              decorationThickness: 2,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            FoodTheme.ingredients,
                            style: AppTextStyles.body,
                          ),
                          const SizedBox(height: 24),
                          const Divider(height: 1),
                          const SizedBox(height: 24),
                          const Text(
                            'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 14,
                              height: 1.45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 18),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFF5E8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: FoodTheme.accent,
                    ),
                  ),
                  const SizedBox(width: 28),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: addToBasket,
                        child: const Text('Add to basket'),
                      ),
                    ),
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

class _RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _RoundButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.text),
        ),
        child: Icon(icon, size: 18, color: AppColors.text),
      ),
    );
  }
}
