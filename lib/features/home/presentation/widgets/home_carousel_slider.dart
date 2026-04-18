
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/widgets/center_progress_indicator.dart';
import '../providers/home_slider_provider.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {

  ValueNotifier<int> _selectedPage = ValueNotifier(0);




  @override
  Widget build(BuildContext context) {
    return Consumer<HomeSliderProvider>(
      builder: (context, homeSliderProvider, _) {
        if(homeSliderProvider.getHomeSliderInProgress){
          return SizedBox(
              height: 210,
              child: const CenterProgressIndicator());
        }
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 200.0,
                viewportFraction: 1,
                onPageChanged: (index, reason) => _selectedPage.value = index,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),

              ),
              items: homeSliderProvider.homeSliders.map((slider) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(slider.photoUrl),
                                fit: BoxFit.cover
                            )

                        ),
                        alignment: Alignment.center,
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8,),
            ValueListenableBuilder(
              valueListenable: _selectedPage,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                   for(int i = 0; i < 5; i++)
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: value == i ? AppColors.themeColor : Colors.transparent,
                        border: Border.all(color: value == i ? AppColors.themeColor : Colors.grey)
                      ),
                    )
                  ],
                );
              }
            )
          ],
        );
      }
    );
  }
}
