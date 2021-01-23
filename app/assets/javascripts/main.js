// disable href for all links
//

var el = document.getElementById('timer'),
    next_button = document.getElementById('next-button'),
    total = 15,
    url = el.dataset.url
    timeinterval = setInterval(function () {
        total = --total;
        el.textContent = total;
        if (total <= 0) {
            clearInterval(timeinterval);
            var buttons = document.getElementsByClassName("button");
            for (var i = 0, len = buttons.length; i < len; i++) {
              var button = buttons[i];
              button.href="javascript:;";
              next_button.classList.remove('d-none');
            }
         }
    }, 1000);
