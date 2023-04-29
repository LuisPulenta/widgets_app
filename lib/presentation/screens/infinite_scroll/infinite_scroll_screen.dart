import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({Key? key}) : super(key: key);

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
//---------------------------------------------------------------
//------------------------- Variables ---------------------------
//---------------------------------------------------------------
  List<int> imagesIds = [1, 2, 3, 4, 5];
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

//---------------------------------------------------------------
//------------------------- Pantalla ----------------------------
//---------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

//---------------------------------------------------------------
//------------------------- Pantalla ----------------------------
//---------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll y Pull'),
      //   centerTitle: true,
      // ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInImage(
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: isLoading
              ? SpinPerfect(
                  infinite: true, child: const Icon(Icons.refresh_rounded))
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
          onPressed: () {
            context.pop();
          }),
    );
  }

//---------------------------------------------------------------
//------------------------- addFiveImages -----------------------
//---------------------------------------------------------------

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

//---------------------------------------------------------------
//------------------------- addFiveImages -----------------------
//---------------------------------------------------------------

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    setState(() {});
    await Future.delayed(const Duration(milliseconds: 2000));
    addFiveImages();
    isLoading = false;
    //if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

//---------------------------------------------------------------
//------------------------- onRefresh ---------------------------
//---------------------------------------------------------------

  Future onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(milliseconds: 3000));

    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    if (!isMounted) return;
    isLoading = false;
    setState(() {});
  }

//---------------------------------------------------------------
//------------------------- onRefresh ---------------------------
//---------------------------------------------------------------

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
  }
}
