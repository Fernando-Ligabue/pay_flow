// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:pay_flow/modules/extract/extract_page.dart';
import 'package:pay_flow/modules/home/home_controller.dart';
import 'package:pay_flow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    MeusBoletosPage(
      key: UniqueKey(),
    ),
    ExtractPage(
      key: UniqueKey(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: widget.user.name,
                          style: AppTextStyles.titleBoldBackground),
                    ])),
                subtitle: Text(
                  "Mantenha seus pagamentos em dia!",
                  style: AppTextStyles.captionShape,
                ),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(widget.user.photoURL!),
                    ),
                  ),
                ),
              ),
            )),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(
                Icons.home,
                color: controller.currentPage == 0
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, "/barcode_scanner");
                setState(() {});
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
              icon: Icon(
                Icons.description_outlined,
                color: controller.currentPage == 1
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
