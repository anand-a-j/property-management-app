import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naseem/core/extension/common.dart';

import '../constants/constants.dart';
import '../theme/app_color_scheme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Color backgroundColor;
  final List<Widget>? actions;
  final void Function()? leadingOnTap;
  final PreferredSizeWidget? bottom;
  final bool isAnimate;
  final bool isTabContain;
  final bool isSmallWidth;

  const CustomAppBar({
    this.title,
    this.leadingOnTap,
    this.actions,
    this.backgroundColor = AppColorScheme.scaffoldBackgroundColor,
    this.bottom,
    this.isAnimate = false,
    this.isTabContain = false,
    this.isSmallWidth = false,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (isTabContain ? 46 : 0));
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.isAnimate) {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      );

      _offsetAnimation =
          Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: _animationController!,
              curve: Curves.easeOut,
            ),
          );

      _animationController!.forward();
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isAnimate
        ? SlideTransition(
            position: _offsetAnimation!,
            child: _AppBar(widget: widget, isSmallWidth: widget.isSmallWidth),
          )
        : _AppBar(widget: widget, isSmallWidth: widget.isSmallWidth);
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({required this.widget, required this.isSmallWidth});

  final CustomAppBar widget;
  final bool isSmallWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      backgroundColor: widget.backgroundColor,
      centerTitle: false,
      leading: widget.leadingOnTap != null
          ? GestureDetector(
              onTap: widget.leadingOnTap,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 5,
                  bottom: 5,
                  start: isSmallWidth ? AppConsts.pSmall : 20,
                ),
                child: Transform.rotate(
                  angle: 0,
                  child: SvgPicture.asset(Assets.backArrow),
                ),
              ),
            )
          : null,
      title: widget.title != null
          ? Padding(
              padding: EdgeInsetsDirectional.only(
                start: widget.leadingOnTap != null
                    ? isSmallWidth
                          ? 5
                          : 10
                    : isSmallWidth
                    ? AppConsts.pSmall
                    : 20,
              ),
              child: Text(widget.title!, style: context.titleSmall),
            )
          : null,
      actions: widget.actions,
      bottom: widget.bottom,
    );
  }
}
