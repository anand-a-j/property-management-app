part of 'community_bloc.dart';

abstract class CommunityEvent extends Equatable {
  const CommunityEvent();

  @override
  List<Object?> get props => [];
}

class GetCommunities extends CommunityEvent {

  
  const GetCommunities();
}

class CreateCommunity extends CommunityEvent {
  final String orgId;
  final String developmentType;
  final String communityType;
  final String name;
  final String address;
  final String description;

  const CreateCommunity({
    required this.orgId,
    required this.developmentType,
    required this.communityType,
    required this.name,
    required this.address,
    required this.description,
  });

  @override
  List<Object?> get props => [
    orgId,
    developmentType,
    communityType,
    name,
    address,
    description,
  ];
}

class UpdateCommunity extends CommunityEvent {
  final String id;
  final String developmentType;
  final String communityType;
  final String name;
  final String address;
  final String description;

  const UpdateCommunity({
    required this.id,
    required this.developmentType,
    required this.communityType,
    required this.name,
    required this.address,
    required this.description,
  });

  @override
  List<Object?> get props => [
    id,
    developmentType,
    communityType,
    name,
    address,
    description,
  ];
}
