import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/themes/dimension.dart';

const double kFloatingActionButtonSize = 56;

class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
  });

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  final _textController = TextEditingController();
  final _isExpanded = ValueNotifier<bool>(false);
  final _focusNode = FocusNode();

  late final _animationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  late final _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.linear,
  );

  late final _containerWidth = MediaQuery.of(context).size.width -
      (kFloatingActionButtonMargin * 2) -
      kFloatingActionButtonSize -
      Dimension.smaller.size;

  @override
  void dispose() {
    _textController.dispose();
    _isExpanded.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: kFloatingActionButtonSize + Dimension.smaller.size,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _animation,
                  child: SizedBox(
                    width: _containerWidth * _animation.value,
                    height: kFloatingActionButtonSize,
                    child: child,
                  ),
                );
              },
              child: Container(
                decoration: ShapeDecoration(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  onFieldSubmitted: (_) => _onTapFloatingActionButton(),
                  focusNode: _focusNode,
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'Adicionar',
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: _onTapFloatingActionButton,
            child: AnimatedBuilder(
              animation: Listenable.merge([_isExpanded, _textController]),
              builder: (context, child) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _textController.text.isNotEmpty
                    ? const Icon(Icons.save, key: ValueKey('save'))
                    : _isExpanded.value
                        ? const Icon(Icons.edit_off, key: ValueKey('edit_off'))
                        : const Icon(Icons.edit, key: ValueKey('edit')),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapFloatingActionButton() {
    if (_textController.text.isNotEmpty) {
      _saveText();
    }
    _toggleExpandable();
  }

  void _saveText() {
    log(_textController.text);
    _textController.clear();
  }

  void _toggleExpandable() {
    if (_isExpanded.value) {
      _isExpanded.value = false;
      _focusNode.unfocus();
      _animationController.reverse();
    } else {
      _isExpanded.value = true;
      _animationController.forward();
      _focusNode.requestFocus();
    }
  }
}
