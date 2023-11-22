let uiOpen = false
let questionTime = 0
let translations = {}

$(function(){
    setUI()

    window.addEventListener("message", function(e){
        let data = e.data
        let action = e.data.action

        switch(action){
            case "openUi":
                $(".Menu-wrapper").fadeIn(150)
                $("#joinedPlayers").text(data.players)
                uiOpen = true
            break;

            case "joined":
                $(".Menu-wrapper").fadeOut(150)
                $(".exitBox-wrapper").fadeIn(150)
            break;

            case "finishGame":
                $(".startPage-wrapper").fadeOut()
                $(".questionBox-wrapper").fadeOut()
            break;

            case "leaveGame":
                $(".startPage-wrapper").fadeOut()
                $(".questionBox-wrapper").fadeOut()
                $(".exitBox-wrapper").fadeOut()
            break;

            case "startGame":
                $(".questionBox-wrapper").fadeIn(150)
                
                if (!data.question){
                    $(".questionText p").text(translations["GameFinished"])
                    $(".questionText span").html(translations["Finished"])
                }else{
                    $(".questionText p").text(data.question.question)
                    $(".questionText span").html(translations["QUESTION"])
                }
            break;

            case "getTimeData":
                if (data.time == 0){
                    $(".startPage-wrapper").fadeOut(150)
                } else if (data.time < 4){
                    $(".startText").text(data.time)
                    $(".startPage-wrapper").fadeIn(150)
                }
            break;

            default: break;
        }
    })

    $(".joinButton").click(function(){
        $.post(`https://${GetParentResourceName()}/joinGame`, function (cb) {
            if (cb.stat){
                $.post(`https://${GetParentResourceName()}/canJoin`)
                $(".exitBox-wrapper").show()
            }else{
                if (cb.val == "money")$.post(`https://${GetParentResourceName()}/notify`, JSON.stringify("Yeterli paran yok."))
                else $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify("This game is already started."))
            }
            
            $(".Menu-wrapper").fadeOut(150)
            uiOpen = false;
        });
    })

    $(".viewButton").click(function(){
        $.post(`https://${GetParentResourceName()}/joinSpec`);
    })

    $(window).on("keydown", function ({ originalEvent: { key } }) {
        if (key == "Escape"){
            if (uiOpen) {
                $(".Menu-wrapper").fadeOut(150);
                $.post(`https://${GetParentResourceName()}/close`)
                uiOpen = false
            };
        }
    });
})

function setUI(){
    $.post(`https://${GetParentResourceName()}/getConfig`, function (data) {
        translations = data.translations
        questionTime = data.questionTime
        $("#maxPlayers").text("/ "+data.maxPlayers)
        $(".keybind").text(data.keyToLeave)
        let text = ''
        data.rules.forEach(rule => {
            text += `
            <div class="infoText">
                <div></div>
                ${rule}
            </div>
            `
        });

        $(".infoBottomBox").html(text)
    });
}