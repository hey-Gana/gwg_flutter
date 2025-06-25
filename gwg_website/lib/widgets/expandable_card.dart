import 'package:flutter/material.dart';

class ExpandableCard extends StatefulWidget {
  final String title;
  final String description;
  final Widget expandedContent;

  const ExpandableCard({
    super.key,
    required this.title,
    required this.description,
    required this.expandedContent,
  });

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: InkWell(
        onTap: () => setState(() => isExpanded = !isExpanded),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.description,
                style: const TextStyle(color: Colors.white70),
              ),
              if (isExpanded) ...[
                const SizedBox(height: 16),
                widget.expandedContent,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
