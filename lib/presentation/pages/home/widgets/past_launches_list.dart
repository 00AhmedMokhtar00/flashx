part of 'widgets.dart';

class PastLaunchesList extends StatelessWidget {
  final GlobalKey<SliverAnimatedListState> _listKey = GlobalKey<SliverAnimatedListState>();
  PastLaunchesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PastLaunchesBloc, PastLaunchesState>(
      builder: (context, state) {
        if(state is PastLaunchesLoading){
          return const Center(child: ApplicationLoader.colorApplicationLoader);
        }else if(state is PastLaunchesLoadedSuccessfully) {
          return SliverAnimatedList(
              key: _listKey,
              initialItemCount: state.pastLaunches.length,
              itemBuilder: (context, index, animation) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                  leading: Image.network(
                    state.pastLaunches[index].smallImage,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    state.pastLaunches[index].name,
                    style: const TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  trailing: IconButton(
                    onPressed: () => null,
                    icon: const Icon(
                      Icons.airplay_sharp,
                      color: Colors.pinkAccent,
                    ),
                  ),
                );
              }
          );
        }else if(state is PastLaunchesLoadedFailure){
          return const Center(child: Text("Failed!!"));
        }else{
          return const Center(child: Text("UNDEFINED STATE!"));
        }
      }
    );
  }
}
