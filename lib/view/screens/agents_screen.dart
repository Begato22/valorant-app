import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:valorant_app/data/models/character_model.dart';
import 'package:valorant_app/view/widgets/agent_box_view_widget.dart';

class AgentsScreen extends StatefulWidget {
  final CharacterModel characterModel;
  const AgentsScreen({super.key, required this.characterModel});

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF52291A),
        toolbarHeight: 25.h,
      ),
      // backgroundColor: Colors.brown,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF52291A), Colors.transparent],
          ),
        ),
        child: AgentBoxView(characterModel: widget.characterModel),
      ),
    );
  }
}
