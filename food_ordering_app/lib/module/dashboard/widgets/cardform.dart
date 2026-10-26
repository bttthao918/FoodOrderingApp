
import 'package:flutter/material.dart';

import '../../../common/button.dart';
import '../../../theme/app_theme.dart';
import 'checkout_field.dart';

class CardForm extends StatefulWidget {
  final VoidCallback onComplete;

  const CardForm({
    super.key,
    required this.onComplete,
  });

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final holder = TextEditingController();
  final number = TextEditingController();
  final date = TextEditingController();
  final ccv = TextEditingController();

  String? holderError;
  String? numberError;
  String? dateError;
  String? ccvError;

  @override
  void dispose() {
    holder.dispose();
    number.dispose();
    date.dispose();
    ccv.dispose();
    super.dispose();
  }

  bool validate() {
    final cardNumber =
        number.text.replaceAll(RegExp(r'\s+'), '');

    setState(() {
      holderError = holder.text.trim().isEmpty
          ? 'Enter card holder name'
          : null;

      numberError = RegExp(r'^\d{12,19}$')
              .hasMatch(cardNumber)
          ? null
          : 'Enter a valid card number';

      dateError = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$')
              .hasMatch(date.text.trim())
          ? null
          : 'Use MM/YY';

      ccvError = RegExp(r'^\d{3,4}$')
              .hasMatch(ccv.text.trim())
          ? null
          : 'Invalid CCV';
    });

    return holderError == null &&
        numberError == null &&
        dateError == null &&
        ccvError == null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(27, 44, 27, 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckoutField(
                label: 'Card Holders Name',
                hint: 'Adolphus Chris',
                controller: holder,
                error: holderError,
              ),

              const SizedBox(height: 28),

              CheckoutField(
                label: 'Card Number',
                hint: '1234 5678 9012 1314',
                controller: number,
                error: numberError,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 28),

              Row(
                children: [
                  Expanded(
                    child: CheckoutField(
                      label: 'Date',
                      hint: '10/30',
                      controller: date,
                      error: dateError,
                    ),
                  ),

                  const SizedBox(width: 40),

                  Expanded(
                    child: CheckoutField(
                      label: 'CCV',
                      hint: '123',
                      controller: ccv,
                      error: ccvError,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: CustomButton(
              text: 'Complete Order',
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
          ),
        ),
      ],
    );
  }
}
