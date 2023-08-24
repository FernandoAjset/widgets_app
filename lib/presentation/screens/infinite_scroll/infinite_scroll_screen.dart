import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final _infititeScrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _infititeScrollController.addListener(() {
      if ((_infititeScrollController.position.pixels + 500) >=
          _infititeScrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _infititeScrollController.dispose();
    super.dispose();
  }

  void addFiveImages() {
    for (var i = 0; i < 5; i++) {
      imagesIds.add(imagesIds.last + 1);
    }
  }

  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    if (!mounted) return;
    setState(() {});

    await Future.delayed(const Duration(seconds: 1));
    addFiveImages();
    isLoading = false;

    if (!mounted) return;
    setState(() {});

    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    if (_infititeScrollController.position.pixels + 100 <=
        _infititeScrollController.position.maxScrollExtent) return;

    _infititeScrollController.animateTo(
        _infititeScrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: _ScrollPagesView(
            infititeScrollController: _infititeScrollController,
            imagesIds: imagesIds,
            addFiveImagesCallback: loadNextPage, // Añade esta línea
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_outlined))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}

class _ScrollPagesView extends StatefulWidget {
  const _ScrollPagesView({
    required ScrollController infititeScrollController,
    required this.imagesIds,
    required this.addFiveImagesCallback,
  }) : _infititeScrollController = infititeScrollController;

  final ScrollController _infititeScrollController;
  final List<int> imagesIds;
  final VoidCallback addFiveImagesCallback;

  @override
  State<_ScrollPagesView> createState() => _ScrollPagesViewState();
}

class _ScrollPagesViewState extends State<_ScrollPagesView> {
  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh() async {
      await Future.delayed(const Duration(seconds: 2));
      final lastId = widget.imagesIds.last;
      widget.imagesIds.clear();
      widget.imagesIds.add(lastId + 1);
      widget.addFiveImagesCallback();
    }

    return RefreshIndicator(
      edgeOffset: 20,
      strokeWidth: 2,
      onRefresh: onRefresh,
      child: ListView.builder(
        controller: widget._infititeScrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.imagesIds.length,
        itemBuilder: (context, index) {
          return FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
              placeholder: const AssetImage('assets/Images/jar-loading.gif'),
              image: NetworkImage(
                  'https://picsum.photos/id/${widget.imagesIds[index]}/500/300'));
        },
      ),
    );
  }
}
