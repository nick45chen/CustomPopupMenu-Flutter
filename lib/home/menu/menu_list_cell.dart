import 'package:custom_pop_up_menu/home/menu/arrow.dart';
import 'package:flutter/material.dart';

part 'floating_menu.dart';

class MenuListCell extends StatefulWidget {
  final String title;

  const MenuListCell({Key? key, required this.title}) : super(key: key);

  @override
  State<MenuListCell> createState() => _MenuListCellState();
}

class _MenuListCellState extends State<MenuListCell> {
  late GlobalKey actionKey;
  var isShowMenu = false;
  OverlayEntry? floatingMenu;
  double height = -1;
  double width = -1;
  double xPosition = -1;
  double yPosition = -1;

  @override
  void initState() {
    super.initState();
    actionKey = LabeledGlobalKey(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        debugPrint('✨輕點');
      },
      onLongPress: () {
        if (isShowMenu) {
          _dismissMenu();
        } else {
          _showMenu(context);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.blueAccent.shade400,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Text(
              widget.title.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const Spacer(),
            const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _dismissMenu() {
    floatingMenu?.remove();
    setState(() => isShowMenu = false);
  }

  void _showMenu(BuildContext context) {
    _findMenuPosition();
    floatingMenu = _createFloatingMenu(
      title: widget.title,
      startX: xPosition,
      startY: yPosition,
      height: height,
      width: width,
      onDismiss: _dismissMenu,
    );
    Overlay.of(context)?.insert(floatingMenu!);
  }

  void _findMenuPosition() {
    RenderBox? renderBox = actionKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      height = renderBox.size.height;
      width = renderBox.size.width;
      Offset offset = renderBox.localToGlobal(Offset.zero);
      xPosition = offset.dx;
      yPosition = offset.dy;
    } else {
      // 未找到座標
      height = -1;
      width = -1;
      xPosition = -1;
      yPosition = -1;
    }

    debugPrint('✨height: $height');
    debugPrint('✨width: $width');
    debugPrint('✨xPosition: $xPosition');
    debugPrint('✨yPosition: $yPosition');
  }
}
