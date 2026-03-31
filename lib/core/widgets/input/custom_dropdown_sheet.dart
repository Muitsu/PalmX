import 'package:flutter/material.dart';
import 'dart:async';

class CustomDropdownSheet<T> extends StatefulWidget {
  final String label;
  final List<T> items;
  final String Function(T data) getTitle;
  final T? groupValue;
  final T? Function(List<T> data)? onFindGroupValue;
  final List<T> Function(List<T> data, String? query)? onQuery;
  final void Function(T? data) onChange;
  final void Function(T? data)? onLongPress;
  final double initialChildSize;
  final double maxChildSize;
  final double minChildSize;
  final TextInputType keyboardType;
  final Color? accentColor;
  final String? emptyMessage;
  final Widget? customEmptyWidget;

  const CustomDropdownSheet({
    super.key,
    this.groupValue,
    required this.label,
    required this.items,
    required this.getTitle,
    required this.onChange,
    this.keyboardType = TextInputType.text,
    this.initialChildSize = 0.7,
    this.maxChildSize = 0.7,
    this.minChildSize = 0.3,
    this.onFindGroupValue,
    this.onQuery,
    this.accentColor,
    this.emptyMessage,
    this.customEmptyWidget,
    this.onLongPress,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required String label,
    required List<T> items,
    required String Function(T data) getTitle,
    required void Function(T? data) onChange,
    T? groupValue,
    T? Function(List<T> data)? onFindGroupValue,
    List<T> Function(List<T> data, String? query)? onQuery,
    double initialChildSize = 0.7,
    double maxChildSize = 0.7,
    double minChildSize = 0.3,
    TextInputType keyboardType = TextInputType.text,
    Color? accentColor,
    String? emptyMessage,
    Widget? customEmptyWidget,
    void Function(T? data)? onLongPress,
  }) async {
    return await showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 400),
        reverseDuration: const Duration(milliseconds: 300),
      )..forward(),
      builder: (_) => CustomDropdownSheet<T>(
        label: label,
        items: items,
        getTitle: getTitle,
        onChange: onChange,
        groupValue: groupValue,
        onFindGroupValue: onFindGroupValue,
        onQuery: onQuery,
        initialChildSize: initialChildSize,
        maxChildSize: maxChildSize,
        minChildSize: minChildSize,
        keyboardType: keyboardType,
        accentColor: accentColor,
        emptyMessage: emptyMessage,
        customEmptyWidget: customEmptyWidget,
        onLongPress: onLongPress,
      ),
    );
  }

  @override
  State<CustomDropdownSheet<T>> createState() => _CustomDropdownSheetState<T>();
}

