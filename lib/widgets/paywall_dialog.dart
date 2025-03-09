import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/ultils/constant/color.dart';

class PaywallDialog extends StatefulWidget {
  const PaywallDialog({super.key});

  @override
  State<PaywallDialog> createState() => _PaywallDialogState();
}

class _PaywallDialogState extends State<PaywallDialog> {
  bool isSelectedYearly = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Lottie.asset(
              'lib/assets/lotties/purchasesAnimation.json',
              fit: BoxFit.fill,
              width: double.infinity,
              height: 250,
            ),
            Positioned(
              top: 7,
              left: 7,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
                color: HexColor(dark),
                iconSize: 24,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text(
            S.of(context).paywallTitle,
            style: TextStyle(
              color: HexColor(white),
              fontWeight: FontWeight.bold,
            ),
          ),
          dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          minVerticalPadding: 0,
        ),
        ListTile(
          leading: Icon(Ionicons.trending_up),
          title: Text(
            S.of(context).firstBenefitTitle,
            style: TextStyle(color: HexColor(white)),
          ),
          dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          minVerticalPadding: 0,
        ),
        ListTile(
          leading: Icon(Ionicons.mic),
          title: Text(
            S.of(context).secondBenefitTitle,
            style: TextStyle(color: HexColor(white)),
          ),
          dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          minVerticalPadding: 0,
        ),
        ListTile(
          leading: Icon(Ionicons.heart),
          title: Text(
            S.of(context).thirdBenefitTitle,
            style: TextStyle(color: HexColor(white)),
          ),
          dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          minVerticalPadding: 0,
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            minTileHeight: 75,
            onTap:
                () => setState(() {
                  isSelectedYearly = true;
                }),
            title: Text(
              S.of(context).yearlyOfferTitle,
              style: TextStyle(
                color: HexColor(white),
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              S.of(context).discountLabel,
              style: TextStyle(color: HexColor(successful)),
            ),
            trailing: Text(
              '5\$',
              style: TextStyle(color: HexColor(white), fontSize: 14),
            ),
            tileColor: HexColor(secondary),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color:
                    isSelectedYearly ? HexColor(primary) : Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            minTileHeight: 75,
            onTap:
                () => setState(() {
                  isSelectedYearly = false;
                }),
            title: Text(
              S.of(context).monthlyOfferTitle,
              style: TextStyle(
                color: HexColor(white),
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              '5\$',
              style: TextStyle(color: HexColor(white), fontSize: 14),
            ),
            tileColor: HexColor(secondary),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color:
                    !isSelectedYearly ? HexColor(primary) : Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.shield_checkmark_outline,
                    color: HexColor(successful),
                    size: 15,
                  ),
                  SizedBox(width: 3),
                  Text(
                    S.of(context).noCommitmentText,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor(primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      S.of(context).payNowTitle,
                      style: TextStyle(color: HexColor(white), fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, right: 20, left: 20),
                child: Text(
                  S.of(context).renewalInfoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
