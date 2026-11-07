import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../auth/core/controller/service/auth_service.dart';
import '../../../model/community.dart';
import '../../repo/community_repo.dart';

part 'community_listing_event.dart';
part 'community_listing_state.dart';

class CommunityListingBloc
    extends Bloc<CommunityListingEvent, CommunityListingState> {
  CommunityListingBloc({required CommunityRepo communityRepo})
    : _communityRepo = communityRepo,
      super(const CommunityListingInitial()) {
    on<GetCommunities>(_onGetCommunities);
    on<SearchCommunities>(_onSearchCommunities);
    on<LoadMoreCommunities>(_onLoadMoreCommunities);
  }

  final CommunityRepo _communityRepo;

  static const int _limit = 6;

  int _currentPage = 1;
  int _requestVersion = 0;

  String _orgId = '';
  String _searchQuery = '';

  bool _hasMore = true;
  bool _isLoadingMore = false;
  String? _loadMoreError;

  List<Community> _communities = [];

  Future<void> _onGetCommunities(
    GetCommunities event,
    Emitter<CommunityListingState> emit,
  ) async {
    await _loadFirstPage(emit: emit, searchQuery: event.searchQuery ?? '');
  }

  Future<void> _onSearchCommunities(
    SearchCommunities event,
    Emitter<CommunityListingState> emit,
  ) async {
    await _loadFirstPage(emit: emit, searchQuery: event.searchQuery);
  }

  Future<void> _loadFirstPage({
    required Emitter<CommunityListingState> emit,
    required String searchQuery,
  }) async {
    // Invalidate previous requests.
    final requestVersion = ++_requestVersion;

    _orgId = authentication.profile?.orgId ?? '';
    _searchQuery = searchQuery.trim();

    _currentPage = 1;
    _hasMore = true;
    _isLoadingMore = false;
    _loadMoreError = null;
    _communities = [];

    if (_orgId.isEmpty) {
      emit(CommunityListingFailed('Unable to identify your organization.'));
      return;
    }

    emit(const CommunityListingLoading());

    try {
      final response = await _communityRepo.getCommunities(
        orgId: _orgId,
        page: 1,
        limit: _limit,
        searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
      );

      if (requestVersion != _requestVersion || emit.isDone) return;

      if (!response.hasData) {
        emit(
          CommunityListingFailed(
            response.error ?? 'Unable to load communities.',
          ),
        );
        return;
      }

      _communities = response.data ?? [];
      _currentPage = 1;
      _hasMore = _communities.length == _limit;

      emit(_successState());
    } catch (e) {
      if (requestVersion != _requestVersion || emit.isDone) return;

      emit(
        CommunityListingFailed('Unable to load communities. Please try again.'),
      );
    }
  }

  Future<void> _onLoadMoreCommunities(
    LoadMoreCommunities event,
    Emitter<CommunityListingState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore) return;

    final requestVersion = _requestVersion;
    final nextPage = _currentPage + 1;

    _isLoadingMore = true;
    _loadMoreError = null;

    emit(_successState());

    try {
      final response = await _communityRepo.getCommunities(
        orgId: _orgId,
        page: nextPage,
        limit: _limit,
        searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
      );

      if (requestVersion != _requestVersion) return;

      if (!response.hasData) {
        _loadMoreError = response.error ?? 'Unable to load more communities.';
      } else {
        final newCommunities = response.data ?? [];

        final existingIds = _communities.map((c) => c.id).toSet();

        _communities.addAll(
          newCommunities.where((community) => existingIds.add(community.id)),
        );

        _currentPage = nextPage;
        _hasMore = newCommunities.length == _limit;
      }
    } catch (e) {
      if (requestVersion != _requestVersion) return;

      _loadMoreError = 'Unable to load more communities. Please retry.';
    }

    if (requestVersion != _requestVersion || emit.isDone) return;

    _isLoadingMore = false;

    emit(_successState());
  }

  CommunityListingSuccess _successState() {
    return CommunityListingSuccess(
      communities: List.unmodifiable(_communities),
      hasMore: _hasMore,
      isLoadingMore: _isLoadingMore,
      loadMoreError: _loadMoreError,
    );
  }
}
