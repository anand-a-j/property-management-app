import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/enum/visitor_status.dart';
import '../../model/create_visitor.dart';
import '../../model/visitor.dart';
import '../repo/visitor_repo.dart';

part 'visitor_event.dart';
part 'visitor_state.dart';

class VisitorBloc extends Bloc<VisitorEvent, VisitorState> {
  final VisitorRepo _visitorRepo;

  VisitorBloc({required VisitorRepo visitorRepo})
    : _visitorRepo = visitorRepo,
      super(const VisitorInitial()) {
    on<CreateVisitorEvent>(_onCreateVisitor);

    on<UpdateVisitorStatusEvent>(_onUpdateVisitorStatus);
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

  Future<void> _onUpdateVisitorStatus(
    UpdateVisitorStatusEvent event,
    Emitter<VisitorState> emit,
  ) async {
    emit(VisitorStatusUpdating());

    final response = await _visitorRepo.updateVisitorStatus(
      id: event.id,
      status: event.status,
    );

    if (response.error != null) {
      emit(VisitorStatusUpdateFailed(message: response.error.toString()));
      return;
    }

    emit(VisitorStatusUpdated());
  }
}
