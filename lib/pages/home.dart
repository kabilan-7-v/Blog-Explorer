import 'package:blog_explorer/blocs/app_bloc.dart';
import 'package:blog_explorer/blocs/app_events.dart';
import 'package:blog_explorer/blocs/app_state.dart';
import 'package:blog_explorer/models/blogdetails.dart';
import 'package:blog_explorer/server/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(RepositoryProvider.of<UserRespository>(context))
            ..add(LoadUserEvent()),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          // leading: const Icon(
          //   Icons.menu,
          //   color: Colors.white,
          // ),
          title: const Text(
            "Blog and Activites",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Icon(
              Icons.search,
              color: Colors.white,
              size: 35,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [],
          ),
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, State) {
          if (State is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (State is UserLoadedState) {
            List<UserModel> userlist = State.user;

            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: userlist.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return customblogs(context, userlist[index].Imgurl,
                          userlist[index].tittle);
                    },
                  )
                ],
              ),
            );
          }
          if (State is UserErrorstate) {
            return const Center(
              child: Text("Error"),
            );
          }
          return Container();
        }),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              // fetchBlogs();
            }),
      ),
    );
  }

  customblogs(BuildContext context, imgurl, String text) {
    return Column(
      children: [
        Container(
            // margin: const EdgeInsets.all(10),
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imgurl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Center(
              child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
