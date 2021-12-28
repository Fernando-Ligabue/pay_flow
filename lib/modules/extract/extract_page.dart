import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:pay_flow/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
              child: Row(
                children: [
                  Text(
                    "Meus Extratos",
                    style: AppTextStyles.titleBoldHeading,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Divider(
                height: 1,
                thickness: 1,
                color: AppColors.stroke,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: BoletoListWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
