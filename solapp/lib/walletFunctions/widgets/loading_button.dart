import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key, required this.onClick, required this.label});

  final Future<void> Function() onClick;
  final String label;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton>
    with SingleTickerProviderStateMixin {
  bool _loading = false;
  late AnimationController _controller;
  late Animation<int> _tween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _tween = IntTween(begin: 100, end: 20).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _tween,
      builder: (context, child) => FilledButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              minimumSize: MaterialStatePropertyAll(
                Size(_tween.value.w, 8.h),
              ),
            ),
        onPressed: _loading ? null : _onPressed,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _loading
              ? CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onSurface,
                )
              : Text(
                  widget.label,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
        ),
      ),
    );
  }

  Future<void> _onPressed() async {
    setState(() {
      _loading = true;
    });
    _controller.forward();
    await widget.onClick();
    _controller.reverse();
    setState(() {
      _loading = false;
    });
  }
}
