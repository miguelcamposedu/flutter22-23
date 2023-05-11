// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SeatListItem extends StatefulWidget {
  String seatState = 'available';

  SeatListItem({
    Key? key,
    required this.seatState,
  }) : super(key: key);

  @override
  State<SeatListItem> createState() => _SeatListItemState();
}

class _SeatListItemState extends State<SeatListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.seatState == 'available') {
            widget.seatState = 'selected';
          } else if (widget.seatState == 'reserved') {
            // Este asiento ya ha sido comprado por otro usuario
          } else {
            widget.seatState = 'available';
          }
        });
      },
      child: Container(
        color: _getColor(),
        child: const SizedBox(height: 100, width: 100, child: Text('')),
      ),
    );
  }

  _getColor() {
    if (widget.seatState == 'available') {
      return Colors.yellow;
    } else if (widget.seatState == 'reserved') {
      return Colors.grey;
    } else {
      return Colors.green;
    }
  }
}
