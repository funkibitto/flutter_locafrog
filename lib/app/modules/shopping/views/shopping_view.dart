import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/core/global_constants.dart';
import 'package:flutter_locafrog/app/modules/common/widgets/app_bar_widget.dart';
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
          _body(),
          // init loading
          if (controller.loadingEuum.value == ListLoading.init) ...[
            const IndicatorInitWidget()
          ],
        ],
      ),
    );
  }
}
