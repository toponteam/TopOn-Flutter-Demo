
import 'dart:ui';

final topSizeTool = TopSize();


class TopSize{

  double getWidth(){

    var dpr = window.devicePixelRatio;
    var  physicalWith = window.physicalSize.width;
    return physicalWith / dpr;
  }


  double getHeight(){

    var dpr = window.devicePixelRatio;
    var  physicalWith = window.physicalSize.height;
    return physicalWith / dpr;
  }


}