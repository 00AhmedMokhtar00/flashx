part of 'widgets.dart';

class PastLaunchesList extends StatelessWidget {
  final GlobalKey<SliverAnimatedListState> _listKey = GlobalKey<SliverAnimatedListState>();
  final GlobalKey<SliverAnimatedListState> _filteredListKey = GlobalKey<SliverAnimatedListState>();
  PastLaunchesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PastLaunchesCubit, PastLaunchesState>(
      builder: (context, state) {
        print("FILTERED: " + (state.filteredPastLaunches == null?"null":"not null"));
        if(state.loading ?? false){
          return const SliverToBoxAdapter(child: Center(child: ApplicationLoader.colorApplicationLoader));
        }
        else if(state.pastLaunches != null && state.filteredPastLaunches == null) {
          return SliverAnimatedList(
              key: _listKey,
              initialItemCount: state.pastLaunches!.length,
              itemBuilder: (context, index, animation) {
                return PastLaunchItem(
                  launch: state.pastLaunches![index],
                  onTap: () => _pastLaunchItemTapped(context, state.pastLaunches![index]),
                );
              }
          );
        }
        else if(state.filteredPastLaunches != null) {
          return SliverAnimatedList(
              key: _filteredListKey,
              initialItemCount: state.filteredPastLaunches!.length,
              itemBuilder: (context, index, animation) {
                return PastLaunchItem(
                  launch: state.filteredPastLaunches![index],
                  onTap: () => _pastLaunchItemTapped(context, state.filteredPastLaunches![index]),
                );
              }
          );
        }
        else if(state.errorMessage != null){
          return SliverToBoxAdapter(child: Center(child: Text("Failed!! " + state.errorMessage!)));
        }
        else{
          return const SliverToBoxAdapter(child: Center(child: Text("UNDEFINED STATE!")));
        }
      }
    );
  }

  _pastLaunchItemTapped(context, launch){
    BlocProvider.of<RocketBloc>(context).add(RocketCalled(launch.rocketId));
    BlocProvider.of<LaunchPadBloc>(context).add(LaunchPadCalled(launch.launchpadId));
    Navigator.pushNamed(context, LaunchDetails.routeName, arguments: launch);
  }
}
