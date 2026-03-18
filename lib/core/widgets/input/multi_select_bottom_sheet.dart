// ============================================================
// File: multi_select_bottom_sheet.dart
// Self-contained, reusable multi-select bottom sheet
// ============================================================

import 'package:flutter/material.dart';
import 'dart:async';

/// Configuration for the multi-select sheet
class MultiSelectConfig<T> {
  /// Title shown in header
  final String title;

  /// Hint text for search field
  final String searchHint;

  /// Function to get unique ID for comparison
  final String Function(T item) getId;

  /// Function to get primary title
  final String Function(T item) getTitle;

  /// Function to get subtitle (optional)
  final String? Function(T item)? getSubtitle;

  /// Function to get tertiary info (optional)
  final String? Function(T item)? getTertiary;

  /// Custom item builder (overrides default)
  final Widget Function(
    BuildContext context,
    T item,
    bool isSelected,
    VoidCallback onTap,
  )?
  itemBuilder;

  /// Custom empty state widget
  final Widget? emptyWidget;

  /// Empty state message
  final String emptyMessage;

  /// Empty state icon
  final IconData emptyIcon;

  /// Accent color for selections
  final Color? accentColor;

  /// Show search field
  final bool showSearch;

  /// Show filter button
  final bool showFilter;

  /// Filter button callback
  final VoidCallback? onFilterTap;

  /// Save button text
  final String saveButtonText;

  /// Show save button
  final bool showSaveButton;

  const MultiSelectConfig({
    required this.title,
    required this.getId,
    required this.getTitle,
    this.searchHint = 'Search...',
    this.getSubtitle,
    this.getTertiary,
    this.itemBuilder,
    this.emptyWidget,
    this.emptyMessage = 'No data available',
    this.emptyIcon = Icons.inbox_outlined,
    this.accentColor,
    this.showSearch = true,
    this.showFilter = false,
    this.onFilterTap,
    this.saveButtonText = 'Save',
    this.showSaveButton = true,
  });
}

/// Data source callbacks for the multi-select sheet
class MultiSelectDataSource<T> {
  /// Fetch data with optional query and pagination
  /// Returns a list of items
  final Future<List<T>> Function(String? query, int page, int pageSize)? fetch;

  /// Initial items (if not using fetch)
  final List<T>? initialItems;

  /// Called when items are loaded (for caching)
  final void Function(List<T> items)? onItemsLoaded;

  const MultiSelectDataSource({
    this.fetch,
    this.initialItems,
    this.onItemsLoaded,
  }) : assert(
         fetch != null || initialItems != null,
         'Either fetch or initialItems must be provided',
       );
}

/// A reusable, animated multi-select bottom sheet
/// Fully self-contained - no external state management required
class MultiSelectBottomSheet<T> extends StatefulWidget {
  final MultiSelectConfig<T> config;
  final MultiSelectDataSource<T> dataSource;
  final List<T>? initialSelections;
  final double initialChildSize;
  final double maxChildSize;
  final double minChildSize;
  final bool enablePagination;

  const MultiSelectBottomSheet({
    super.key,
    required this.config,
    required this.dataSource,
    this.initialSelections,
    this.initialChildSize = 0.85,
    this.maxChildSize = 0.95,
    this.minChildSize = 0.5,
    this.enablePagination = true,
  });

  /// Static method to show the bottom sheet
  static Future<List<T>?> show<T>({
    required BuildContext context,
    required MultiSelectConfig<T> config,
    required MultiSelectDataSource<T> dataSource,
    List<T>? initialSelections,
    double initialChildSize = 0.85,
    double maxChildSize = 0.95,
    double minChildSize = 0.5,
    bool enablePagination = true,
    Color? barrierColor,
  }) async {
    return await showModalBottomSheet<List<T>>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.5),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * maxChildSize,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => MultiSelectBottomSheet<T>(
        config: config,
        dataSource: dataSource,
        initialSelections: initialSelections,
        initialChildSize: initialChildSize,
        maxChildSize: maxChildSize,
        minChildSize: minChildSize,
        enablePagination: enablePagination,
      ),
    );
  }

  @override
  State<MultiSelectBottomSheet<T>> createState() =>
      _MultiSelectBottomSheetState<T>();
}

