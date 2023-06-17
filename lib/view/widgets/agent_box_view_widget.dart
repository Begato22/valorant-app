import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_app/core/utils/app_images.dart';
import 'package:valorant_app/data/models/character_model.dart';

class AgentBoxView extends StatelessWidget {
  final CharacterModel characterModel;
  const AgentBoxView({super.key, required this.characterModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: characterModel.background ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  alignment: Alignment.centerLeft,
                  child: Image(
                    fit: BoxFit.cover,
                    image: imageProvider,
                    height: 0.7.sh,
                    width: 1.sw,
                  ),
                ),
                errorWidget: (context, url, error) => const SizedBox(),
              ),
              CachedNetworkImage(
                imageUrl: characterModel.fullPortrait ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  alignment: Alignment.centerLeft,
                  child: Image(
                    fit: BoxFit.cover,
                    image: imageProvider,
                    height: 0.7.sh,
                    width: 1.sw,
                  ),
                ),
                placeholder: (context, url) => Image.asset(
                  AppImages.placeholder,
                  width: 100.w,
                  height: 100.w,
                ),
                errorWidget: (context, url, error) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.placeholder,
                      width: 150.w,
                      height: 150.w,
                    ),
                    const Text(
                      'Agent Character Model Not Found',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0.1.sw,
                left: 0.05.sw,
                child: Container(
                  padding: REdgeInsets.all(10),
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF52291A), Colors.transparent],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: const Color(0xFF52291A),
                          child: CachedNetworkImage(
                            imageUrl: characterModel.displayIcon,
                            imageBuilder: (context, imageProvider) => Container(
                              alignment: Alignment.centerLeft,
                              child: Image(image: imageProvider),
                            ),
                            errorWidget: (context, url, error) => const SizedBox(),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        characterModel.displayName,
                        style: TextStyle(fontSize: 24.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
