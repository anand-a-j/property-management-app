part of 'community_bloc.dart';

abstract class CommunityState extends Equatable {
  const CommunityState();

  @override
  List<Object?> get props => [];
}

class CommunityInitial extends CommunityState {
  const CommunityInitial();
}

class CommunityLoading extends CommunityState {
  const CommunityLoading();
}

class AddUpdateCommunitySuccess extends CommunityState {
  const AddUpdateCommunitySuccess();

  @override
  List<Object?> get props => [];
}

class CommunityFailed extends CommunityState {
  final String message;

  const CommunityFailed(this.message);

  @override
  List<Object?> get props => [message];
}
