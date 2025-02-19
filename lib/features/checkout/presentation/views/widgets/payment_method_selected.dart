import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentMethodSelected extends StatefulWidget {
  const PaymentMethodSelected({super.key});

  @override
  State<PaymentMethodSelected> createState() => _PaymentMethodSelectedState();
}
  String _selectedPayment = "paypal"; // Default selected option

class _PaymentMethodSelectedState extends State<PaymentMethodSelected> {
  @override
  Widget build(BuildContext context) {
   return  Column(
      children: [
        buildRadioButton("By Master Card", "mastercard"),
        const SizedBox(height: 10),
        buildRadioButton("By Credit Card", "creditcard"),
        const SizedBox(height: 10),
        buildRadioButton("By PayPal", "paypal"), // Default selected
      ],
    );
  }

  Widget buildRadioButton(String title, String value) {
    bool isSelected = _selectedPayment == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPayment = value;
        });
      },
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.red : Colors.white,
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
            child: isSelected
                ? Icon(Icons.check, color: Colors.white, size: 20) // White check for selected
                : null, // Empty for unselected
          ),
          const SizedBox(width: 10), // Space between radio button and text
          Text(
            title,
            style: TextStyles.regular14,
      
            ),
        
        ],
      ),
    );
  }
}