class _MultiSelectBottomSheetState<T> extends State<MultiSelectBottomSheet<T>>
    with TickerProviderStateMixin {
  // Internal state
  List<T> _items = [];
  List<T> _selectedItems = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _currentPage = 1;
  String _searchQuery = '';

  late ScrollController _scrollController;

  // Animation controllers
  late AnimationController _headerAnimController;
  late AnimationController _searchAnimController;
  late AnimationController _listAnimController;
  late AnimationController _emptyAnimController;
  late AnimationController _fabAnimController;

  // Animations
  late Animation<double> _headerFadeAnim;
  late Animation<Offset> _headerSlideAnim;
  late Animation<double> _searchFadeAnim;
  late Animation<Offset> _searchSlideAnim;
  late Animation<double> _emptyFadeAnim;
  late Animation<double> _emptyScaleAnim;
  late Animation<double> _fabScaleAnim;

  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();
  bool isInitialized = false;

  Color get _accentColor =>
      widget.config.accentColor ?? const Color(0xFF6C63FF);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    _initAnimations();
    _initData();
  }

  void _initAnimations() {
    // Header animation
    _headerAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _headerFadeAnim = CurvedAnimation(
      parent: _headerAnimController,
      curve: Curves.easeOutCubic,
    );
    _headerSlideAnim =
        Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _headerAnimController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Search animation
    _searchAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _searchFadeAnim = CurvedAnimation(
      parent: _searchAnimController,
      curve: Curves.easeOutCubic,
    );
    _searchSlideAnim =
        Tween<Offset>(begin: const Offset(0, -0.2), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _searchAnimController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Empty state animation
    _emptyAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _emptyFadeAnim = CurvedAnimation(
      parent: _emptyAnimController,
      curve: Curves.easeOut,
    );
    _emptyScaleAnim = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _emptyAnimController, curve: Curves.easeOutBack),
    );

    // List animation
    _listAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    // FAB animation
    _fabAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fabScaleAnim = CurvedAnimation(
      parent: _fabAnimController,
      curve: Curves.easeOutBack,
    );
  }

  Future<void> _initData() async {
    // Set initial selections
    if (widget.initialSelections != null) {
      _selectedItems = List.from(widget.initialSelections!);
    }

    // Load data
    await _loadData(isInitial: true);

    if (mounted) {
      setState(() => isInitialized = true);
      _startAnimations();
    }
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _headerAnimController.forward();

    if (widget.config.showSearch) {
      await Future.delayed(const Duration(milliseconds: 100));
      _searchAnimController.forward();
    }

    await Future.delayed(const Duration(milliseconds: 200));
    _updateContentAnimation();

    if (widget.config.showSaveButton) {
      await Future.delayed(const Duration(milliseconds: 300));
      _fabAnimController.forward();
    }
  }

  void _updateContentAnimation() {
    if (_items.isEmpty && !_isLoading) {
      _emptyAnimController.forward();
    } else {
      _listAnimController.forward(from: 0);
    }
  }

  Future<void> _loadData({
    bool isInitial = false,
    bool isLoadMore = false,
  }) async {
    if (_isLoading || _isLoadingMore) return;

    if (isLoadMore && !_hasMore) return;

    setState(() {
      if (isInitial || !isLoadMore) {
        _isLoading = true;
      } else {
        _isLoadingMore = true;
      }
    });

    try {
      List<T> newItems;

      if (widget.dataSource.fetch != null) {
        // Use fetch callback
        newItems = await widget.dataSource.fetch!(
          _searchQuery.isEmpty ? null : _searchQuery,
          isLoadMore ? _currentPage + 1 : 1,
          20,
        );

        if (isLoadMore) {
          _items = [..._items, ...newItems];
          _currentPage++;
        } else {
          _items = newItems;
          _currentPage = 1;
        }

        _hasMore = newItems.isNotEmpty;
      } else {
        // Use initialItems with local filtering
        newItems = widget.dataSource.initialItems ?? [];

        if (_searchQuery.isNotEmpty) {
          newItems = newItems.where((item) {
            final title = widget.config.getTitle(item).toLowerCase();
            final subtitle =
                widget.config.getSubtitle?.call(item)?.toLowerCase() ?? '';
            return title.contains(_searchQuery.toLowerCase()) ||
                subtitle.contains(_searchQuery.toLowerCase());
          }).toList();
        }

        _items = newItems;
        _hasMore = false;
      }

      widget.dataSource.onItemsLoaded?.call(_items);
    } catch (e) {
      debugPrint('Error loading data: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _isLoadingMore = false;
        });
        _updateContentAnimation();
      }
    }
  }

  void _scrollListener() {
    if (!widget.enablePagination) return;

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * 0.9 &&
        !_scrollController.position.outOfRange) {
      _loadData(isLoadMore: true);
    }
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _searchQuery = query;
      _loadData();
    });
  }

  bool _isSelected(T item) {
    final itemId = widget.config.getId(item);
    return _selectedItems.any((e) => widget.config.getId(e) == itemId);
  }

  void _toggleItem(T item) {
    setState(() {
      if (_isSelected(item)) {
        _selectedItems.removeWhere(
          (e) => widget.config.getId(e) == widget.config.getId(item),
        );
      } else {
        _selectedItems.add(item);
      }
    });
  }

  void _onSave() {
    Navigator.of(context).pop(List<T>.from(_selectedItems));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.dispose();
    _searchController.dispose();
    _headerAnimController.dispose();
    _searchAnimController.dispose();
    _listAnimController.dispose();
    _emptyAnimController.dispose();
    _fabAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          _buildDragHandle(),
          _buildHeader(),
          if (widget.config.showSearch) _buildSearchField(),
          Divider(height: 1, thickness: 1, color: Colors.grey[100]),
          Expanded(child: _buildContent()),
          if (widget.config.showSaveButton) _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildDragHandle() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 12, bottom: 8),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SlideTransition(
      position: _headerSlideAnim,
      child: FadeTransition(
        opacity: _headerFadeAnim,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 16, 8),
          child: Row(
            children: [
              // Back button
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: Colors.grey[700],
                ),
                onPressed: () => Navigator.pop(context),
              ),
              // Title
              Expanded(
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
                        widget.config.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Selection count badge
              if (_selectedItems.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _accentColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_selectedItems.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              // Filter button
              if (widget.config.showFilter) ...[
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(
                    Icons.filter_list_rounded,
                    color: Colors.grey[700],
                  ),
                  onPressed: widget.config.onFilterTap,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return SlideTransition(
      position: _searchSlideAnim,
      child: FadeTransition(
        opacity: _searchFadeAnim,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: _AnimatedSearchField(
            controller: _searchController,
            hintText: widget.config.searchHint,
            accentColor: _accentColor,
            onChanged: _onSearchChanged,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    // Show loading skeleton
    if (_isLoading && _items.isEmpty) {
      return _buildLoadingSkeleton();
    }

    // Show empty state
    if (_items.isEmpty) {
      return _buildEmptyState();
    }

    // Show list
    return _buildAnimatedList();
  }

  Widget _buildLoadingSkeleton() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 16,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 12,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[250],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return FadeTransition(
      opacity: _emptyFadeAnim,
      child: ScaleTransition(
        scale: _emptyScaleAnim,
        child:
            widget.config.emptyWidget ??
            _DefaultEmptyState(
              message: widget.config.emptyMessage,
              icon: widget.config.emptyIcon,
            ),
      ),
    );
  }

  Widget _buildAnimatedList() {
    return Scrollbar(
      thickness: 6,
      radius: const Radius.circular(20),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        itemCount: _items.length + (_isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          // Show loading indicator at bottom
          if (index == _items.length) {
            return _buildLoadingMore();
          }

          final item = _items[index];
          final isSelected = _isSelected(item);

          return _AnimatedListItem<T>(
            item: item,
            index: index,
            isSelected: isSelected,
            config: widget.config,
            accentColor: _accentColor,
            animationController: _listAnimController,
            onTap: () => _toggleItem(item),
          );
        },
      ),
    );
  }

  Widget _buildLoadingMore() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(_accentColor),
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ScaleTransition(
      scale: _fabScaleAnim,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: ElevatedButton(
                onPressed: _selectedItems.isNotEmpty ? _onSave : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _accentColor,
                  disabledBackgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.config.saveButtonText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    if (_selectedItems.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${_selectedItems.length}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// Animated List Item
// ============================================================

class _AnimatedListItem<T> extends StatefulWidget {
  final T item;
  final int index;
  final bool isSelected;
  final MultiSelectConfig<T> config;
  final Color accentColor;
  final AnimationController animationController;
  final VoidCallback onTap;

  const _AnimatedListItem({
    required this.item,
    required this.index,
    required this.isSelected,
    required this.config,
    required this.accentColor,
    required this.animationController,
    required this.onTap,
  });

  @override
  State<_AnimatedListItem<T>> createState() => _AnimatedListItemState<T>();
}

class _AnimatedListItemState<T> extends State<_AnimatedListItem<T>>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _fadeAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _slideAnim = Tween<Offset>(
      begin: const Offset(0.1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    // Staggered delay based on index
    final delay = (widget.index % 10) * 50;
    Future.delayed(Duration(milliseconds: delay + 100), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnim,
      child: FadeTransition(
        opacity: _fadeAnim,
        child:
            widget.config.itemBuilder?.call(
              context,
              widget.item,
              widget.isSelected,
              widget.onTap,
            ) ??
            _DefaultListItem<T>(
              item: widget.item,
              isSelected: widget.isSelected,
              config: widget.config,
              accentColor: widget.accentColor,
              onTap: widget.onTap,
            ),
      ),
    );
  }
}

// ============================================================
// Default List Item Widget
// ============================================================

class _DefaultListItem<T> extends StatelessWidget {
  final T item;
  final bool isSelected;
  final MultiSelectConfig<T> config;
  final Color accentColor;
  final VoidCallback onTap;

  const _DefaultListItem({
    required this.item,
    required this.isSelected,
    required this.config,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final title = config.getTitle(item);
    final subtitle = config.getSubtitle?.call(item);
    final tertiary = config.getTertiary?.call(item);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? accentColor.withValues(alpha: 0.08)
            : Colors.grey[50],
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected
              ? accentColor.withValues(alpha: 0.4)
              : Colors.grey[200]!,
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                // Selection indicator
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? accentColor : Colors.transparent,
                    border: Border.all(
                      color: isSelected ? accentColor : Colors.grey[400]!,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 16),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: isSelected ? accentColor : Colors.grey[800],
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                      if (tertiary != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          tertiary,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                // Trailing indicator
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isSelected ? 1 : 0,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: accentColor.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// Animated Search Field
// ============================================================

class _AnimatedSearchField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Color accentColor;
  final void Function(String) onChanged;

  const _AnimatedSearchField({
    required this.controller,
    required this.hintText,
    required this.accentColor,
    required this.onChanged,
  });

  @override
  State<_AnimatedSearchField> createState() => _AnimatedSearchFieldState();
}

class _AnimatedSearchFieldState extends State<_AnimatedSearchField> {
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;

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
        onChanged: widget.onChanged,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          hintText: widget.hintText,
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

// ============================================================
// Default Empty State
// ============================================================

class _DefaultEmptyState extends StatelessWidget {
  final String message;
  final IconData icon;

  const _DefaultEmptyState({required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              child: Icon(icon, size: 48, color: Colors.grey[400]),
            ),
            const SizedBox(height: 20),
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
              'Try adjusting your search',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
// // Example 1: With API fetch
// MultiSelectBottomSheet.show<User>(
//   context: context,
//   config: MultiSelectConfig(
//     title: 'Select Users',
//     getId: (user) => user.id,
//     getTitle: (user) => user.name,
//   ),
//   dataSource: MultiSelectDataSource(
//     fetch: (query, page, _) => api.searchUsers(query, page),
//   ),
// );

// // Example 2: With local list
// MultiSelectBottomSheet.show<String>(
//   context: context,
//   config: MultiSelectConfig(
//     title: 'Select Tags',
//     getId: (tag) => tag,
//     getTitle: (tag) => tag,
//   ),
//   dataSource: MultiSelectDataSource(
//     initialItems: ['Flutter', 'Dart', 'Firebase', 'API'],
//   ),
// );

// // Example 3: With custom item builder
// MultiSelectBottomSheet.show<Product>(
//   context: context,
//   config: MultiSelectConfig(
//     title: 'Select Products',
//     getId: (p) => p.id,
//     getTitle: (p) => p.name,
//     itemBuilder: (context, item, isSelected, onTap) => ListTile(
//       leading: Image.network(item.imageUrl),
//       title: Text(item.name),
//       trailing: isSelected ? Icon(Icons.check) : null,
//       onTap: onTap,
//     ),
//   ),
//   dataSource: MultiSelectDataSource(
//     fetch: (_, page, __) => api.getProducts(page),
//   ),
// );
