import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_app/config/routes/app_routes.dart';
import 'package:valorant_app/core/utils/app_images.dart';
import 'package:valorant_app/cubits/agent_cubit/agent_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ColorScheme _colorScheme;
  late AgentCubit cubit;
  @override
  void initState() {
    cubit = context.read<AgentCubit>();
    cubit.onLoad();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _colorScheme = Theme.of(context).colorScheme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentCubit, AgentState>(
      builder: (context, state) {
        if (state is AgentSuccuss || state is AgentLoading) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.valorantFullLogo, width: 200.sp, height: 200.sp),
                  SizedBox(height: 10.h),
                  if (state is AgentLoading) ...[
                    CircularProgressIndicator(color: _colorScheme.primary),
                  ] else ...[
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(Routes.agentListRoute, arguments: (state as AgentSuccuss).characterModel),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _colorScheme.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Enjoy with our Heros', style: TextStyle(fontSize: 16.sp, color: _colorScheme.secondary)),
                          SizedBox(width: 5.w),
                          Icon(Icons.chevron_right, color: _colorScheme.secondary),
                        ],
                      ),
                    )
                  ],
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
