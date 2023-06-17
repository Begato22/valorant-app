import 'package:flutter/material.dart';
import 'package:valorant_app/core/utils/app_images.dart';
import 'package:valorant_app/data/models/character_model.dart';

class AgentBoxView extends StatelessWidget {
  final CharacterModel characterModel;
  const AgentBoxView({super.key, required this.characterModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(characterModel.displayName),
        // CachedNetworkImage(
        //   imageUrl: characterModel.background ?? '',
        //   imageBuilder: (context, imageProvider) => Container(
        //     alignment: Alignment.centerLeft,
        //     child: Image(image: imageProvider),
        //   ),
        //   placeholder: (context, url) => const CircularProgressIndicator(),
        //   errorWidget: (context, url, error) => const Icon(Icons.error),
        // ),
        Stack(
          alignment: Alignment.center,
          children: [
            FadeInImage(
              placeholder: const AssetImage(AppImages.placeholder),
              image: NetworkImage(characterModel.background ?? ''),
            ),
            FadeInImage(
              placeholder: const AssetImage(AppImages.placeholder),
              image: NetworkImage(characterModel.fullPortrait ?? '', scale: 5),
            ),
          ],
        )
        // Image.network(characterModel.fullPortrait ?? ''),
      ],
    );
  }
}
