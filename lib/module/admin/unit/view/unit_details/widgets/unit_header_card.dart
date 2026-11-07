import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/enum/lease_status.dart';
import 'package:naseem/core/widgets/status_tag.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/lease/controller/blocs/bloc/active_lease_bloc.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/enum/unit_status.dart';
import '../../../model/unit.dart';

class UnitHeaderCard extends StatelessWidget {
  const UnitHeaderCard({
    super.key,
    required this.unit,
    required this.community,
  });

  final Unit unit;
  final Community community;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppConsts.pSide),
      padding: const EdgeInsets.all(AppConsts.pSide),
      decoration: BoxDecoration(
        color: context.secondary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        border: Border.all(color: context.surface),
        boxShadow: [
          BoxShadow(
            color: context.secondary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColorScheme.backgroundColor(2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.apartment,
                  size: 26,
                  color: AppColorScheme.iconColor(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      unit.name ?? '',
                      style: context.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      community.name ?? '',
                      style: context.bodySmall?.copyWith(
                        color: context.secondary.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<ActiveLeaseBloc, ActiveLeaseState>(
                builder: (context, state) {
                  final lease = state is ActiveLeaseSuccess
                      ? state.lease
                      : null;

                  final status = lease?.status == LeaseStatus.active
                      ? UnitStatus.occupied
                      : unit.status ?? UnitStatus.unassigned;

                  return StatusTag(status: status.label, color: status.color);
                },
              ),
            ],
          ),
          const SizedBox(height: 14),
          Divider(height: 1, color: context.surface),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _infoItem(
                  context,
                  'Unit Type',
                  unit.unitType,
                  Icons.category_outlined,
                ),
              ),
              Expanded(
                child: _infoItem(
                  context,
                  'Area',
                  unit.area?.isNotEmpty == true ? '${unit.area} sq. ft.' : null,
                  Icons.square_foot_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem(
    BuildContext context,
    String label,
    String? value,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(icon, size: 18, color: context.secondary.withValues(alpha: 0.6)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.bodySmall?.copyWith(
                  color: context.secondary.withValues(alpha: 0.6),
                ),
              ),
              Text(
                value?.isNotEmpty == true ? value! : '-',
                style: context.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
