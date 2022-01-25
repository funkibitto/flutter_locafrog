import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/constants/global_constants.dart';
import 'package:flutter_locafrog/app/modules/common/widgets/app_bar_widget.dart';
import 'package:flutter_locafrog/app/modules/common/painter/heart_painter.dart';
import 'package:flutter_locafrog/app/modules/common/widgets/indicator_init_widget.dart';
import 'package:flutter_locafrog/app/modules/shopping/widgets/shopping_banner_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_locafrog/app/modules/shopping/controllers/shopping_controller.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({Key? key}) : super(key: key);

  @override
  _ShoppingViewState createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  late ShoppingController controller;

  Widget _body() {
    return RefreshIndicator(
      onRefresh: () async => {},
      edgeOffset: 100.0,
      child: CustomScrollView(
        key: const PageStorageKey('ShoppingList'),
        primary: true,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          const AppBarWidget(),
          _list(),
        ],
      ),
    );
  }

  Widget _list() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          List _items = controller.curations.value.section;
          return ShoppingBannerWidget();
        },
        childCount: controller.curations.value.section.length,
      ),
    );
  }

  @override
  void initState() {
    controller = Get.find<ShoppingController>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(
                100,
                (100 * 1)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: HeartPainter(),
          ),

          Positioned(
            top: 100,
            child: CustomPaint(
              size: Size(
                  100,
                  (100 * 1)
                      .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter2(),
            ),
          ),
          // _body(),
          // init loading
          if (controller.loadingEuum.value == ListLoading.init) ...[
            const IndicatorInitWidget()
          ],
        ],
      ),
    );
  }
}
