import 'package:flutter/material.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class AgentCard extends StatelessWidget {
  final Agent agent;
  const AgentCard({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    // double ancho = MediaQuery.of(context).size.width;

    return SizedBox(
      height: alto * 0.08,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            agent.agent,
            style: CardTextStyle.mainTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          agent.addInfo == null
              ? const SizedBox()
              : Text(
                  agent.addInfo!,
                  style: CardTextStyle.secondTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
        ],
      ),
    );
  }
}
