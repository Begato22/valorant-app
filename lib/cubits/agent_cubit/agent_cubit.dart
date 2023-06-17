import 'package:bloc/bloc.dart';
import 'package:valorant_app/data/models/character_model.dart';

import 'package:valorant_app/data/repo/agents_repo.dart';

part 'agent_state.dart';

class AgentCubit extends Cubit<AgentState> {
  final AgentsRepository agentsRepository;
  AgentCubit({required this.agentsRepository}) : super(AgentInitial());

  void onLoad() async {
    await getAgents();
  }

  Future<List<CharacterModel>> getAgents() async {
    emit(AgentLoading());
    try {
      List<CharacterModel> list = await agentsRepository.getAgents();
      emit(AgentSuccuss(characterModel: list));
      return list;
    } catch (e) {
      emit(AgentError());
      rethrow;
    }
  }
}
