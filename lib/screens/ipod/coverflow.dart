import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';

class CoverFlow extends StatefulWidget {
  CoverFlow({Key? key}) : super(key: key);
  @override
  _CoverFlowState createState() => _CoverFlowState();
}

class _CoverFlowState extends State<CoverFlow> {
  final PageController _pageCtrl = PageController(viewportFraction: 0.6);

  double currentPage = 0.0;

  @override
  void initState() {
    _pageCtrl.addListener(() async {
      setState(() {
        currentPage = _pageCtrl.page!;
      });
      if (currentPage - 2 == context.read(currentOffsetProvider)) {
        int newOffset = context.read(currentOffsetProvider) + 10;
        context.read(currentOffsetProvider.notifier).updateOffset(newOffset);
        await context.refresh(albumRequestFutureProvider);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.black,
            child: Consumer(
              builder: (context, watch, _) {
                var albumRequestFuture = watch(albumRequestFutureProvider);
                return albumRequestFuture.when(
                  data: (data) {
                    if (data is AlbumRequestError) {
                      return Center(
                        child: Text('${data.errorMessage}'),
                      );
                    } else if (data is AlbumRequestSuccess) {
                      AlbumRequestSuccess albumRequestSuccess = data;
                      return PageView.builder(
                        controller: _pageCtrl,
                        scrollDirection: Axis.horizontal,
                        itemCount: albumRequestSuccess.items.length,
                        itemBuilder: (context, int index) {
                          return AlbumCard(
                            album: albumRequestSuccess.items[index].album,
                            idx: index,
                            currentPage: currentPage,
                          );
                        },
                      );
                    } else {
                      return Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                  },
                  loading: () =>
                      Center(child: CircularProgressIndicator.adaptive()),
                  error: (error, _) => Center(
                    child: Text('$error'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
