import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';


class PlatformNativeWidget extends StatefulWidget {

  PlatformNativeWidget(this.placementID,this.extraMap,{this.sceneID, this.isAdaptiveHeight=false});

  final String placementID;

  final Map extraMap;

  final String? sceneID;

  final bool? isAdaptiveHeight;

  @override
  _PlatformNativeWidgetState createState() => _PlatformNativeWidgetState();
}

class _PlatformNativeWidgetState extends State<PlatformNativeWidget> {
  @override
  Widget build(BuildContext context) {

    if (defaultTargetPlatform == TargetPlatform.android) {

      return AndroidView(
        key: UniqueKey(),
        viewType: 'at_native_platform_view',
        creationParams: <String, dynamic>{
          "placementID": widget.placementID,
          "sceneID": widget.sceneID,
          "extraMap" : widget.extraMap,
          "isAdaptiveHeight" : widget.isAdaptiveHeight,
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        key: UniqueKey(),
        viewType: "at_native_platform_view",
        creationParams: <String, dynamic>{
          "placementID": widget.placementID,
          "sceneID": widget.sceneID,
          "extraMap" : widget.extraMap,
          "isAdaptiveHeight" : widget.isAdaptiveHeight,
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    else {
      return Text("Unsupported platform");
    }
  }
}


