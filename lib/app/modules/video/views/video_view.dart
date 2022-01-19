import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/data/models/video/video_model.dart';
import 'package:flutter_locafrog/app/modules/auth/services/auth_service.dart';
import 'package:flutter_locafrog/app/modules/video/controllers/video_controller.dart';
import 'package:flutter_locafrog/app/modules/video/widgets/video_item_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoController controller;
  late ScrollController scrollController;

  bool isScrolling = false;
  String message = "";

  @override
  void initState() {
    controller = Get.put<VideoController>(VideoController());
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      isScrolling = true;
      message = "Scroll Update";
    });
  }

  void _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      isScrolling = true;
      message = "Scroll Update";
    });
  }

  void _onEndScroll(ScrollMetrics metrics) {
    setState(() {
      isScrolling = false;
      message = "Scroll End";
    });
  }

  SliverAppBar _appBar() {
    return SliverAppBar(
      floating: true,
      leading: const Padding(
        padding: EdgeInsets.only(top: 15, left: 20),
        child: FaIcon(FontAwesomeIcons.chessQueen),
      ),
      titleSpacing: 0.0,
      title: const Text('Locafrog'),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Get.toNamed('/login');
          },
        ),
        IconButton(
          icon: const Icon(Icons.access_alarm_sharp),
          onPressed: () {
            Get.toNamed('/login');
          },
        ),
        if (AuthService.to.isLoggedIn.isTrue) ...[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Get.toNamed('/setting');
            },
          )
        ],
      ],
    );
  }

  Widget _list() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          List<VideoModel> _items = controller.videoList.value.items;
          if (index >= _items.length - 1) {
            if (controller.loadingEuum.value == ListLoading.scroll) {
              controller.getVideoList();
            }
          }
          return VideoItemWidget(
              id: '$index', video: _items[index], isScrolling: isScrolling);
        },
        childCount: controller.videoList.value.itemsLength,
      ),
    );
  }

  Widget _infinityIndicator() {
    return const SliverToBoxAdapter(
        child: SizedBox(
      height: 200,
      child: Center(
        child: SpinKitWave(color: Colors.white, size: 20.0),
      ),
    ));
  }

  Widget _body() {
    IsInViewPortCondition condition =
        (double deltaTop, double deltaBottom, double vpHeight) {
      return deltaTop < (0.5 * vpHeight) && deltaBottom > (0.5 * vpHeight);
    };

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollStartNotification) {
          _onStartScroll(scrollNotification.metrics);
        } else if (scrollNotification is ScrollUpdateNotification) {
          _onUpdateScroll(scrollNotification.metrics);
        } else if (scrollNotification is ScrollEndNotification) {
          _onEndScroll(scrollNotification.metrics);
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () async => {
          if (controller.loadingEuum.value != ListLoading.reload)
            {await controller.getVideoList(isReload: true)}
        },
        edgeOffset: 100.0,
        child: InViewNotifierCustomScrollView(
          controller: scrollController,
          throttleDuration: const Duration(milliseconds: 2000),
          isInViewPortCondition: condition,
          initialInViewIds: const ['0'],
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            _appBar(),
            _list(),
            if (controller.loadingEuum.value == ListLoading.scroll) ...[
              _infinityIndicator()
            ],
          ],
        ),
      ),
    );
  }

  Widget _initIndicator() {
    return const Align(
      alignment: Alignment.center,
      child: SpinKitFadingFour(color: Colors.white, size: 50.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: <Widget>[
          _body(),
          // init loading
          if (controller.loadingEuum.value == ListLoading.init) ...[
            _initIndicator()
          ],
        ],
      ),
    );
  }
}
