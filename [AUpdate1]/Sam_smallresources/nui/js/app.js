var persistentNotifs = {};
var colaNotifs = [];
var mostrando = false;


window.addEventListener('message', function (event) {
    if (event.data.action == "show") {
        ShowNotif(event.data);
    }else if(event.data.action == "update"){
        updatePlayers(event.data.players);
    }else if(event.data.action == "hide"){
        $('.anuncios').fadeOut();
        mostrando = false;
    }
});

function CreateNotification(data) {
    var $notification = $(document.createElement('div'));
    $notification.addClass('anuncios').addClass(data.type);
    var currentDate = new Date();
    var year = currentDate.getFullYear();
    var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
    var day = ('0' + currentDate.getDate()).slice(-2);

    var currentDateTime = year + '/' + month + '/' + day + ' ';
    var hour = ('0' + currentDate.getHours()).slice(-2);
    var minute = ('0' + currentDate.getMinutes()).slice(-2);

    $notification.html('<i class="fa-solid fa-people-group"></i> 在线人数:<span class="players-online">' + data.text + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-regular fa-clock"></i>当前时间:<span class="current-time">' + currentDateTime + hour + ':' + minute + '</span>');
    $notification.fadeIn();
    if (data.style !== undefined) {
        Object.keys(data.style).forEach(function (css) {
            $notification.css(css, data.style[css])
        });
    }

    return $notification;
}

function ShowNotif(data) {
    var $notification = CreateNotification(data);
    mostrando = true;
    $('.StatusBar').append($notification);
    setInterval(updateCurrentTime, 10000);
}

function updatePlayers(players){
    var $playersElement = $('.players-online');
    $playersElement.text(players);
    console.log(players);
}

function updateCurrentTime() {
    var $currentTimeElement = $('.current-time');
    if ($currentTimeElement.length > 0) {
        var currentDate = new Date();
        var year = currentDate.getFullYear();
        var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
        var day = ('0' + currentDate.getDate()).slice(-2);
        var currentDateTime = year + '/' + month + '/' + day + ' ';
        var hour = ('0' + currentDate.getHours()).slice(-2);
        var minute = ('0' + currentDate.getMinutes()).slice(-2);
        $currentTimeElement.text(currentDateTime + hour + ':' + minute);
    }
}