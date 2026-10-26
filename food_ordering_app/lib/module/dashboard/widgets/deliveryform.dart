
import 'package:flutter/material.dart';

import '../../../common/button.dart';
import '../../../theme/app_theme.dart';
import 'checkout_field.dart';

class DeliveryForm extends StatefulWidget {
  final VoidCallback onPayWithCard;
  final VoidCallback onComplete;

  const DeliveryForm({
    super.key,
    required this.onPayWithCard,
    required this.onComplete,
  });

  @override
  State<DeliveryForm> createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {
  final address = TextEditingController();
  final phone = TextEditingController();

  String? addressError;
  String? phoneError;

  @override
  void dispose() {
    address.dispose();
    phone.dispose();
    super.dispose();
  }

  bool validate() {
    setState(() {
      addressError = address.text.trim().isEmpty
          ? 'Please enter your address'
          : null;

      phoneError = RegExp(r'^\d{10,11}$')
              .hasMatch(phone.text.trim())
          ? null
          : 'Enter a valid phone number';
    });

    return addressError == null && phoneError == null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(27, 44, 27, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckoutField(
            label: 'Delivery address',
            hint: '10th avenue, Lekki, Lagos State',
            controller: address,
            error: addressError,
          ),

          const SizedBox(height: 28),

          CheckoutField(
            label: 'Number we can call',
            hint: '09090605708',
            controller: phone,
            error: phoneError,
            keyboardType: TextInputType.phone,
          ),

          const SizedBox(height: 42),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: 'Pay on delivery',
                width: 145,
                height: 60,
                backgroundColor: Colors.white,
                textColor: AppColors.primary,
                onPressed: () {
                  if (validate()) {
                    widget.onComplete();
                  }
                },
              ),

              CustomButton(
                text: 'Pay with card',
                width: 125,
                height: 60,
                backgroundColor: Colors.white,
                textColor: AppColors.primary,
                onPressed: () {
                  if (validate()) {
                    widget.onPayWithCard();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
