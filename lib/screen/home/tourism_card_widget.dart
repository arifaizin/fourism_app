import 'package:flutter/widgets.dart';
import '../../model/tourism.dart';

class TourismCard extends StatefulWidget {
  const TourismCard({
    super.key,
    required this.tourism,
  });

  final Tourism tourism;

  @override
  State<TourismCard> createState() => _TourismCardState();
}

class _TourismCardState extends State<TourismCard> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onDetach: () => debugPrint('app-detached'),
      onInactive: () => debugPrint('app-inactive'),
      onPause: () => debugPrint('app-paused'),
      onResume: () => debugPrint('app-resumed'),
      onRestart: () => debugPrint('app-restarted'),
      onShow: () => debugPrint("app-showed"),
      onHide: () => debugPrint("app-hide"),
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.tourism.name,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            widget.tourism.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}