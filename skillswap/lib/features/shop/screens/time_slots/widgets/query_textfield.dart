import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class QueryTextfiled extends StatelessWidget {
  const QueryTextfiled({
    super.key,
    required TextEditingController queryController,
  }) : _queryController = queryController;

  final TextEditingController _queryController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(4, 4),
          )
        ],
      ),
      child: TextField(
        controller: _queryController,
        maxLines: null,
        expands: true,
        decoration: InputDecoration(
          hintText: 'Type your query here...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: TColors.secondary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
      ),
    );
  }
}