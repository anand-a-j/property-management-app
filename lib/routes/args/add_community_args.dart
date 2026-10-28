import '../../module/admin/community/model/community.dart';

class AddCommunityArgs {
  final Community? community;
  final bool isEdit;

  const AddCommunityArgs({this.community, this.isEdit = false});
}
