import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/create_visitor.dart';
import '../../model/visitor.dart';
import '../repo/visitor_repo.dart';

part 'visitor_event.dart';
part 'visitor_state.dart';

class VisitorBloc extends Bloc<VisitorEvent, VisitorState> {
  final VisitorRepo _visitorRepo;

  static const int _limit = 8;

  int _currentPage = 1;

  String _orgId = '';
  String? _unitId;

  List<Visitor> _visitors = [];

  bool _hasMore = true;
  bool _isLoadingMore = false;

  VisitorBloc({required VisitorRepo visitorRepo})
    : _visitorRepo = visitorRepo,
      super(const VisitorInitial()) {
    on<CreateVisitorEvent>(_onCreateVisitor);
    on<GetVisitorsEvent>(_onGetVisitors);
    on<LoadMoreVisitorsEvent>(_onLoadMoreVisitors);
  }

  // CREATE VISITOR

  Future<void> _onCreateVisitor(
    CreateVisitorEvent event,
    Emitter<VisitorState> emit,
  ) async {
    emit(const VisitorLoading());

    final response = await _visitorRepo.createVisitor(visitor: event.visitor);

    if (response.hasError) {
      emit(
        VisitorFailed(
          message: response.error?.toString() ?? 'Failed to create visitor',
        ),
      );
      return;
    }

    emit(const VisitorCreateSuccess());
  }

  // GET VISITORS

  Future<void> _onGetVisitors(
    GetVisitorsEvent event,
    Emitter<VisitorState> emit,
  ) async {
    _orgId = event.orgId.trim();
    _unitId = event.unitId?.trim();

    if (_unitId?.isEmpty ?? false) {
      _unitId = null;
    }

    _currentPage = 1;
    _visitors = [];
    _hasMore = true;
    _isLoadingMore = false;

    emit(const VisitorLoading());

    final response = await _visitorRepo.getVisitors(
      orgId: _orgId,
      unitId: _unitId,
      limit: _limit,
      offset: 0,
    );

    if (response.hasData) {
      _visitors = response.data ?? [];

      _hasMore = _visitors.length == _limit;

      emit(
        VisitorListSuccess(
          visitors: List.unmodifiable(_visitors),
          hasMore: _hasMore,
          isLoadingMore: false,
        ),
      );
    } else {
      emit(
        VisitorFailed(
          message: response.error?.toString() ?? 'Failed to fetch visitors',
        ),
      );
    }
  }

  // LOAD MORE VISITORS

  Future<void> _onLoadMoreVisitors(
    LoadMoreVisitorsEvent event,
    Emitter<VisitorState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore) {
      return;
    }

    if (event.orgId.trim() != _orgId) {
      return;
    }

    if (event.unitId?.trim() != _unitId) {
      return;
    }

    _isLoadingMore = true;

    emit(
      VisitorListSuccess(
        visitors: List.unmodifiable(_visitors),
        hasMore: _hasMore,
        isLoadingMore: true,
      ),
    );

    final nextPage = _currentPage + 1;
    final offset = (nextPage - 1) * _limit;

    final response = await _visitorRepo.getVisitors(
      orgId: _orgId,
      unitId: _unitId,
      limit: _limit,
      offset: offset,
    );

    if (response.hasData) {
      final newVisitors = response.data ?? [];

      _visitors.addAll(newVisitors);
      _currentPage = nextPage;
      _hasMore = newVisitors.length == _limit;
    }

    _isLoadingMore = false;

    emit(
      VisitorListSuccess(
        visitors: List.unmodifiable(_visitors),
        hasMore: _hasMore,
        isLoadingMore: false,
      ),
    );
  }
}
