import 'package:flutter/material.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class AgentInProductCard extends StatelessWidget {
  final Agent agent;
  const AgentInProductCard({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    final List<String> grupos = [
      "G1",
      "G2A",
      "G2B",
      "G3",
    ];

    // double alto = MediaQuery.of(context).size.height;
    // double ancho = MediaQuery.of(context).size.width;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        child: Text(grupos[agent.group - 1]),
      ),
      title: Text(
        agent.agent,
        style: CardTextStyle.mainTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        agent.descInfo == null || agent.descInfo!.isEmpty
            ? "Sin información"
            : agent.descInfo!,
        style: CardTextStyle.secondTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}
