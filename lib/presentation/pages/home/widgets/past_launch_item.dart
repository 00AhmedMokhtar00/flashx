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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Stack(
          children: [
            Container(
              height: height,
              margin: const EdgeInsets.only(top: 50.0, bottom: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.6),
                borderRadius: ApplicationStyles.borderRadius,
                image: DecorationImage(
                  image: const AssetImage("assets/3.gif"),
                  fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.35), BlendMode.darken)
                )
              ),
              child: Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(
                  right: 20,
                  bottom: 10,
                ),
                child: Text(
                  launch.name,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.85,-1.0),
              child: Hero(
                tag: launch.id,
                child: Opacity(
                  opacity: 0.7,
                  child: Card(
                    elevation: 9.0,
                    color: Colors.transparent,
                    child: Image.network(
                      launch.smallImage,
                      //width: width * 0.28,
                      height: height * 0.8,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}