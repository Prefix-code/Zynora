import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageViewer extends StatefulWidget {
  final List<String> imageUrl;

  const ImageViewer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late final PageController productImageSlider;

  @override
  void initState() {
    super.initState();
    productImageSlider = PageController();
  }

  @override
  void dispose() {
    productImageSlider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            'assets/icons/Arrow-left.svg',
            color: Colors.white,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Stack(
        children: [
          // Image slider
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: productImageSlider,
            itemCount: widget.imageUrl.length,
            itemBuilder: (context, index) {
              return SizedBox.expand(
                child: Image.asset(
                  widget.imageUrl[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),

          // Indicator
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: productImageSlider,
                count: widget.imageUrl.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.white.withOpacity(0.3),
                  activeDotColor: Colors.white,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 3,
                  spacing: 6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
