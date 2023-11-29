window.addEventListener('message', function(event) {
    var edata = event.data;

    function add_li(data) {
        var data = data.data
        $("ul").find("li").remove();
        for (var i = 0; i < data.length; i++) {
            $(`<li><b>` + data[i].key + `</b> ` + data[i].text + `</li>`).appendTo('ul')
        }
        $(".w").show()
    }

    if (edata.type) {
        add_li(edata)
    } else if (edata.type == false) {
        $(".w").hide()
    }

});