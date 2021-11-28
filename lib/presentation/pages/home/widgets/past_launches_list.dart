part of 'widgets.dart';

class PastLaunchesList extends StatelessWidget {
  final GlobalKey<SliverAnimatedListState> _listKey = GlobalKey<SliverAnimatedListState>();
  PastLaunchesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PastLaunchesBloc, PastLaunchesState>(
      builder: (context, state) {
        if(state is PastLaunchesLoading){
          return const SliverToBoxAdapter(child: Center(child: ApplicationLoader.colorApplicationLoader));
        }else if(state is PastLaunchesLoadedSuccessfully) {
          return SliverAnimatedList(
              key: _listKey,
              initialItemCount: state.pastLaunches.length,
              itemBuilder: (context, index, animation) {
                return PastLaunchItem(
                  launch: state.pastLaunches[index],
                  onTap: (){},
                );
              }
          );
        }else if(state is PastLaunchesLoadedFailure){
          return const SliverToBoxAdapter(child: Center(child: Text("Failed!!")));
        }else{
          return const SliverToBoxAdapter(child: Center(child: Text("UNDEFINED STATE!")));
        }
      }
    );
  }
}
