import 'package:flutter/material.dart';

class AffiliatedOrganizationsBox extends StatelessWidget {
  const AffiliatedOrganizationsBox({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> affiliatedOrganizations = [
      {"name": "MPPC", "image": "assets/affiliation_images/Mppc.png"},
      {"name": "UGC", "image": "assets/affiliation_images/ugc.png"},
      {"name": "AICTE", "image": "assets/affiliation_images/aicte.png"},
      {"name": "AIU", "image": "assets/affiliation_images/AIU.png"},
      {"name": "NCTE", "image": "assets/affiliation_images/ncte.png"},
      {"name": "ACU", "image": "assets/affiliation_images/acu.png"},
      {"name": "PCI", "image": "assets/affiliation_images/PCI.png"}
    ];

    final theme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 5),

      decoration: BoxDecoration(
        color: theme.surface,                     // 👈 auto light/dark
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,            // 👈 subtle border
        ),
      ),

      child: SizedBox(
        height: 110,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: affiliatedOrganizations.length,
          separatorBuilder: (context, index) => const SizedBox(width: 18),
          itemBuilder: (context, index) {
            return _OrgCard(org: affiliatedOrganizations[index]);
          },
        ),
      ),
    );
  }
}

// --------------------------------------------------------
// ORGANIZATION CARD
// --------------------------------------------------------

class _OrgCard extends StatelessWidget {
  final Map<String, dynamic> org;

  const _OrgCard({required this.org});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final String imagePath = org["image"];

    return Column(
      children: [
        // LOGO CIRCLE
        Container(
          height: 75,
          width: 75,
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.all(2),

          decoration: BoxDecoration(
            color: Colors.white,         // 👈 auto for light/dark
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: theme.shadow.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),

          child: Image.asset(
            imagePath,

            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 3),

        // LABEL
        SizedBox(
          width: 60,
          child: Text(
            org["name"],
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: theme.onSurface,           // 👈 auto text color
            ),
          ),
        ),
      ],
    );
  }
}
