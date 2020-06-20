import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubank/page/widgets/bottom_menu/item_menu_bottom.dart';

class BottomMenu extends StatelessWidget {
  final bool showMenu;
  final double yPosition;
  final double screenHeigth;

  const BottomMenu({Key key, this.showMenu, this.yPosition, this.screenHeigth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      bottom: showMenu ? 0 - yPosition : 0,
      right: 0,
      left: 0,
      height: screenHeigth * 0.21,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 25,
        ),
        child: IgnorePointer(
          ignoring: showMenu,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: showMenu ? 0 : 1,
            child: Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  MenuBottom(
                    icon: Icons.person_add,
                    text: 'Indicar Amigos',
                  ),
                  MenuBottom(
                    icon: Icons.phone_android,
                    text: 'Recarga de Celular',
                  ),
                  MenuBottom(
                    icon: Icons.chat,
                    text: 'Cobrar',
                  ),
                  MenuBottom(
                    icon: Icons.monetization_on,
                    text: 'Empréstimos',
                  ),
                  MenuBottom(
                    icon: Icons.move_to_inbox,
                    text: 'Depositar',
                  ),
                  MenuBottom(
                    icon: Icons.mobile_screen_share,
                    text: 'Transferir',
                  ),
                  MenuBottom(
                    icon: Icons.format_align_center,
                    text: 'Ajustar Limite',
                  ),
                  MenuBottom(
                    icon: Icons.chrome_reader_mode,
                    text: 'Pagar',
                  ),
                  MenuBottom(
                    icon: Icons.lock_open,
                    text: 'Bloquear Cartão',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
