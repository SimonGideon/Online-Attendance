import Instascan from 'instascan';

document.addEventListener('DOMContentLoaded', function () {
  let csrfToken = document.getElementsByName('csrf-token')[0]?.content;

  let scanner = new Instascan.Scanner({ video: document.getElementById('scanner') });

  scanner.addListener('scan', function (content) {
    console.log('Scanned:', content);

    // Send the token along with your request
  //   fetch('/attendances/mark_attendance', {
  //     method: 'POST',
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'X-CSRF-Token': csrfToken
  //     },
  //     body: JSON.stringify({ encoded_token: content })
  //   })
  //   .then(response => response.json())
  //   .then(data => {
  //     console.log(data);
  //     // Handle the server response as needed
  //   });
  // });

  Instascan.Camera.getCameras().then(cameras => {
    if (cameras.length > 0) {
      scanner.start(cameras[0]);
    } else {
      console.error('No cameras found.');
    }
  });
})});
