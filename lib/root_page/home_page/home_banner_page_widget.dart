import 'package:demo2_eye/bean/home_body_bean.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:demo2_eye/utils/util.dart';

/**
 *
 * @ProjectName: flutter_open_eye
 * @Package: root_page.home_page
 * @ClassName: home_banner_page_widget
 * @Description: java类作用描述
 * @Author: liys
 * @CreateDate: 2021/11/16 11:42
 * @UpdateUser: 更新者
 * @UpdateDate: 2021/11/16 11:42
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
class HomeBannerPageWidget extends StatelessWidget {
  late List<ItemList> bannerList;

  HomeBannerPageWidget({Key? key, required this.bannerList }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 180,
        child: Swiper(
          itemBuilder: (BuildContext context, int index){
            return Container(
              // decoration:装饰,设置子控件的背景颜色、形状等
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  // 网络获取图片 只有这样才能设置圆角
                  image: cachedNetworkImageProvider(bannerList[index].data!.cover!.feed!),
                  fit: BoxFit.cover
                )
              ),
            );
          },
          itemCount: bannerList.length,
          autoplay: true,
          // 指示器样式
          pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            builder: DotSwiperPaginationBuilder(
              size: 8,
              activeSize: 8,
              activeColor: Colors.white,
              color: Colors.white24
            )
          ),
          onTap: (index){
            print('onTap banner: $index');
            Navigator.push(context, router(
              widget:
            ));
          },
        ),
      ),
    );
  }
}
