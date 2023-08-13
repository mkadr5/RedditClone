import 'package:flutter/material.dart';
import 'package:redditclone/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redditclone/model/hexcolor.dart';
import 'package:redditclone/model/post.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _blocWidget(),
    );
  }

  _blocWidget() {
    return BlocProvider(
      create: (context) => PostBloc()..add(GetPostList()),
      child: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) {
              return _buildLoading();
            } else if (state is PostLoading) {
              return _buildLoading();
            } else if (state is PostLoaded) {
              return _buildNestedScrollView(context, state.postModel);
            } else if (state is PostError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildNestedScrollView(BuildContext context, Post model) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            forceElevated: true,
            centerTitle: false,
            title: Text(
              innerBoxIsScrolled
                  ? model.data.children.first.data.subredditNamePrefixed
                  : "",
              style: Theme.of(context)
                  .primaryTextTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: !innerBoxIsScrolled
                    ? const Color.fromARGB(180, 0, 0, 0)
                    : Colors.transparent,
                child: const Icon(Icons.arrow_back),
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: innerBoxIsScrolled
                      ? const ColorFilter.mode(
                          Color.fromARGB(123, 0, 0, 0), BlendMode.colorBurn)
                      : null,
                  image: const NetworkImage(
                      "https://styles.redditmedia.com/t5_2x3q8/styles/bannerBackgroundImage_ih7a660qvyv31.png"),
                ),
              ),
            ),
          ),
        ];
      },
      body: _buildCard(context, model),
    );
  }

  Widget _buildCard(BuildContext context, Post model) {
    return RefreshIndicator(
      onRefresh: () async {
        final postBloc = context.read<PostBloc>();
        postBloc.add(GetPostList());
      },
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final children = model.data.children;
                return Card(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/78303285?s=48&v=4",
                                  ),
                                  radius: 13,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    children[index].data.author,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(fontSize: 11),
                                  ),
                                )
                              ],
                            ),
                            const Icon(Icons.more_vert),
                          ],
                        ),
                        _cardBody(context, children, index),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            children[index].data.selftext,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 9,
                                    ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.thumb_up_alt_outlined),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      children[index].data.ups.toString(),
                                    ),
                                  ),
                                  const Icon(Icons.thumb_down_alt_outlined),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.mode_comment_outlined),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(children[index]
                                        .data
                                        .numComments
                                        .toString()),
                                  ),
                                ],
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.file_upload_outlined),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: Text("Share"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: model.data.children.length,
            ),
          )
        ],
      ),
    );
  }

  Widget _cardBody(BuildContext context, List<Child> children, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            children[index].data.title,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HexColor(
              children[index].data.linkFlairBackgroundColor,
            ),
          ),
          child: Text(
            children[index].data.linkFlairText,
            style: Theme.of(context)
                .primaryTextTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 11),
          ),
        ),
        Visibility(
          visible: children[index].data.linkFlairText == "Video",
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      children[index].data.thumbnail,
                    ),
                  ),
                ),
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
