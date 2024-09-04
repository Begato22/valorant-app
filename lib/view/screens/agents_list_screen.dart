import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_app/config/routes/app_routes.dart';
import 'package:valorant_app/core/utils/app_images.dart';
import 'package:valorant_app/data/models/character_model.dart';
import 'package:valorant_app/view/widgets/agent_not_found.dart';

class AgentListScreen extends StatefulWidget {
  final List<CharacterModel> characters;
  const AgentListScreen({super.key, required this.characters});

  @override
  State<AgentListScreen> createState() => _AgentListScreenState();
}

class _AgentListScreenState extends State<AgentListScreen> {
  late ColorScheme _colorScheme;

  @override
  void didChangeDependencies() {
    _colorScheme = Theme.of(context).colorScheme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.placeholder,
                  width: 50.w,
                  height: 50.w,
                ),
                SizedBox(width: 10.w),
                Image.asset(
                  AppImages.valorantWord,
                  fit: BoxFit.fill,
                  width: 150.w,
                  height: 70.w,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.characters.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(Routes.agentRoute, arguments: widget.characters[index]),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [_colorScheme.secondary.withOpacity(0.7), _colorScheme.surface, _colorScheme.surface.withOpacity(1)],
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: REdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [_colorScheme.surface, Colors.transparent],
                              ),
                            ),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: widget.characters[index].killfeedPortrait,
                                  imageBuilder: (context, imageProvider) => Container(
                                    alignment: Alignment.centerLeft,
                                    child: Image(
                                      fit: BoxFit.contain,
                                      image: imageProvider,
                                      height: 20.h,
                                      width: 60.w,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => const AgentNotFoundWidget(isLarge: false),
                                ),
                                const Spacer(),
                                Text(
                                  widget.characters[index].displayName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            Opacity(
                              opacity: 0.1,
                              child: CachedNetworkImage(
                                imageUrl: widget.characters[index].background ?? '',
                                imageBuilder: (context, imageProvider) => Container(
                                  alignment: Alignment.centerLeft,
                                  child: Image(
                                    fit: BoxFit.contain,
                                    image: imageProvider,
                                    height: 0.25.sh,
                                    width: 0.6.sw,
                                  ),
                                ),
                                errorWidget: (context, url, error) => const SizedBox(),
                              ),
                            ),
                            CachedNetworkImage(
                              imageUrl: widget.characters[index].fullPortrait ?? '',
                              imageBuilder: (context, imageProvider) => Container(
                                alignment: Alignment.centerLeft,
                                child: Image(fit: BoxFit.contain, image: imageProvider, height: 0.35.sh),
                              ),
                              errorWidget: (context, url, error) => const AgentNotFoundWidget(isLarge: false),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
