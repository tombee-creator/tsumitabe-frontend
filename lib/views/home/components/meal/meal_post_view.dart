import 'dart:io';

import 'package:flutter/material.dart';
import 'package:emeal_app/helper/image_picker_provider.dart';
import 'package:emeal_app/views/home/components/meal/meal_field_form.dart';
import 'package:emeal_app/views/home/components/meal/meal_post_button.dart';

class MealPostView extends StatefulWidget {
  const MealPostView({super.key});

  @override
  State<StatefulWidget> createState() => _MealPostViewState();
}

class _MealPostViewState extends State<MealPostView> {
  double cost = 0.0;
  String comment = "";
  File? image;

  @override
  Widget build(BuildContext context) {
    final src = image;
    final imageWidget = src == null
        ? const Icon(Icons.camera)
        : Image.file(src, fit: BoxFit.cover);
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: GestureDetector(
                  onTap: () async {
                    getImage();
                  },
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: imageWidget,
                  )),
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                MealFieldForm(
                  hintText: "コメント",
                  icon: Icons.description,
                  onChange: (comment) {
                    setState(() {
                      this.comment = comment;
                    });
                  },
                ),
                MealFieldForm(
                  hintText: "コスト",
                  icon: Icons.currency_yen,
                  onChange: (cost) {
                    final parsedCost = double.tryParse(cost) ?? 0.0;
                    setState(() {
                      this.cost = parsedCost;
                    });
                  },
                ),
                const Spacer(),
                MealPostButton(
                  comment: comment,
                  image: image,
                  cost: cost,
                )
              ],
            ))
      ],
    );
  }

  Future getImage() async {
    final provider = ImagePickerProvider();
    provider.getImage((image) {
      setState(() {
        this.image = image;
      });
    });
  }
}