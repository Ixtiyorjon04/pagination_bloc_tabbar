import 'package:bottom_menu/core/api/pagination_api.dart';
import 'package:bottom_menu/pages/home/home_page.dart';
import 'package:bottom_menu/pages/home/tabs/karzinka/bloc/karzinka_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class KorzinkaPage extends StatefulWidget {
  const KorzinkaPage({Key? key}) : super(key: key);

  @override
  State<KorzinkaPage> createState() => _KorzinkaPageState();
}

class _KorzinkaPageState extends State<KorzinkaPage> {
  final bloc = KarzinkaBloc(PaginationApi());
  final controller = RefreshController();

  @override
  void initState() {
    bloc.add(KarzinkaInitEvent());
    // print("initState: Texnomart");
    // context.read<HomeProvider>().addListener(() {
    //   // if(context.read<HomeProvider>().index==0){
    //   //
    //   // }
    //   print("Texnomart: ${context.read<HomeProvider>().index}");
    // });
    super.initState();
  }

  @override
  void dispose() {
    print("dispose: Texnomart");
    bloc.close();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocListener<KarzinkaBloc, KarzinkaState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            controller.refreshCompleted();
            controller.loadComplete();
          }
        },
        child: BlocBuilder<KarzinkaBloc, KarzinkaState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.orange,
                title: Text("${state.status}"),
              ),
              body: Builder(builder: (context) {
                if (state.status == Status.loading && state.list.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SmartRefresher(
                  controller: controller,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: () {
                    bloc.add(KarzinkaInitEvent());
                  },
                  onLoading: () {
                    bloc.add(KarzinkaNextEvent());
                  },
                  child:
                  // GridView.builder(gridDelegate: S, itemBuilder: itemBuilder)
                  ListView.separated(
                    itemCount: state.list.length,
                    separatorBuilder: (_, i) => const SizedBox(height: 12),
                    itemBuilder: (_, i) {
                      final model = state.list[i];
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "${i + 1}. ${model.name}",
                          style: const TextStyle(fontSize: 32),
                        ),
                      );
                    },
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
