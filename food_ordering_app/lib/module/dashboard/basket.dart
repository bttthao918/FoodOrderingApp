import 'package:flutter/material.dart';

import '../../common/mini_card.dart';
import '../../common/quantity_button.dart';
import '../../core/data/mock_data.dart';
import '../../core/model/product.dart';
import '../../theme/app_theme.dart';
import 'checkout.dart';
import 'oder_complete.dart';

class BasketScreen extends StatefulWidget {
  final Map<String, int> cart;
  final String name;

  const BasketScreen({super.key, required this.cart, required this.name});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  List<Product> get cartProducts => [
    ...products,
    ...saladProducts,
  ].where((product) => (widget.cart[product.id] ?? 0) > 0).toList();

  int get total => cartProducts.fold(
    0,
    (sum, product) => sum + product.price * widget.cart[product.id]!,
  );

  void updateQuantity(Product product, int change) {
    final quantity = (widget.cart[product.id] ?? 0) + change;

    setState(() {
      if (quantity <= 0) {
        widget.cart.remove(product.id);
      } else {
        widget.cart[product.id] = quantity;
      }
    });
  }

  Future<void> checkout() async {
    final completed = await showCheckoutFlow(context);

    if (!mounted || !completed) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => OderComplete(name: widget.name)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = cartProducts;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        toolbarHeight: 136,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.text,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              icon: const Icon(Icons.chevron_left, size: 24),
              label: const Text('Go back'),
            ),
            const Expanded(child: Center(child: Text('My Basket'))),
            const SizedBox(width: 76),
          ],
        ),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                'Your basket is empty',
                style: TextStyle(
                  color: AppColors.text,
                  fontFamily: 'Brandon Grotesque',
                  fontSize: 20,
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                    itemCount: items.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final product = items[index];
                      final quantity = widget.cart[product.id]!;

                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            MiniCard(
                              image: product.image,
                              backgroundColor: index.isEven
                                  ? AppColors.primaryLight
                                  : const Color(0xFFF2F0F8),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: AppColors.text,
                                      fontFamily: 'Brandon Grotesque',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '₦ ${product.price * quantity}',
                                    style: const TextStyle(
                                      color: AppColors.primary,
                                      fontFamily: 'Brandon Grotesque',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                QuantityButton(
                                  icon: Icons.remove,
                                  onPressed: () => updateQuantity(product, -1),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    '$quantity',
                                    style: const TextStyle(
                                      color: AppColors.text,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                QuantityButton(
                                  icon: Icons.add,
                                  onPressed: () => updateQuantity(product, 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
                  decoration: const BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(color: AppColors.mutedText),
                          ),
                          const SizedBox(height: 4),
                          Text('₦ $total', style: AppTextStyles.price),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: checkout,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
