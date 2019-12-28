import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

class WebsiteImageProvider extends StatefulWidget {
  final WidgetBuilder builder;

  const WebsiteImageProvider({
    Key key,
    @required this.builder,
  }) : super(key: key);

  @override
  _WebsiteImageProviderState createState() => _WebsiteImageProviderState();

  static _WebsiteImageProviderState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_ImageInheritedWidget>())
        .state;
  }
}

class _WebsiteImageProviderState extends State<WebsiteImageProvider> {
  bool _loaded = false;

  AssetImage _de, _gb, _profile;

  AssetImage get de => _de;

  AssetImage get gb => _gb;

  AssetImage get profile => _profile;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _init();
  }

  void _init() async {
    if (_de == null) {
      _de = await _load('assets/img/de.png');
    }
    if (_gb == null) {
      _gb = await _load('assets/img/gb.png');
    }
    if (_profile == null) {
      _profile = await _load('assets/img/4x6.jpg');
    }
    if (mounted) {
      setState(() {
        _loaded = true;
      });
    }
  }

  Future<AssetImage> _load(String path) async {
    Completer<ui.Image> completer = Completer<ui.Image>();
    AssetImage provider = AssetImage(path);
    provider.resolve(ImageConfiguration()).addListener(
        ImageStreamListener((info, _) => completer.complete(info.image)));
    await completer.future;
    return provider;
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return Container();
    }
    return _ImageInheritedWidget(
      child: widget.builder(context),
      state: this,
    );
  }
}

class _ImageInheritedWidget extends InheritedWidget {
  final _WebsiteImageProviderState state;

  const _ImageInheritedWidget({
    Key key,
    @required Widget child,
    @required this.state,
  })  : assert(child != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_ImageInheritedWidget old) {
    return true;
  }
}
