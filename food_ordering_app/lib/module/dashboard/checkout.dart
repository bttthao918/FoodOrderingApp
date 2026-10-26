
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import 'widgets/deliveryform.dart';
import 'widgets/cardform.dart';

Future<bool> showCheckoutFlow(BuildContext context) async {
  return await showModalBottomSheet<bool>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => const CheckoutSheet(),
      ) ??
      false;
}

class CheckoutSheet extends StatefulWidget {
  const CheckoutSheet({super.key});

  @override
  State<CheckoutSheet> createState() => _CheckoutSheetState();
}

class _CheckoutSheetState extends State<CheckoutSheet> {
  bool showCard = false;

  void goToCard() {
    FocusScope.of(context).unfocus();

    setState(() {
      showCard = true;
    });
  }

  void completeOrder() {
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Nút đóng Bottom Sheet
              Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.text,
                    size: 28,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 20),

              // Chuyển đổi giữa hai form
              AnimatedSize(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                    child: showCard
                        ? CardForm(onComplete: completeOrder)
                        : DeliveryForm(
                            onPayWithCard: goToCard,
                            onComplete: completeOrder,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
