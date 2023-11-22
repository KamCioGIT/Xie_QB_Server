var Power = false
var allowMove = true
var Player = 0
  
$('#power').click(function() {
    if (!allowMove) {return}
    if (!Power) {
        Power = true
    } else {
        Power = false
    }
    var popup = new Audio('sounds/click.wav');
    popup.volume = 0.4;
    popup.play();
    $.post("https://" + GetParentResourceName() + "/power",
    JSON.stringify({value: Power}))
})

$('#reset').click(function() {
    if (Power && allowMove) {
        var popup = new Audio('sounds/click.wav');
        popup.volume = 0.4;
        popup.play();
        $.post("https://" + GetParentResourceName() + "/reset")
    }
})

$('.blow-tip').click(function() {
    if (Power) {
        $.post("https://" + GetParentResourceName() + "/blowAir",
        JSON.stringify({pID: Player}))
    }
})

function blowAir(time, value, level) {
    var popup = new Audio('sounds/blow.wav');
    popup.volume = 0.7;
    popup.play();
    $('.blow-screen').hide()
    $('.blow-tip').hide()
    $('.wait-screen').css('display', 'flex')
    var duration = time;
    $('#progressBar span').css('animation-duration', duration + 'ms').one('animationend', function() {
        $('.wait-screen').css('display', 'none')
        if (!$('.result-screen').hasClass('start-effect')) {
            $('.result-screen').addClass('start-effect');
        }
        $('.result-screen').show()
        var randomValue = setInterval(function() {
            var randomNum = Math.floor(Math.random() * 101);
            $('.time-text').text(randomNum + '%');
        }, 500);
        setTimeout(() => {
            $('.result-screen').removeClass('start-effect');
            clearInterval(randomValue)
            $('.time-text').text(value + '%');

            if (level == 'yellow') {
                $('.result-screen').addClass('yellow');
            } else if (level == 'red') {
                $('.result-screen').addClass('red');
            } else if (level == 'green') {
                $('.result-screen').addClass('green');
            }

            var popup = new Audio('sounds/result.wav');
            popup.volume = 0.4;
            popup.play();
        }, 3000);
    });
}


function Close() {
    Power = false
    allowMove = true
    $('.container').hide()
    $('.blow-screen').hide()
    $('.blow-tip').hide()
    $('.result-screen').hide()
    $('.wait-screen').css('display', 'none')
    $.post("https://" + GetParentResourceName() + "/closeUI")
}


$(document).ready(function () {
    window.addEventListener("message", function (event) {
      switch (event.data.action) {
        case "openUI":
            $('.container').show()
            $('.wait-txt').text(event.data.language.wait_blow)
            $('.blow-txt').text(event.data.language.blow_txt)
            allowMove = event.data.move
            Player = event.data.target
            break;
        case 'resetUI':
            $('.blow-screen').hide()
            $('.blow-tip').hide()
            $('.result-screen').hide()
            $('.wait-screen').css('display', 'none')
    
            $('.blow-screen').show()
            $('.blow-tip').show()
            break;
        case "power":
            Power = event.data.power
            if (Power) {
                $('.blow-screen').show()
                $('.blow-tip').show()
            } else {
                $('.blow-screen').hide()
                $('.blow-tip').hide()
                $('.result-screen').hide()
                $('.wait-screen').css('display', 'none')
            }
            break;
        case "blowAir":
            blowAir(event.data.time, event.data.value, event.data.level);
            break;
        case "close":
            Close();
      }
    });
});


$(document).on("keydown", function (event) {
    switch (event.keyCode) {
        case 27: // ESC
            Close();
            break;
        case 9: // ESC
            Close();
            break;
    }
});
