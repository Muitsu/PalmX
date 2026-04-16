import 'package:flutter/material.dart';
import 'package:palmx/core/externsions/datetime_extension.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/calendar/provider/calendar_provider.dart';
import 'package:provider/provider.dart';
import 'operation_log_form_page.dart';

class OperationLogSummaryPage extends StatefulWidget {
  const OperationLogSummaryPage({super.key});

  @override
  State<OperationLogSummaryPage> createState() =>
      _OperationLogSummaryPageState();
}

class _OperationLogSummaryPageState extends State<OperationLogSummaryPage> {
  late ScrollController _scrollController;
  bool _showTitle = false;
  OperationLogModel? viewData;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    viewData = context.read<CalendarProvider>().viewData;
    // Listen to scroll changes to toggle the AppBar title
    _scrollController.addListener(() {
      if (_scrollController.offset > 120 && !_showTitle) {
        setState(() => _showTitle = true);
      } else if (_scrollController.offset <= 120 && _showTitle) {
        setState(() => _showTitle = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // The dynamic AppBar
            SliverAppBar(
              pinned: true,
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF1A2B47)),
                onPressed: () => Navigator.pop(context),
              ),
              // The title that appears/disappears
              title: AnimatedOpacity(
                opacity: _showTitle ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 250),
                child: const Text(
                  "Operation Summary",
                  style: TextStyle(
                    color: Color(0xFF1A2B47),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Color(0xFF1A2B47)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            OperationLogFormPage(operationData: viewData!),
                      ),
                    );
                  },
                ),
              ],
            ),

            // The Body Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Header Section (This is the one that scrolls away)
                    Center(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFF4ED),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.shield_outlined,
                              color: Colors.orange[800],
                              size: 32,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Operation Summary",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A2B47),
                            ),
                          ),
                          Text(
                            "Ref ID:${viewData!.id}",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildInfoCard(),
                    const SizedBox(height: 32),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Itemized Statement",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A2B47),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildStatementItem(
                      Icons.group_outlined,
                      "Labor",
                      "RM ${viewData!.labourTotalCost.toStringAsFixed(2)}",
                    ),
                    _buildStatementItem(
                      Icons.inventory_2_outlined,
                      "Supervision ",
                      "RM ${viewData!.supervisionTotalCost.toStringAsFixed(2)}",
                    ),

                    _buildStatementItem(
                      Icons.handyman_outlined,
                      "Driver ",
                      "RM ${viewData!.driverTotalCost.toStringAsFixed(2)}",
                    ),
                    _buildStatementItem(
                      Icons.local_shipping_outlined,
                      "Material",
                      "RM ${viewData!.materialTotalCost.toStringAsFixed(2)}",
                    ),
                    _buildStatementItem(
                      Icons.local_shipping_outlined,
                      "Evit",
                      "RM ${viewData!.evitTotalCost.toStringAsFixed(2)}",
                    ),
                    const SizedBox(height: 24),
                    _buildTotalCard(),
                    const SizedBox(height: 40),
                    _buildDisclaimer(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FBFF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.shade50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow("OPERATION AREA", viewData!.field ?? "-"),
          // const Divider(height: 30),
          // _infoRow("LEAD SUPERVISOR", "Sarah Jenkins"),
          const Divider(height: 30),
          _infoRow("COMPLETION DATE", viewData!.operationDate.previewDate()),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          value,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color(0xFF1A2B47),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildStatementItem(IconData icon, String title, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey[400], size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF1A2B47),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A2B47),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4ED),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFFE5D9)),
      ),
      child: Column(
        children: [
          const Text(
            "GRAND TOTAL",
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 13,
              letterSpacing: 1,
            ),
          ),
          Text(
            "RM ${viewData!.totalAll.toStringAsFixed(2)}",
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A2B47),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FBFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: Colors.orange[800], size: 18),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "By committing this entry, you verify that all line items have been inspected and match the operational logs for Phase 4.",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
