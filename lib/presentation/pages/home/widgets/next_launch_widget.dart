part of 'widgets.dart';

class NextLaunchWidget extends StatelessWidget {
  const NextLaunchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: Center(child: Image.asset(PresentationAssetPath.LOGO, width: ApplicationScreenSize.widthOf(context) * 0.4)),
      stretch: true,
      forceElevated: true,
      elevation: 4.0,
      expandedHeight: ApplicationScreenSize.heightOf(context) * 0.8,
      backgroundColor: ApplicationTheme.currentTheme.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
        background: BlocBuilder<NextLaunchBloc, NextLaunchState>(
            builder: (context, state) {
              if(state is NextLaunchLoading){
                return const Center(child: ApplicationLoader.colorApplicationLoader);
              }else if(state is NextLaunchLoadedSuccessfully){
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        state.nextLaunch.largeImage,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.nextLaunch.name,
                              style: Theme.of(context).textTheme.headline4!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.pinkAccent,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }else if(state is NextLaunchLoadedFailure){
                return const Center(child: Text("Failed!!"));
              }else{
                return const Center(child: Text("UNDEFINED STATE!"));
              }
            }
        ),
      ),
    );
  }
}
