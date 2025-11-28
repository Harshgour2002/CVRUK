import 'dart:async';

import 'package:flutter/material.dart';

class AutoScrollImageList extends StatefulWidget {
  final List<String> images;

  const AutoScrollImageList({super.key, required this.images});

  @override
  State<AutoScrollImageList> createState() => _AutoScrollImageListState();
}

class _AutoScrollImageListState extends State<AutoScrollImageList> {
  final ScrollController _controller = ScrollController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(milliseconds: 40), (_) {
      if (_controller.hasClients) {
        double maxScroll = _controller.position.maxScrollExtent;
        double current = _controller.offset;

        if (current >= maxScroll) {
          _controller.jumpTo(0); // loop again
        } else {
          _controller.jumpTo(current + 1.2);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemCount: widget.images.length,
        separatorBuilder: (_, __) => const SizedBox(width: 18),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              widget.images[index],
              width: 100,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
