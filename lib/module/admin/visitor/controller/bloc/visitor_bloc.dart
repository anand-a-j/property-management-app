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
    on<UpdateVisitorEvent>(_onUpdateVisitor);
    on<DeleteVisitorEvent>(_onDeleteVisitor);
    on<UpdateVisitorStatusEvent>(_onUpdateVisitorStatus);
  }

  // CREATE VISITOR
  Future<void> _onCreateVisitor(
    CreateVisitorEvent event,
    Emitter<VisitorState> emit,
  ) async {
    emit(const VisitorLoading());

    final response = await _visitorRepo.createVisitor(
      visitor: event.visitor,
    );

    if (response.hasError) {
      emit(
        VisitorFailed(
          message: response.error?.toString() ?? 'Failed to create visitor',
        ),
      );
      return;
    }

    emit(const VisitorSuccess());
  }

  // UPDATE VISITOR
  Future<void> _onUpdateVisitor(
    UpdateVisitorEvent event,
    Emitter<VisitorState> emit,
  ) async {
    emit(const VisitorLoading());

    final response = await _visitorRepo.updateVisitor(
      id: event.id,
      orgId: event.orgId,
      name: event.name,
      phone: event.phone,
      visitStartAt: event.visitStartAt,
      visitEndAt: event.visitEndAt,
      visitType: event.visitType,
      purpose: event.purpose,
      parkingRequired: event.parkingRequired??false,
      unitId: event.unitId,
      residentId: event.residentId,
      leaseId: event.leaseId,
    );

    if (response.hasError) {
      emit(
        VisitorFailed(
          message: response.error?.toString() ?? 'Failed to update visitor',
        ),
      );
      return;
    }

    emit(const VisitorSuccess());
  }

  // DELETE VISITOR
  Future<void> _onDeleteVisitor(
    DeleteVisitorEvent event,
    Emitter<VisitorState> emit,
  ) async {
    emit(const VisitorLoading());

    final response = await _visitorRepo.deleteVisitor(
      id: event.id,
      orgId: event.orgId,
    );

    if (response.hasError) {
      emit(
        VisitorFailed(
          message: response.error?.toString() ?? 'Failed to delete visitor',
        ),
      );
      return;
    }

    emit(const VisitorSuccess());
  }

  // UPDATE VISITOR STATUS
  Future<void> _onUpdateVisitorStatus(
    UpdateVisitorStatusEvent event,
    Emitter<VisitorState> emit,
  ) async {
    emit(const VisitorLoading());

    final response = await _visitorRepo.updateVisitorStatus(
      id: event.id,
      status: event.status,
    );

    if (response.hasError) {
      emit(
        VisitorFailed(
          message: response.error?.toString() ??
              'Failed to update visitor status',
        ),
      );
      return;
    }

    emit(const VisitorSuccess());
  }
}
