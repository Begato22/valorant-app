part of 'agent_cubit.dart';

abstract class AgentState {}

class AgentInitial extends AgentState {}

class AgentLoading extends AgentState {}

class AgentSuccuss extends AgentState {
  List<CharacterModel> characterModel;
  AgentSuccuss({required this.characterModel});
}

class AgentError extends AgentState {}
