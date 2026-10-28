import 'dart:async';

import 'package:flutter/material.dart';

class MoreOptionItem {
  const MoreOptionItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.subtitle,
    this.isDestructive = false,
    this.enabled = true,
    this.confirmTitle,
    this.confirmMessage,
  });

  final String title;
  final IconData icon;
  final String? subtitle;

  /// Supports both synchronous and asynchronous actions.
  final FutureOr<void> Function() onTap;

  /// Highlights actions such as Delete.
  final bool isDestructive;

  final bool enabled;

  /// Optional confirmation dialog before executing the action.
  final String? confirmTitle;
  final String? confirmMessage;
}
