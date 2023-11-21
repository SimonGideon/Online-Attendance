function domReady(fn) { 
  if (
    document.readyState === "complete" || 
    document.readyState === "interactive"
  ) { 
    setTimeout(fn, 1000); 
  } else { 
    document.addEventListener("DOMContentLoaded", fn); 
  } 
}

function sendPostRequest(encodedToken) {
  // You can use the Fetch API or any other AJAX method to send a POST request
  fetch('/attendances/mark_attendance', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': csrfToken,
    },
    body: JSON.stringify({ encoded_token: encodedToken }),
  })
    .then(response => response.json())
    .then(data => {
      console.log(data);
      // Handle the server response as needed
    })
    .catch(error => {
      console.error('Error:', error);
    });
}

domReady(function () { 
  // If found your QR code 
  function onScanSuccess(decodeText, decodeResult) { 
    alert("Your QR code is: " + decodeText, decodeResult); 
    sendPostRequest(decodeText);
  } 

  let htmlscanner = new Html5QrcodeScanner( 
    "my-qr-reader", 
    { fps: 10, qrbos: 250 } 
  ); 
  htmlscanner.render(onScanSuccess); 
});
