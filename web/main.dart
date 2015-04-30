
import 'package:electron/node.dart';
import 'package:electron/app.dart';
import 'package:electron/browser_window.dart';

var mainWindow;

main() {
  app.onWindowAllClosed.listen((_) {
    if (process.platform != 'darwin')
      app.quit();
  });

  app.onReady.listen((_) {
    mainWindow = new BrowserWindow(width: 800, height: 600);

    mainWindow.loadUrl('file://$dirname/index.html');

    mainWindow.onClosed.listen((_) {
      mainWindow = null;
    });
  });
}
