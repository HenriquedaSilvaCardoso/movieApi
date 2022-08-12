import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Map<String, Color?> getProgressColor(double value) {
  if (value >= 7) {
    return {
      'primaryColor': const Color.fromARGB(255, 33, 208, 122),
      'secondaryColor': const Color.fromARGB(255, 32, 69, 41)
    };
  } else if (value >= 4) {
    return {
      'primaryColor': const Color.fromARGB(255, 210, 213, 49),
      'secondaryColor': const Color.fromARGB(255, 66, 61, 15)
    };
  } else if (value >= 0) {
    return {
      'primaryColor': const Color.fromARGB(255, 219, 35, 96),
      'secondarycolor': const Color.fromARGB(255, 87, 20, 53)
    };
  }

  return {
    'primaryColor': const Color.fromARGB(255, 98, 99, 99),
    'secondaryColor': const Color.fromARGB(255, 98, 99, 99),
  };
}

String formatDate(String date) {
  DateTime? dateRelease = DateTime.tryParse(date);
  if (dateRelease != null) {
    String data = DateFormat.yMMMd('pt_BR').format(dateRelease);
    return (int.parse(data.substring(0, 2).trim()) < 10 ? '0$data' : data);
  } else {
    return 'Data desconhecida';
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class StaggeredAnimation extends StatelessWidget {
  final Animation<double> animationMain;
  final Animation<double> animationCircleProgress;
  final double finalCircleProgress;
  final Map<String, Color?> colorMap;

  StaggeredAnimation({
    super.key,
    required this.animationMain,
    required this.finalCircleProgress,
    required this.colorMap,
  }) : animationCircleProgress = Tween<double>(
          begin: 0.0,
          end: finalCircleProgress,
        ).animate(
          CurvedAnimation(
            parent: animationMain,
            curve: const Interval(
              0.0,
              1.0,
              curve: Curves.ease,
            ),
          ),
        );

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return CircularProgressIndicator(
      strokeWidth: 2,
      value: animationCircleProgress.value,
      color: colorMap['primaryColor'],
      backgroundColor: colorMap['secondaryColor'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: animationMain,
    );
  }
}
