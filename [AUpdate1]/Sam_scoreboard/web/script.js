window.addEventListener('message', function (event) {
    let action = event.data.action
    if (action == "OpenMenu") {
        $(".mainMenu").css('display', 'flex');
        $(".mainMenu").fadeIn(250);
        $(".playersAmount").text(event.data.playersAmount);
        const data = event.data.data;
        $(".table-content").empty();
        for (let i = 0; i < data.length; i++) {
            let id = data[i].id;
            let name = data[i].name;
            let score = Math.round(data[i].score/60);
            let ping = data[i].ping;
            $(".table-content").append(`
                <div class="table-row">
                    <div class="table-data idc">${id}</div>
                    <div class="table-data">${name}</div>
                    <div class="table-data">${score}</div>
                    <div class="table-data">${ping}</div>
                </div>
            `);
        }
    }
})

$(document).keyup(function (e) {
    if (e.keyCode === 27) {
        closeHUD()
    }
})

function closeHUD() {
    $(".mainMenu").fadeOut(250)
    $.post(`https://${GetParentResourceName()}/menuClosed`)
}

$(document).ready(function () {
    $('#closeButton').click(function () {
        closeHUD();
    });
});