class _CustomDropdownSheetState<T> extends State<CustomDropdownSheet<T>>
    with TickerProviderStateMixin {
  T? currValue;
  late List<T> shownItems;
  late List<T> backupItems;

  final searchController = TextEditingController();
  final scrollController = ScrollController();

  late AnimationController _headerAnimController;
  late AnimationController _searchAnimController;
  late AnimationController _listAnimController;
  late AnimationController _emptyAnimController;

  late Animation<double> _headerFadeAnim;
  late Animation<double> _headerSlideAnim;
  late Animation<double> _searchFadeAnim;
  late Animation<double> _searchSlideAnim;
  late Animation<double> _emptyFadeAnim;
  late Animation<double> _emptyScaleAnim;

  bool showEmpty = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    currValue = _setGroupValue();
    shownItems = List.of(widget.items);
    backupItems = List.of(widget.items);

    _headerAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _searchAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _listAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _emptyAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _headerFadeAnim = CurvedAnimation(
      parent: _headerAnimController,
      curve: Curves.easeOutCubic,
    );

    _headerSlideAnim = Tween<double>(begin: -20, end: 0).animate(
      CurvedAnimation(
        parent: _headerAnimController,
        curve: Curves.easeOutCubic,
      ),
    );

    _searchFadeAnim = CurvedAnimation(
      parent: _searchAnimController,
      curve: Curves.easeOutCubic,
    );

    _searchSlideAnim = Tween<double>(begin: -15, end: 0).animate(
      CurvedAnimation(
        parent: _searchAnimController,
        curve: Curves.easeOutCubic,
      ),
    );

    _emptyFadeAnim = CurvedAnimation(
      parent: _emptyAnimController,
      curve: Curves.easeOut,
    );

    _emptyScaleAnim = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _emptyAnimController, curve: Curves.easeOutBack),
    );

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _headerAnimController.forward();

    if (widget.onQuery != null) {
      await Future.delayed(const Duration(milliseconds: 100));
      _searchAnimController.forward();
    }

    await Future.delayed(const Duration(milliseconds: 200));
    if (shownItems.isEmpty) {
      showEmpty = true;
      _emptyAnimController.forward();
    } else {
      _listAnimController.forward();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    _headerAnimController.dispose();
    _searchAnimController.dispose();
    _listAnimController.dispose();
    _emptyAnimController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  T? _setGroupValue() {
    if (widget.onFindGroupValue != null) {
      return widget.onFindGroupValue!(widget.items);
    }
    return widget.groupValue;
  }

  void _onSearchChanged(String val) {
    if (widget.onQuery == null) return;

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final sendItems = List.of(backupItems);
      final queryList = val.isEmpty
          ? sendItems
          : widget.onQuery!(sendItems, val);

      setState(() {
        shownItems = queryList;
        showEmpty = queryList.isEmpty;
      });

      if (queryList.isEmpty) {
        _listAnimController.reverse();
        _emptyAnimController.forward(from: 0);
      } else {
        _emptyAnimController.reverse();
        _listAnimController.forward(from: 0);
      }
    });
  }

  Color get _accentColor => widget.accentColor ?? const Color(0xFF6C63FF);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: widget.initialChildSize,
      minChildSize: widget.minChildSize,
      maxChildSize: widget.maxChildSize,
      builder: (context, sc) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag Handle
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 8),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Header
              AnimatedBuilder(
                animation: _headerAnimController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_headerSlideAnim.value, 0),
                    child: Opacity(
                      opacity: _headerFadeAnim.value,
                      child: child,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 24,
                        decoration: BoxDecoration(
                          color: _accentColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.label,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                letterSpacing: -0.3,
                              ),
                        ),
                      ),

                      if (shownItems.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _accentColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${shownItems.length}',
                            style: TextStyle(
                              color: _accentColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          widget.onLongPress?.call(null);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _accentColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("Add"),
                      ),
                    ],
                  ),
                ),
              ),

              // Search
              if (widget.onQuery != null)
                AnimatedBuilder(
                  animation: _searchAnimController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_searchSlideAnim.value, 0),
                      child: Opacity(
                        opacity: _searchFadeAnim.value,
                        child: child,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                    child: _SearchField(
                      controller: searchController,
                      keyboardType: widget.keyboardType,
                      accentColor: _accentColor,
                      onChanged: _onSearchChanged,
                    ),
                  ),
                ),

              Divider(height: 1, thickness: 1, color: Colors.grey[100]),

              // Content
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position:
                            Tween<Offset>(
                              begin: const Offset(0, 0.05),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOutCubic,
                              ),
                            ),
                        child: child,
                      ),
                    );
                  },
                  child: shownItems.isNotEmpty
                      ? _AnimatedDropdownList<T>(
                          key: const ValueKey('list'),
                          items: shownItems,
                          groupValue: currValue,
                          getTitle: widget.getTitle,
                          accentColor: _accentColor,
                          animationController: _listAnimController,
                          scrollController: sc,
                          onLongPress: widget.onLongPress,
                          onChanged: (val) async {
                            widget.onChange(val);
                            Navigator.of(context).pop();
                          },
                        )
                      : _EmptyState(
                          key: const ValueKey('empty'),
                          message: widget.emptyMessage ?? "No results found",
                          fadeAnim: _emptyFadeAnim,
                          scaleAnim: _emptyScaleAnim,
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Animated List Widget
class _AnimatedDropdownList<T> extends StatelessWidget {
  final List<T> items;
  final T? groupValue;
  final String Function(T) getTitle;
  final Color accentColor;
  final AnimationController animationController;
  final ScrollController scrollController;
  final void Function(T?) onChanged;
  final void Function(T?)? onLongPress;

  const _AnimatedDropdownList({
    super.key,
    required this.items,
    required this.groupValue,
    required this.getTitle,
    required this.accentColor,
    required this.animationController,
    required this.scrollController,
    required this.onChanged,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isSelected = item == groupValue;

        // Staggered animation delay
        final delay = index * 50;

        return _AnimatedDropdownItem<T>(
          item: item,
          index: index,
          isSelected: isSelected,
          getTitle: getTitle,
          accentColor: accentColor,
          animationController: animationController,
          delay: delay,
          onChanged: onChanged,
          onLongPress: onLongPress,
        );
      },
    );
  }
}

