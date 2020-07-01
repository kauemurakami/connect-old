import 'package:credit_card_detector/credit_card_detector.dart';
import 'package:flutter/material.dart';

class CustomCartaoWidget extends StatelessWidget {
  final numero;
  final validade;
  final nome;
  final codigo;
  final showBack;

  CustomCartaoWidget(
      {this.codigo = 'xxx', this.nome = 'MARIA JOSE DA SILVA', this.numero, this.showBack, this.validade = '12/20'});

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardBgColor: Colors.grey,
        cardNumber: this.numero,
        expiryDate: this.validade,
        cardHolderName: this.nome,
        cvvCode: this.codigo,
        showBackView: this.showBack);
  }
}
