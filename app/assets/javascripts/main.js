var el = document.getElementById('timer'),
    total = el.innerHTML,
    url = el.dataset.url
    timeinterval = setInterval(function () {
        total = --total;
        el.textContent = total;
        if (total <= 0) {
            clearInterval(timeinterval);
            window.location = url;
        }
    }, 1000);