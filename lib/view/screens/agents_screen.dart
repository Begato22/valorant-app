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
  late ColorScheme _colorScheme;
  @override
  void initState() {
    backgroundGradientColors = widget.characterModel.backgroundGradientColors.isEmpty ? [_colorScheme.primary] : widget.characterModel.backgroundGradientColors;
    backgroundGradientColors.add(Colors.transparent);
    super.initState();
  }

  @override
  void deactivate() {
    _colorScheme = Theme.of(context).colorScheme;
    super.deactivate();
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
        child: AgentBoxView(characterModel: widget.characterModel),
      ),
    );
  }
}
