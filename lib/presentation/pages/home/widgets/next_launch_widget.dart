part of 'widgets.dart';

class NextLaunchWidget extends StatelessWidget {
  const NextLaunchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Center(
          child: Image.asset(
              PresentationAssetPath.LOGO,
              width: ApplicationScreenSize.widthOf(context) * 0.4
          )
      ),
      pinned: true,
      stretch: true,
      forceElevated: true,
      elevation: 4.0,
      expandedHeight: ApplicationScreenSize.heightOf(context) * 0.8,
      backgroundColor: ApplicationTheme.currentTheme.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
        background: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              )
          ),
          child: BlocBuilder<NextLaunchBloc, NextLaunchState>(
              builder: (context, state) {
                if(state is NextLaunchLoading){
                  return const Center(child: ApplicationLoader.colorApplicationLoader);
                }else if(state is NextLaunchLoadedSuccessfully){
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          PresentationAssetPath.BACKGROUND2_GIF,
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(0.6),
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.0, -0.4),
                        child: Opacity(
                          opacity: 0.7,
                          child: CachedNetworkImage(
                            imageUrl: state.nextLaunch.largeImage,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.0, 0.82),
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
                              GestureDetector(
                                onTap: () => Helpers.launchURL(state.nextLaunch.wiki),
                                child: CircleAvatar(
                                  backgroundColor: ApplicationTheme.currentTheme.primaryColor,
                                  child: Icon(
                                    Icons.article_outlined,
                                    color: ApplicationTheme.currentTheme.colorScheme.secondary,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(-0.035,0.47),
                        child: CountdownTimer(
                          endTime: state.nextLaunch.date,
                          textStyle: TextStyle(
                              fontSize: ApplicationFont.pageTitleSize,
                              color: ApplicationTheme.currentTheme.colorScheme.secondary
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

      ),
      bottom: const PastLaunchesHeader(),
    );
  }
}
