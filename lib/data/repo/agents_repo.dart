import 'dart:developer';

import 'package:valorant_app/core/api/api_consumer.dart';
import 'package:valorant_app/core/api/end_points.dart';
import 'package:valorant_app/data/models/agent_model.dart';
import 'package:valorant_app/data/models/character_model.dart';

abstract class AgentsRepository {
  Future<List<CharacterModel>> getAgents();
}

class AgentsRepositoryImpl implements AgentsRepository {
  final ApiConsumer apiConsumer;

  AgentsRepositoryImpl({required this.apiConsumer});
  @override
  Future<List<CharacterModel>> getAgents() async {
    try {
      final response = await apiConsumer.get(EndPoints.agents);
      return AgentModel.fromJson(response).data;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
