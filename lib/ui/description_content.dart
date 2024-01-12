import 'package:courses/apptheme.dart';
import 'package:courses/ui/custom_dropdown_widget.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DescriptionContent extends StatefulWidget {
  const DescriptionContent({super.key});

  @override
  State<DescriptionContent> createState() => _DescriptionContentState();
}

class _DescriptionContentState extends State<DescriptionContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildDescriptionContainer(),

      ],
    );
  }


  Widget _buildDescriptionContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Videodars yozma variantini yuklab olish',
            style: theme.styleMontserratBlack
                .copyWith(fontWeight: FontWeight.w600, fontSize: 12.o),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.o),
          decoration: BoxDecoration(
            color: theme.white,
            border: Border.all(width: 1, color: theme.borderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(10.o),
            ),
          ),
          height: 44.o,
          width: 350.o,
          child: Row(
            children: [
              const Expanded(child: CustomDropDownWidget()),
              SvgPicture.asset(
                SVGImages.downloadFile,
                color: theme.blue,
              )
            ],
          ),
        ),
        Container(
          width: 350.o,
          color: Colors.lightBlue,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: theme.textStyleSimple
                .copyWith(fontSize: 14.o, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
