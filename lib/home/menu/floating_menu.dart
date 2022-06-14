part of 'menu_list_cell.dart';

const menuHeight = 200;
const arrowHeight = Arrow.height;
const menuPadding = 2.0;

/// 創建覆蓋在上方的 Menu
/// @param title: 標題
/// @param startX: Menu 畫面右上角起始位置 X
/// @param startY: Menu 畫面右上角起始位置 Y
/// @param height: 點擊的 cell height
/// @param height: 點擊的 cell width
/// @param screenHeight: 螢幕高度
/// @param onDismiss: 取消 Menu callback
OverlayEntry _createFloatingMenu({
  required String title,
  required double startX,
  required double startY,
  required double parentHeight,
  required double width,
  required double screenHeight,
  VoidCallback? onDismiss,
}) {
  const padding = 16.0;
  final isAtTop = isShowMenuBelowClickPosition(screenHeight, startY);

  var menuXPosition = startX + padding;
  var menuYPosition = 0.0;
  var menuWidth = width - padding * 2;

  if (isAtTop) {
    menuYPosition = startY - menuHeight - arrowHeight - menuPadding;
  } else {
    menuYPosition = startY + parentHeight;
  }

  return OverlayEntry(
    builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: onDismiss,
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            left: menuXPosition,
            top: menuYPosition,
            width: menuWidth,
            child: Material(
              color: Colors.transparent,
              child: Menu(title: title, isAtTop: isAtTop),
            ),
          ),
        ],
      );
    },
  );
}

/// 以螢幕高度中心為基準點，判斷 menu 要顯示在上方還是下方
/// @param screenHeight: 螢幕高度
/// @param startY: Menu 畫面右上角起始位置 Y
bool isShowMenuBelowClickPosition(double screenHeight, double startY) {
  final halfScreenHeight = screenHeight / 2;
  // 開始的位置高度，在螢幕下方，但上方有比較多空間
  if (startY > halfScreenHeight) {
    return true;
  } else {
    // 維持顯示在下方
    return false;
  }
}

/// Menu View
class Menu extends StatelessWidget {
  final String title;
  final bool isAtTop;

  const Menu({Key? key, required this.title, required this.isAtTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      const SizedBox(height: 2),
      Align(
        alignment: const Alignment(-0.85, 0.0),
        child: Arrow(color: Colors.amber, isUpArrow: !isAtTop),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          height: 200,
          color: Colors.amber,
          child: Column(
            children: [
              Expanded(
                child: Center(child: Text(title, style: const TextStyle(fontSize: 24, color: Colors.white))),
              ),
              Row(
                children: [
                  Expanded(
                    child: _textButton(
                      label: '測試1',
                      backgroundColor: Colors.greenAccent,
                      onTap: () => _showMessage(context, '測試1'),
                    ),
                  ),
                  Expanded(
                    child: _textButton(
                      label: '測試2',
                      backgroundColor: Colors.deepOrangeAccent,
                      onTap: () => _showMessage(context, '測試2'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ];

    return Column(
      children: isAtTop ? widgets.reversed.toList() : widgets,
    );
  }

  Widget _textButton({
    required String label,
    required Color backgroundColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        height: 40,
        child: Center(child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16.0))),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
