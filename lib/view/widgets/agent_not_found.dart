import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_app/core/utils/app_images.dart';

class AgentNotFoundWidget extends StatelessWidget {
  final bool isLarge;
  const AgentNotFoundWidget({super.key, this.isLarge = true});

  @override
  Widget build(BuildContext context) {
    final double size = isLarge ? 150.w : 75;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.placeholder,
          width: size,
          height: size,
        ),
        Container(
          width: double.infinity,
          padding: REdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Agent Character Model Not Found',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: size / 7),
          ),
        ),
      ],
    );
  }
}
