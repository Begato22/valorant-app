import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:valorant_app/cubits/agent_cubit/agent_cubit.dart';
import 'package:valorant_app/view/widgets/agent_box_view_widget.dart';
import 'package:valorant_app/view/widgets/progress_widget.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({super.key});

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
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
            // backgroundColor: Colors.brown,
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF52291A), Colors.transparent],
                ),
              ),
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: state.characterModel.map((characterModel) => AgentBoxView(characterModel: characterModel)).toList(),
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
