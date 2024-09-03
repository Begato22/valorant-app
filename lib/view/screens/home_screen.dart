import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_app/config/routes/app_routes.dart';
import 'package:valorant_app/core/utils/app_images.dart';
import 'package:valorant_app/cubits/agent_cubit/agent_cubit.dart';
import 'package:valorant_app/view/widgets/agent_not_found.dart';
import 'package:valorant_app/view/widgets/progress_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AgentCubit cubit;
  @override
  void initState() {
    cubit = context.read<AgentCubit>();
    cubit.onLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentCubit, AgentState>(
      builder: (context, state) {
        if (state is AgentLoading) {
          return const ProgressWidget();
        } else if (state is AgentSuccuss) {
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
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
                      Text('Valorant', style: TextStyle(color: Colors.orange, fontSize: 20.sp))
                    ],
                  ),
                  SizedBox(height: 10.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.characterModel.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(Routes.agentRoute, arguments: state.characterModel[index]),
                        child: Container(
                          // height: 100.h,
                          // width: 100.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.grey.shade800, Colors.grey.shade400, Colors.grey.shade200],
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
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.grey.shade800, Colors.transparent],
                                    ),
                                    borderRadius: BorderRadius.circular(7.r),
                                  ),
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: state.characterModel[index].killfeedPortrait,
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
                                      Spacer(),
                                      Text(
                                        state.characterModel[index].displayName,
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
                                      imageUrl: state.characterModel[index].background ?? '',
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
                                    imageUrl: state.characterModel[index].fullPortrait ?? '',
                                    imageBuilder: (context, imageProvider) => Container(
                                      alignment: Alignment.centerLeft,
                                      child: Image(
                                        fit: BoxFit.contain,
                                        image: imageProvider,
                                        height: 0.35.sh,
                                        // width: 1.sw,
                                      ),
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
        } else {
          return const Center(child: Text('Error'));
        }
      },
    );
  }
}
