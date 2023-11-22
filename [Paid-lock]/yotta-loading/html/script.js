document.addEventListener("DOMContentLoaded", function () {
    function display(bool) {
        if (bool) {
            document.getElementById("body").style.display = "block";
        } else {
            document.getElementById("body").style.display = "none";
        }
    }
    var count = 0
    var thisCount = 0

    const handler = {
        startInitFunctionOrder(data) {
            count = data.count;
        },
        initFunctionInvoking(data) {
            document.querySelector("#progress").style.left = "0%";
            document.querySelector("#progress").style.width = ((data.idx / count) * 100) + "%";
        },
        startDataFileEntries(data) {
            count = data.count;
        },
        performMapLoadFunction(data) {
            ++thisCount;
            document.querySelector("#progress").style.left = "0%";
            document.querySelector("#progress").style.width = ((thisCount / count) * 100) + "%";
        }
    }

    window.addEventListener('message', function (event) {
        (handler[event.data.eventName] || function () { })(event.data);
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://yotta-loading/exit', JSON.stringify({}));
            return
        }
    };

    $(document).on("click", "#homemenu", function () {
        $("#news").hide();
        $("#team").hide();
        $("#home").show();
    });

    $(document).on("click", "#newsmenu", function () {
        $("#home").hide();
        $("#team").hide();
        $("#news").show();
    });

    $(document).on("click", "#teammenu", function () {
        $("#home").hide();
        $("#news").hide();
        $("#team").show();
    });
});