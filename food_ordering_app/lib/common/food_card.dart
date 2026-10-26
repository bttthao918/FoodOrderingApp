import 'package:flutter/material.dart';

import '../core/model/product.dart';

class FoodCard extends StatelessWidget {
  final Product product;
  final Color backgroundColor;
  final double width;
  final double imageWidth;
  final VoidCallback? onTap;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onAdd;

  const FoodCard({
    super.key,
    required this.product,
    this.backgroundColor = Colors.white,
    this.width = 180,
    this.imageWidth = 120,
    this.onTap,
    required this.isFavorite,
    required this.onFavorite,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: onFavorite,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: const Color(0xFFFF8B3D),
                  size: 29,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  product.image,
                  width: imageWidth,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF27214D),
                fontSize: 20,
                fontFamily: 'Brandon Grotesque',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₦ ${product.price}',
                  style: const TextStyle(
                    color: Color(0xFFFF8B3D),
                    fontSize: 22,
                    fontFamily: 'Brandon Grotesque',
                  ),
                ),
                InkWell(
                  onTap: onAdd,
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: 43,
                    height: 43,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFE3C7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFFFF8B3D),
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
