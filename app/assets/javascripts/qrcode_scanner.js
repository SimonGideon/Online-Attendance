// app/assets/javascripts/qrcode_scanner.js
import { BrowserQRCodeReader } from '@zxing/library';

document.addEventListener('DOMContentLoaded', function () {
  const codeReader = new BrowserQRCodeReader();

  codeReader.getVideoInputDevices()
    .then((videoInputDevices) => {
      if (videoInputDevices.length > 0) {
        const constraints = {
          video: { deviceId: videoInputDevices[0].deviceId }
        };

        codeReader.decodeFromVideoDevice(undefined, 'video', (result, err) => {
          if (result) {
            alert('Scanned: ' + result.text);
            // Handle the scanned content as needed (e.g., send it to the server via AJAX)
          }
          if (err && !(err instanceof NotFoundException)) {
            console.error(err);
          }
        });
      } else {
        console.error('No cameras found.');
      }
    })
    .catch((err) => {
      console.error(err);
    });
});
