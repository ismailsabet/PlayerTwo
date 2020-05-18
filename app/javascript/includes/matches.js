$(function () {
    scrolled = false;

    function scrollMessageBox() {
        if (!scrolled) {
            var objDiv = document.getElementById("message-box");
            $(objDiv).animate({
                scrollTop: objDiv.scrollHeight - objDiv.clientHeight
            }, 500);

            scrolled = true;
        }
    }

    $(".match-tile").on("click", function () {
        scrolled = false;

        setTimeout(scrollMessageBox, 1000);
    });

    $("#send").on("click", function () {
        scrolled = false;

        window.alert("click")
        setTimeout(scrollMessageBox, 2000);
    });

})