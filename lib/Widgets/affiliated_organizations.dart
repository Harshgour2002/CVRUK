import 'package:flutter/material.dart';

class AffiliatedOrganizationsBox extends StatelessWidget {
  const AffiliatedOrganizationsBox({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> affiliatedOrganizations = [
      {
        "name": "MPPC",
        "image": "assets/affiliation_images/Mppc.png",
      },
      {
        "name": "UGC",
        "image": "assets/affiliation_images/UGC.png",
      },
      {
        "name": "AICTE",
        "image": "assets/affiliation_images/AICTE.png"
      },
      {
        "name": "AIU",
        "image": "assets/affiliation_images/AIU.png"
      },
      {
        "name": "NCTE",
        "image": "assets/affiliation_images/NCTE.png"
      },
      {
        "name": "ACU",
        "image": "assets/affiliation_images/ACU.png"
      }
    ];

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade500)
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
    final String imagePath = org["image"];

    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(left: 3, top: 3, right: 3, bottom: 3),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
          ),

          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 8),

        SizedBox(
          width: 60,
          child: Text(
            org["name"],
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
