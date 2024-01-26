import 'package:flutter/material.dart';

class BannerItem extends StatefulWidget {
  BannerItem({
    super.key,
    required this.banner,
  });
  final String banner;

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: 200,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              "assets/images/${widget.banner}",
              height: 200,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