// Animated Individual Item
class _AnimatedDropdownItem<T> extends StatefulWidget {
  final T item;
  final int index;
  final bool isSelected;
  final String Function(T) getTitle;
  final Color accentColor;
  final AnimationController animationController;
  final int delay;
  final void Function(T?) onChanged;
  final void Function(T?)? onLongPress;

  const _AnimatedDropdownItem({
    required this.item,
    required this.index,
    required this.isSelected,
    required this.getTitle,
    required this.accentColor,
    required this.animationController,
    required this.delay,
    required this.onChanged,
    this.onLongPress,
  });

  @override
  State<_AnimatedDropdownItem<T>> createState() =>
      _AnimatedDropdownItemState<T>();
}

class _AnimatedDropdownItemState<T> extends State<_AnimatedDropdownItem<T>>
    with SingleTickerProviderStateMixin {
  late AnimationController _itemAnimController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    _itemAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _fadeAnim = CurvedAnimation(
      parent: _itemAnimController,
      curve: Curves.easeOutCubic,
    );

    _slideAnim = Tween<Offset>(begin: const Offset(0.15, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _itemAnimController,
            curve: Curves.easeOutCubic,
          ),
        );

    Future.delayed(Duration(milliseconds: widget.delay + 100), () {
      if (mounted) _itemAnimController.forward();
    });
  }

  @override
  void dispose() {
    _itemAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnim,
      child: FadeTransition(opacity: _fadeAnim, child: _buildItem()),
    );
  }

  Widget _buildItem() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      decoration: BoxDecoration(
        color: widget.isSelected
            ? widget.accentColor.withValues(alpha: 0.08)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: widget.isSelected
              ? widget.accentColor.withValues(alpha: 0.3)
              : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onLongPress: widget.onLongPress != null
              ? () => widget.onLongPress!(widget.item)
              : null,
          onTap: () => widget.onChanged(widget.item),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                // Custom Radio Indicator
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.isSelected
                          ? widget.accentColor
                          : Colors.grey[400]!,
                      width: 2,
                    ),
                    color: widget.isSelected
                        ? widget.accentColor
                        : Colors.transparent,
                  ),
                  child: widget.isSelected
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 16),
                // Title
                Expanded(
                  child: Text(
                    widget.getTitle(widget.item),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: widget.isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: widget.isSelected
                          ? widget.accentColor
                          : Colors.grey[800],
                    ),
                  ),
                ),
                // Trailing arrow
                if (widget.isSelected)
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: widget.accentColor.withValues(alpha: 0.6),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Search Field Widget
class _SearchField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Color accentColor;
  final void Function(String) onChanged;

  const _SearchField({
    required this.controller,
    required this.keyboardType,
    required this.accentColor,
    required this.onChanged,
  });

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  bool _hasFocus = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _hasFocus = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: _hasFocus
              ? widget.accentColor.withValues(alpha: 0.5)
              : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: _hasFocus
            ? [
                BoxShadow(
                  color: widget.accentColor.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: _hasFocus ? widget.accentColor : Colors.grey[400],
            size: 22,
          ),
          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear_rounded,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                  onPressed: () {
                    widget.controller.clear();
                    widget.onChanged('');
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}

// Empty State Widget
class _EmptyState extends StatelessWidget {
  final String message;
  final Animation<double> fadeAnim;
  final Animation<double> scaleAnim;

  const _EmptyState({
    super.key,
    required this.message,
    required this.fadeAnim,
    required this.scaleAnim,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnim,
      child: ScaleTransition(
        scale: scaleAnim,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Icon Container
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.search_off_rounded,
                    size: 56,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Try adjusting your search",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
