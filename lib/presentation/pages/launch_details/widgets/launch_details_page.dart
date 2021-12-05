part of 'widgets.dart';

class LaunchDetailsPage extends StatelessWidget {
  final Launch launch;
  const LaunchDetailsPage({Key? key, required this.launch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget spacer = SizedBox(height: ApplicationScreenSize.heightOf(context) * 0.05);
    final Widget smallSpacer = SizedBox(height: ApplicationScreenSize.heightOf(context) * 0.02);
    return Scaffold(
      backgroundColor: ApplicationTheme.currentTheme.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          launch.name,
          style: TextStyle(
            color: Colors.white.withOpacity(0.86),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset(
              PresentationAssetPath.BACKGROUND4_GIF,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: ApplicationScreenSize.heightOf(context) * 0.12),
                Hero(
                  tag: launch.id,
                  child: Image.asset(
                    launch.largeImage.isNotEmpty?launch.largeImage:launch.smallImage,
                    height: ApplicationScreenSize.heightOf(context) * 0.26,
                  )
                ),
                spacer,
                ExpansionTile(
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  childrenPadding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 8.0
                  ),
                  title: Text(
                    "Description: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                        color: ApplicationTheme.currentTheme.colorScheme.secondary
                    ),
                  ),
                  subtitle: launch.details.length < 80?Text(
                    launch.details,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: ApplicationTheme.currentTheme.colorScheme.secondary
                    ),
                  ):null,
                  children: launch.details.length > 80?[
                    Text(
                      launch.details,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: ApplicationTheme.currentTheme.colorScheme.secondary
                      ),
                    )
                  ]:[],
                ),
                spacer,
                BlocBuilder<RocketBloc, RocketState>(
                  builder: (context, state) {
                    if(state is RocketLoadedSuccessfully){
                      return ExpansionTile(
                        collapsedIconColor: Colors.white,

                        iconColor: Colors.white,
                        childrenPadding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 8.0
                        ),
                        title: Text(
                          "Rocket: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26.0,
                              color: ApplicationTheme.currentTheme.colorScheme.secondary
                          ),
                        ),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: CachedNetworkImage(imageUrl:
                    state.rocket.images.isEmpty?PresentationAssetPath.ROCKET_PLACEHOLDER:state.rocket.images.first,
                                      width: ApplicationScreenSize.widthOf(context) * 0.6,
                                    ),
                                  ),
                                ),
                              ),
                              smallSpacer,
                              textItem("Rocket Name: ", state.rocket.name),
                              smallSpacer,
                              textItem("Rocket Description: ", state.rocket.description),
                              smallSpacer,
                              textItem("Rocket Success Rate Percentage: ", state.rocket.successRatePercentage.toString()),
                              smallSpacer,
                              textItem("Rocket Status: ", state.rocket.active?"ACTIVE":"NOT ACTIVE", state.rocket.active?true:false),
                            ],
                          )
                        ],
                      );
                    }
                    return ApplicationLoader.currentApplicationLoader;
                  }
                ),
                spacer,
                BlocBuilder<LaunchPadBloc, LaunchPadState>(
                    builder: (context, state) {
                      if(state is LaunchPadLoadedSuccessfully){
                        return ExpansionTile(
                          collapsedIconColor: Colors.white,

                          iconColor: Colors.white,
                          childrenPadding: const EdgeInsets.symmetric(
                              horizontal: 30.0,
                              vertical: 8.0
                          ),
                          title: Text(
                            "Launchpad: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26.0,
                                color: ApplicationTheme.currentTheme.colorScheme.secondary
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: CachedNetworkImage(imageUrl:
                                        state.launchPad.largeImage.isEmpty?PresentationAssetPath.ROCKET_PLACEHOLDER:state.launchPad.largeImage,
                                        width: ApplicationScreenSize.widthOf(context) * 0.6,
                                      ),
                                    ),
                                  ),
                                ),
                                smallSpacer,
                                textItem("Launchpad Name: ", state.launchPad.name),
                                smallSpacer,
                                textItem("Launchpad Description: ", state.launchPad.details),
                                smallSpacer,
                                textItem("Landing Successes: ", state.launchPad.launchSuccesses.toString()),
                                smallSpacer,
                                textItem("Rocket Status: ", state.launchPad.status),
                              ],
                            )
                          ],
                        );
                      }
                      return ApplicationLoader.currentApplicationLoader;
                    }
                ),
                spacer,
                BlocBuilder<PayloadsBloc, PayloadsState>(
                    builder: (context, state) {
                      if(state is LaunchPayloadsLoadedSuccessfully){
                        return ExpansionTile(
                          collapsedIconColor: Colors.white,

                          iconColor: Colors.white,
                          childrenPadding: const EdgeInsets.symmetric(
                              horizontal: 30.0,
                              vertical: 8.0
                          ),
                          title: Text(
                            "Payloads: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26.0,
                                color: ApplicationTheme.currentTheme.colorScheme.secondary
                            ),
                          ),
                          children: [
                            Column(
                              children: state.payloads.map((payload) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      payload.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22.0,
                                          color: ApplicationTheme.currentTheme.colorScheme.secondary
                                      ),
                                    ),
                                  ),
                                  smallSpacer,
                                  textItem("Payload Nationality: ", payload.nationalities.toString()),
                                  smallSpacer,
                                  textItem("Payload Manufacturer: ", payload.manufacturers.toString()),
                                  smallSpacer,
                                  textItem("Payload Type: ", payload.type),
                                  smallSpacer,
                                  textItem("Payload Customers: ", payload.customers.toString()),
                                  smallSpacer,
                                ],
                              )).toList(),
                            )
                          ],
                        );
                      }
                      return ApplicationLoader.currentApplicationLoader;
                    }
                ),
                spacer,
                ExpansionTile(
                  collapsedIconColor: Colors.white,

                  iconColor: Colors.white,
                  childrenPadding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 8.0
                  ),
                  title: Text(
                    "Additional Details: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                        color: ApplicationTheme.currentTheme.colorScheme.secondary
                    ),
                  ),
                  children: [
                    VideoSection(videoLink: launch.webCast)
                  ],
                ),
                spacer,

                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textItem(String title, String details, [bool? status]){
    return RichText(
      text: TextSpan(
        style: TextStyle(
            color: ApplicationTheme.currentTheme.colorScheme.secondary,
            fontSize: 18.0,
            fontWeight: FontWeight.bold
        ),
        children: <TextSpan>[
          TextSpan(text: title),
          TextSpan(text: details, style: TextStyle(fontWeight: FontWeight.normal, color: status != null?status? Colors.green:Colors.red:null)),
        ],
      ),
    );
  }
}
