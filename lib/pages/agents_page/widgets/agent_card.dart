import 'package:flutter/material.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class AgentCard extends StatelessWidget {
  final Agent agent;
  const AgentCard({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;

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
          Text(
            agent.descInfo == null || agent.descInfo!.isEmpty
                ? "Sin información"
                : agent.descInfo!,
            style: CardTextStyle.secondTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
