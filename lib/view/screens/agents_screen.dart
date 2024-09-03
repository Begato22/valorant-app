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
  List<Color> backgroundGradientColors = [];
  @override
  void initState() {
    backgroundGradientColors = widget.characterModel.backgroundGradientColors.isEmpty ? [const Color(0xFF52291A)] : widget.characterModel.backgroundGradientColors.map((e) => hexToColor(e)).toList();
    backgroundGradientColors.add(Colors.transparent);
    super.initState();
  }

  Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(backgroundColor: backgroundGradientColors.first, toolbarHeight: 25.h),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: backgroundGradientColors,
          ),
        ),
        child: AgentBoxView(characterModel: widget.characterModel, modelColors: backgroundGradientColors),
      ),
    );
  }
}
