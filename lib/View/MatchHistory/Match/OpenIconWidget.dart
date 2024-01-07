import 'package:app/Style/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OpenIconWidget extends StatefulWidget {
  const OpenIconWidget({super.key, this.onOpenAction , this.onClosedAction, required this.duration});

  @override
  _OpenIconWidgetState createState() => _OpenIconWidgetState();

  final Function? onOpenAction;
  final Function? onClosedAction;
  final Duration duration;

}

class _OpenIconWidgetState extends State<OpenIconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isRotated = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 180,
    ).animate(_controller);

    _animation.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      constraints: BoxConstraints(),
      icon: Transform.rotate(
        angle: _animation.value * 3.14159265359 / 180,
        child: Image.asset(
          Images.down,
          width: 12.sp,
          height: 12.sp,
        ),
      ),
      onPressed: (){
        if(_isRotated){
          if(widget.onClosedAction != null){
            widget.onClosedAction!();
          }
        }
        else{
          if(widget.onOpenAction != null){
            widget.onOpenAction!();
          }
        }
        _toggleRotation();
      }
    );
  }

  void _toggleRotation() {
    if (_isRotated) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isRotated = !_isRotated;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}