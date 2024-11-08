import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery/screens/delivery_process_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() {
    return _PaymentScreenState();
  }
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  void userTappedPay() {
    if (formKey.currentState?.validate() ?? false) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Confirm payment'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text("Card Number: " + cardNumber),
                      Text("Expiry Date: " + expiryDate),
                      Text("Card Holder Name: " + cardHolderName),
                      Text("CVV: " + cvvCode),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const DeliveryProcessScreen()));
                      },
                      child: const Text('Yes')),
                ],
              ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Card Details')),
      );
    }
  }

  void onCreditCardModelChange(CreditCardModel cardModel) {
    setState(() {
      cardNumber = cardModel.cardNumber;
      expiryDate = cardModel.expiryDate;
      cardHolderName = cardModel.cardHolderName;
      cvvCode = cardModel.cvvCode;
      showBackView = cardModel.isCvvFocused;
    });
  }

  void onCreditCardWidgetChange(CreditCardBrand brand) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Checkout"),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: showBackView,
                    onCreditCardWidgetChange: onCreditCardWidgetChange,
                    isHolderNameVisible: true,
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  CreditCardForm(
                    formKey: formKey,
                    onCreditCardModelChange: onCreditCardModelChange,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: userTappedPay,
              child: const Text("Pay Now"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
