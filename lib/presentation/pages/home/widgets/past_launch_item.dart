part of 'widgets.dart';


class PastLaunchItem extends StatelessWidget {
  final Launch launch;
  final VoidCallback onTap;

  const PastLaunchItem({
    Key? key,
    required this.launch,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = ApplicationScreenSize.heightOf(context) * 0.18;
    double width = ApplicationScreenSize.widthOf(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 1.37,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50.0, bottom: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.6),
                borderRadius: ApplicationStyles.borderRadius,
                image: DecorationImage(
                  image: const AssetImage(PresentationAssetPath.BACKGROUND3_GIF),
                  fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Helpers.generateRandomColor, BlendMode.color)
                )
              ),
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                    borderRadius: ApplicationStyles.borderRadius,
                    color: Colors.black.withOpacity(0.4)
                ),
                // margin: const EdgeInsets.only(
                //   right: 20,
                //   bottom: 10,
                // ),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
                    child: Text(
                      launch.name,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.83),
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.9,-1.0),
              child: Column(
                children: [
                  if(launch.smallImage.isNotEmpty || launch.largeImage.isNotEmpty)
                    Hero(
                    tag: launch.id,
                    child: Opacity(
                      opacity: 0.7,
                      child: Image.network(
                        launch.smallImage.isNotEmpty?launch.smallImage:launch.largeImage,
                        height: height * 0.8,
                      )
                    ),
                  ),

                  Text(DateFormat("dd MMM, yyyy").format(
                      DateTime.fromMillisecondsSinceEpoch(launch.date)),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.83),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 2.0
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0.92, -0.45),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: launch.success?Colors.green.withOpacity(0.75):Colors.red.withOpacity(0.75),
              ),
            ),
            Container(
              width: width,
              padding: EdgeInsets.only(left: width * 0.37, right: 4.0),
              alignment: Alignment.center,
              child: Text(launch.details.length < 80? launch.details : launch.details.substring(0, 80) + "...",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  //height: 2.0
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}