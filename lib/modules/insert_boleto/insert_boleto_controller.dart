import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "A identificação é obrigatória" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data limite é obrigatória" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior do que €0,00" : null;
  String? validateCodigo(String? value) => value?.isEmpty ?? true
      ? "O codigo deve ser informado obrigatóriamente"
      : null;

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  Future<void> saveBoleto() async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList("boletos") ?? <String>[];
    boletos.add(model.toJson());
    await instance.setStringList("boletos", boletos);
    return;
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return saveBoleto();
    }
  }
}
