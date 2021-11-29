import 'package:flashx/presentation/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnimatedFab extends StatefulWidget {
  const AnimatedFab({Key? key}) : super(key: key);

  @override
  _AnimatedFabState createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab> with SingleTickerProviderStateMixin{
  String fd1 = "", fd2 = "";
  bool centered = false;
  final double expandedWidth = 230.0;
  final double hiddenWidth = 22.0;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500)
    );
    _colorAnimation = ColorTween(
        begin: Colors.black87,
        end: Colors.black
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: expandedWidth,
        //height: expandedSize,
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Stack(
                alignment: centered? Alignment.center : Alignment.centerRight,
                children: <Widget>[
                  _buildExpandedBackground(),
                  _buildFabCore(),
                ],
              );
            }));
  }

  Widget _buildFabCore() {
    double scaleFactor = 2 * (_animationController.value - 0.5).abs();
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: centered?Border.all(color: Colors.white60):null,
          shape: BoxShape.circle,
        color: _colorAnimation.value
      ),
      child: InkWell(
        onTap: _onFabTap,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(1.0, scaleFactor),
          child: Icon(
            _animationController.value > 0.5 ? Icons.close : Icons.filter_list,
            color: Colors.white,
            size: 28.0,
          ),
        ),
      ),
    );
  }

  open() {
    if (_animationController.isDismissed) {
      _animationController.forward();
      setState(() {
        centered = true;
      });
    }
  }

  close() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
      setState(() {
        centered = false;
        fd1 = "";
        fd2 = "";
      });
    }
  }

  _onFabTap() {
    if (_animationController.isDismissed) {
      open();
    } else {
      close();
    }
  }

  Widget _buildExpandedBackground() {
    double size = hiddenWidth + (expandedWidth - hiddenWidth) * _animationController.value;
    return Container(
      height: 40.0,
      width: size,
      decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.black, borderRadius: ApplicationStyles.borderRadius),
      child: size > expandedWidth - hiddenWidth?
      Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: ()async{
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2006),
                      lastDate: DateTime.now());
                  if (picked != null) {
                    setState(() {
                      fd1 = DateFormat("dd MMM, yyyy").format(picked);
                    });
                  }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: double.infinity,
                alignment: fd1.isNotEmpty?Alignment.centerLeft:Alignment.center,

                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white60),
                  borderRadius: ApplicationStyles.leftBorderRadius
                ),
                child: Text(
                  fd1.isEmpty?"From":fd1,
                  style: TextStyle(
                    fontSize: fd1.isEmpty?16.0:12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
          ),

          Expanded(
            child: InkWell(
              onTap: ()async{
                final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2006),
                    lastDate: DateTime.now());
                if (picked != null) {
                  setState(() {
                    fd2 = DateFormat("dd MMM, yyyy").format(picked);
                  });
                }
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: double.infinity,
                  alignment: fd2.isNotEmpty?Alignment.centerRight:Alignment.center,

                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white60),
                      borderRadius: ApplicationStyles.rightBorderRadius
                  ),
                  child: Text(
                    fd2.isEmpty?"To":fd2,
                    style: TextStyle(
                        fontSize: fd2.isEmpty?16.0:12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
            ),
          ),
        ],
      ):null,
    );
  }
}
