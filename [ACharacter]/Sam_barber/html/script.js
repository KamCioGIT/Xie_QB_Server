var skinManager = null
var clientId
var currentItem
var prices
var CustomNames = {}
var isChangingHairStyle = false
var currentValue = {
    ["hair_1"]: {min: 0, value: 0, max: 0},
    ["hair_2"]: {min: 0, value: 0, max: 0},
    ["hair_color_1"]: {min: 0, value: 0, max: 0},
    ["hair_color_2"]: {min: 0, value: 0, max: 0},
    ["beard_1"]: {min: 0, value: 0, max: 0},
    ["beard_2"]: {min: 0, value: 0, max: 0},
    ["beard_3"]: {min: 0, value: 0, max: 0},
    ["eye_color"]: {min: 0, value: 0, max: 0},
    ["eyebrows_1"]: {min: 0, value: 0, max: 0},
    ["eyebrows_2"]: {min: 0, value: 0, max: 0},
    ["eyebrows_3"]: {min: 0, value: 0, max: 0},
    ["makeup_1"]: {min: 0, value: 0, max: 0},
    ["makeup_2"]: {min: 0, value: 0, max: 0},
    ["makeup_3"]: {min: 0, value: 0, max: 0},
    ["makeup_4"]: {min: 0, value: 0, max: 0},
    ["lipstick_1"]: {min: 0, value: 0, max: 0},
    ["lipstick_2"]: {min: 0, value: 0, max: 0},
    ["lipstick_3"]: {min: 0, value: 0, max: 0},
    ["blush_1"]: {min: 0, value: 0, max: 0},
    ["blush_2"]: {min: 0, value: 0, max: 0},
    ["blush_3"]: {min: 0, value: 0, max: 0},
}

window.addEventListener("load", function(){
	$("#header_barber").html(translate.header_barber);
	$("#header_shop").html(translate.header_shop)
	$("#pay").html(translate.pay_button)
});

window.addEventListener('message', function(event){
    var item = event.data;
    if (item.action == "show") {
        $("body").css("display", "block")
        for (const [key, value] of Object.entries(item.data)) {
            if (currentValue[key]) {
                currentValue[key] = {
                    value: value.value,
                    min: value.min,
                    max: value.max
                }
            }
        }
        skinManager = item.skinManager
        if (item.Makeup) {
            $(".makeup_circle").css("display", "block")
        }
        if (item.clientId) {
            clientId = item.clientId
        }
        if (item.prices) {
            prices = item.prices
        }
        CustomNames = item.CustomNames
    }
    if (item.action == "hide") {
        $("body").css("display", "none")
    }
    if (item.action == "openAgain") {
        $("body").css("display", "block")
    }
});

$(".hair_circle").click(function() {
    if (clientId) {
        isChangingHairStyle = false
        $.post('https://Sam_barber/switchCategory', JSON.stringify({clientId: clientId}));
    } else {
        currentItem = "hair"
        $("#currentPrice").html(`<b>${prices["hair"]}$</b>`)
        $.post('https://Sam_barber/switchCategory', JSON.stringify({}))
    }
    $("#panel").empty()
    $("#panel").append(`
        <div class="position:absolute;height:60%;">
            <div style="width: 92%;margin-left: auto;margin-right: auto;margin-top: 5%;height: 45%;background-color: rgb(25, 25, 25);border-radius: 12px;">
                <div style="display: inline-flex;margin: 10px;">
                    <div style="margin-right: 15px;width:31%">
                        <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;font-size:15px">${translate.hair_style}<span class="itemLabel" id="name-hair_1">ㅤ</span></p>
                        <div style="display: inline-flex;margin-bottom: 10px;width: 101%;justify-content: space-evenly;">
                            <button onclick="previous('hair_1')" id="minus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                <i class="fa-solid fa-caret-left"></i>
                            </button>
                            <p id="current-hair_1" style="font-family: 'Montserrat', sans-serif;font-size: 20px;color: #dededef9;margin-left: 18px;margin-right: 18px;">${currentValue["hair_1"].value}</p>
                            <button onclick="next('hair_1')" id="plus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                <i class="fa-solid fa-caret-right"></i>
                            </button>
                        </div>
                    </div>
                    <div style="width:66%">
                        <p style="color: #dededef9;font-size: 20px;line-height: 0px;margin-top: 13px;font-family: 'Montserrat', sans-serif;text-align: left; margin-left: 3px;">${translate.hair_color}</p>
                        <div style="display: flex;flex-wrap: wrap;width: 101%;">
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 0)" style="background: #060606;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 1)" style="background: #131313;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 2)" style="background: #303230;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 3)" style="background: #1e0f0a;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 4)" style="background: #4e2a1d;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 5)" style="background: #90543d;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 6)" style="background: #EDC87D;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 7)" style="background: #F5D38F;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 8)" style="background: #F7D99D;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 9)" style="background: #FCE3B2;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 10)" style="background: #c5b495;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 11)" style="background: #dfcdac;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 12)" style="background: #F9E5BF;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 13)" style="background: #e3c48a;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 14)" style="background: #ebd09d;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 15)" style="background: #f6e3c0;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 16)" style="background: #8e8370;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 17)" style="background: #A4530B;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 18)" style="background: #EA3C11;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 19)" style="background: #620000;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 20)" style="background: #8d0000;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 21)" style="background: #ff0505;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 22)" style="background: #ff4242;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 23)" style="background: #ff5c26;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 24)" style="background: #F58159;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 25)" style="background: #ac5c41;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 26)" style="background: #AFABAA;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 27)" style="background: #BCB9B8;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 28)" style="background: #E6E6E6;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 29)" style="background: #FFFFFF;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 30)" style="background: #533c67;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 31)" style="background: #82619f;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 32)" style="background: #7f3286;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 33)" style="background: #ff0ae7;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 34)" style="background: #ff0357;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 35)" style="background: #ff9bcb;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 36)" style="background: #22b1a1;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 37)" style="background: #1e7590;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 38)" style="background: #2231ff;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 39)" style="background: #1def55;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 40)" style="background: #068d60;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 41)" style="background: #154e60;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 42)" style="background: #a0f742;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 43)" style="background: #47F225;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 44)" style="background: #0c9d2c;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 45)" style="background: #CAE57B;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 46)" style="background: #f5bc22;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 47)" style="background: #e2940f;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 48)" style="background: #ff8001;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 49)" style="background: #ff5e00;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 51)" style="background: #d13809;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 56)" style="background: #1b1411;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 57)" style="background: #261d19;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 58)" style="background: #42332d;"></div>
                            <div class="colour-selection" onclick="changeColor('hair_color_1', 61)" style="background: #000;"></div>
                        </div>
                    </div>
                </div>
            </div>
            ${skinManager != "qb-clothing" && `
                <div style="width: 92%;margin-left: auto;margin-right: auto;margin-top: 5%;height: 45%;background-color: rgb(25, 25, 25);border-radius: 12px;">
                    <div style="display: inline-flex;margin: 10px;">
                        <div style="margin-right: 15px;width:31%">
                            <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;font-size:15px;">${translate.hair_style2}</p>
                            <div style="display: inline-flex;margin-bottom: 10px;width: 100%;justify-content: space-evenly;">
                                <button onclick="previous('hair_2')" id="minus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                    <i class="fa-solid fa-caret-left"></i>
                                </button>
                                <p id="current-hair_2" style="font-family: 'Montserrat', sans-serif;font-size: 20px;color: #dededef9;margin-left: 18px;margin-right: 18px;">${currentValue["hair_2"].value}</p>
                                <button onclick="next('hair_2')" id="plus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                    <i class="fa-solid fa-caret-right"></i>
                                </button>
                            </div>
                        </div>
                        <div style="width:66%">
                            <p style="color: #dededef9;font-size: 20px;line-height: 0px;margin-top: 13px;font-family: 'Montserrat', sans-serif;text-align: left; margin-left: 3px;">${translate.hair_color2}<span class="itemLabel" id="name-hair_2">ㅤ</span></p>
                            <div style="display: flex;flex-wrap: wrap;width: 101%;">
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 0)" style="background: #060606;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 1)" style="background: #131313;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 2)" style="background: #303230;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 3)" style="background: #1e0f0a;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 4)" style="background: #4e2a1d;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 5)" style="background: #90543d;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 6)" style="background: #EDC87D;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 7)" style="background: #F5D38F;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 8)" style="background: #F7D99D;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 9)" style="background: #FCE3B2;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 10)" style="background: #c5b495;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 11)" style="background: #dfcdac;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 12)" style="background: #F9E5BF;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 13)" style="background: #e3c48a;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 14)" style="background: #ebd09d;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 15)" style="background: #f6e3c0;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 16)" style="background: #8e8370;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 17)" style="background: #A4530B;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 18)" style="background: #EA3C11;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 19)" style="background: #620000;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 20)" style="background: #8d0000;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 21)" style="background: #ff0505;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 22)" style="background: #ff4242;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 23)" style="background: #ff5c26;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 24)" style="background: #F58159;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 25)" style="background: #ac5c41;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 26)" style="background: #AFABAA;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 27)" style="background: #BCB9B8;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 28)" style="background: #E6E6E6;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 29)" style="background: #FFFFFF;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 30)" style="background: #533c67;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 31)" style="background: #82619f;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 32)" style="background: #7f3286;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 33)" style="background: #ff0ae7;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 34)" style="background: #ff0357;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 35)" style="background: #ff9bcb;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 36)" style="background: #22b1a1;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 37)" style="background: #1e7590;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 38)" style="background: #2231ff;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 39)" style="background: #1def55;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 40)" style="background: #068d60;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 41)" style="background: #154e60;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 42)" style="background: #a0f742;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 43)" style="background: #47F225;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 44)" style="background: #0c9d2c;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 45)" style="background: #CAE57B;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 46)" style="background: #f5bc22;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 47)" style="background: #e2940f;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 48)" style="background: #ff8001;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 49)" style="background: #ff5e00;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 51)" style="background: #d13809;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 56)" style="background: #1b1411;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 57)" style="background: #261d19;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 58)" style="background: #42332d;"></div>
                                <div class="colour-selection" onclick="changeColor('hair_color_2', 61)" style="background: #000;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            ` || ``}
        </div>
    `)
})

$(".eye_circle").click(function() {
    if (clientId) {
        isChangingHairStyle = false
        $.post('https://Sam_barber/switchCategory', JSON.stringify({clientId: clientId}));
    } else {
        currentItem = "eye"
        $("#currentPrice").html(`<b>${prices["eye"]}$</b>`)
        $.post('https://Sam_barber/switchCategory', JSON.stringify({}))
    }
    $("#panel").empty()
    $("#panel").append(`
        <div class="position:absolute;height:60%;">
            <div style="width: 92%;margin-left: auto;margin-right: auto;margin-top: 5%;height: 45%;background-color: rgb(25, 25, 25);border-radius: 12px;">
                <div style="display: inline-flex;margin: 10px;">
                    <div style="width:100%">
                        <p style="color: #dededef9;font-size: 20px;line-height: 0px;margin-top: 13px;font-family: 'Montserrat', sans-serif;text-align: left; margin-left: 3px;">${translate.eye_colors}</p>
                        <div style="display: flex;flex-wrap: wrap;width: 101%;">
                            <div class="colour-selection" onclick="changeColor('eye_color', 0)" style="background: #0d3b14;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 1)" style="background: #196e26;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 2)" style="background: #4e7c8a;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 3)" style="background: #154775;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 4)" style="background: #735139;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 5)" style="background: #2e1f14;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 6)" style="background: #915f3a;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 7)" style="background: #454545;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 8)" style="background: #7d7d7d;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 9)" style="background: #a74cb5;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 10)" style="background: #c2ae2b;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 11)" style="background: #772bc2;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 12)" style="background: #09080a;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 13)" style="background: #615e63;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 14)" style="background: #cfca4c;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 15)" style="background: linear-gradient(45deg, #fff608 50%, #080808 50%);"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 16)" style="background: linear-gradient(45deg, #fff 10%, #000 20%, #000 30%, #fff 30%, #fff 40%, #000 40%, #000 50%, #fff 50%, #fff 60%, #000 60%, #000 70%, #fff 70%, #fff 80%, #000 90%);"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 17)" style="background: #fff"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 18)" style="background: linear-gradient(45deg, #47bef5 45%, #ff8a14 55%);"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 19)" style="background: linear-gradient(90deg, #fff, #000 40%, #000 60%, #fff);"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 20)" style="background: radial-gradient(black 30%, white 40%, red 50%);"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 21)" style="background: linear-gradient(90deg, #12db15 30%, #000 33%, #000 66%, #12db15 70%"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 22)" style="background: linear-gradient(90deg, #db5512 30%, #000 33%, #000 66%, #db5512 70%"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 23)" style="background: linear-gradient(90deg, #126cdb 30%, #000 33%, #000 66%, #126cdb 70%"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 24)" style="background: linear-gradient(0deg, #dbae32 30%, #000 33%, #000 66%, #dbae32 70%"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 25)" style="background: radial-gradient(black 30%, #ffdf0d 35%);"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 26)" style="background: black;"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 27)" style="background: radial-gradient(black 30%, red 35%);"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 28)" style="background: radial-gradient(#0daeff 30%, red 35%);"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 29)" style="background: radial-gradient(black 30%, #0daeff 35%);"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 30)" style="background: radial-gradient(black 30%, white 35%, red 120%);"></div>
                            <div class="colour-selection" onclick="changeColor('eye_color', 31)" style="background: radial-gradient(#d6d6d6 30%, white 35%);"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="width: 92%;margin-left: auto;margin-right: auto;margin-top: 5%;height: 45%;background-color: rgb(25, 25, 25);border-radius: 12px;">
                <div style="display: inline-flex;margin: 10px;">
                    <div style="margin-right: 15px;width:31%">
                        <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;font-size:15px">${translate.eyebrows_style}<span class="itemLabel" id="name-eyebrows_1">ㅤ</span></p>
                        <div style="display: inline-flex;margin-bottom: 10px;width: 101%;justify-content: space-evenly;">
                            <button onclick="previous('eyebrows_1')" id="minus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                <i class="fa-solid fa-caret-left"></i>
                            </button>
                            <p id="current-eyebrows_1" style="font-family: 'Montserrat', sans-serif;font-size: 20px;color: #dededef9;margin-left: 18px;margin-right: 18px;">${currentValue["eyebrows_1"].value}</p>
                            <button onclick="next('eyebrows_1')" id="plus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                <i class="fa-solid fa-caret-right"></i>
                            </button>
                        </div>
                        ${skinManager != "qb-clothing" && `
                            <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;margin-bottom: -1px; font-size:15px;">${translate.eyebrows_opacity}</p>
                            <input type="range" min="1" max="50" value="1" class="slider" id="eyebrows_2" onmousemove="changeRange('eyebrows_2')">
                        ` || ``}
                    </div>
                    <div style="width:66%">
                        <p style="color: #dededef9;font-size: 20px;line-height: 0px;margin-top: 13px;font-family: 'Montserrat', sans-serif;text-align: left; margin-left: 3px;">${translate.eyebrows_color}</p>
                        <div style="display: flex;flex-wrap: wrap;width: 101%;">
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 0)" style="background: #060606;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 1)" style="background: #131313;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 2)" style="background: #303230;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 3)" style="background: #1e0f0a;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 4)" style="background: #4e2a1d;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 5)" style="background: #90543d;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 6)" style="background: #EDC87D;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 7)" style="background: #F5D38F;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 8)" style="background: #F7D99D;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 9)" style="background: #FCE3B2;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 10)" style="background: #c5b495;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 11)" style="background: #dfcdac;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 12)" style="background: #F9E5BF;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 13)" style="background: #e3c48a;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 14)" style="background: #ebd09d;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 15)" style="background: #f6e3c0;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 16)" style="background: #8e8370;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 17)" style="background: #A4530B;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 18)" style="background: #EA3C11;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 19)" style="background: #620000;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 20)" style="background: #8d0000;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 21)" style="background: #ff0505;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 22)" style="background: #ff4242;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 23)" style="background: #ff5c26;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 24)" style="background: #F58159;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 25)" style="background: #ac5c41;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 26)" style="background: #AFABAA;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 27)" style="background: #BCB9B8;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 28)" style="background: #E6E6E6;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 29)" style="background: #FFFFFF;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 30)" style="background: #533c67;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 31)" style="background: #82619f;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 32)" style="background: #7f3286;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 33)" style="background: #ff0ae7;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 34)" style="background: #ff0357;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 35)" style="background: #ff9bcb;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 36)" style="background: #22b1a1;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 37)" style="background: #1e7590;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 38)" style="background: #2231ff;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 39)" style="background: #1def55;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 40)" style="background: #068d60;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 41)" style="background: #154e60;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 42)" style="background: #a0f742;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 43)" style="background: #47F225;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 44)" style="background: #0c9d2c;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 45)" style="background: #CAE57B;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 46)" style="background: #f5bc22;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 47)" style="background: #e2940f;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 48)" style="background: #ff8001;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 49)" style="background: #ff5e00;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 51)" style="background: #d13809;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 56)" style="background: #1b1411;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 57)" style="background: #261d19;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 58)" style="background: #42332d;"></div>
                            <div class="colour-selection" onclick="changeColor('eyebrows_3', 61)" style="background: #000;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `)
})

$(".beard_circle").click(function() {
    if (clientId) {
        isChangingHairStyle = false
        $.post('https://Sam_barber/switchCategory', JSON.stringify({clientId: clientId}));
    } else {
        currentItem = "beard"
        $("#currentPrice").html(`<b>${prices["beard"]}$</b>`)
        $.post('https://Sam_barber/switchCategory', JSON.stringify({}))
    }
    $("#panel").empty()
    $("#panel").append(`
        <div class="position:absolute;height:60%;">
            <div style="width: 92%;margin-left: auto;margin-right: auto;margin-top: 5%;height: 45%;background-color: rgb(25, 25, 25);border-radius: 12px;">
                <div style="display: inline-flex;margin: 10px;">
                    <div style="margin-right: 15px;width:31%">
                        <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;font-size:15px">${translate.beard_style}<span class="itemLabel" id="name-beard_1">ㅤ</span></p>
                        <div style="display: inline-flex;margin-bottom: 10px;width: 101%;justify-content: space-evenly;">
                            <button onclick="previous('beard_1')" id="minus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                <i class="fa-solid fa-caret-left"></i>
                            </button>
                            <p id="current-beard_1" style="font-family: 'Montserrat', sans-serif;font-size: 20px;color: #dededef9;margin-left: 18px;margin-right: 18px;">${currentValue["beard_1"].value}</p>
                            <button onclick="next('beard_1')" id="plus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                <i class="fa-solid fa-caret-right"></i>
                            </button>
                        </div>
                        ${skinManager != "qb-clothing" && `
                            <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;margin-bottom: -1px; font-size:15px;">${translate.beard_opacity}</p>
                            <input type="range" min="0" max="10" value="0" class="slider" id="beard_2" onmousemove="changeRange('beard_2')">
                        ` || ``}
                    </div>
                    <div style="width:66%">
                        <p style="color: #dededef9;font-size: 20px;line-height: 0px;margin-top: 13px;font-family: 'Montserrat', sans-serif;text-align: left; margin-left: 3px;">${translate.beard_colors}</p>
                        <div style="display: flex;flex-wrap: wrap;width: 101%;">
                            <div class="colour-selection" onclick="changeColor('beard_3', 0)" style="background: #060606;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 1)" style="background: #131313;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 2)" style="background: #303230;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 3)" style="background: #1e0f0a;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 4)" style="background: #4e2a1d;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 5)" style="background: #90543d;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 6)" style="background: #EDC87D;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 7)" style="background: #F5D38F;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 8)" style="background: #F7D99D;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 9)" style="background: #FCE3B2;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 10)" style="background: #c5b495;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 11)" style="background: #dfcdac;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 12)" style="background: #F9E5BF;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 13)" style="background: #e3c48a;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 14)" style="background: #ebd09d;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 15)" style="background: #f6e3c0;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 16)" style="background: #8e8370;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 17)" style="background: #A4530B;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 18)" style="background: #EA3C11;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 19)" style="background: #620000;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 20)" style="background: #8d0000;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 21)" style="background: #ff0505;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 22)" style="background: #ff4242;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 23)" style="background: #ff5c26;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 24)" style="background: #F58159;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 25)" style="background: #ac5c41;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 26)" style="background: #AFABAA;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 27)" style="background: #BCB9B8;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 28)" style="background: #E6E6E6;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 29)" style="background: #FFFFFF;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 30)" style="background: #533c67;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 31)" style="background: #82619f;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 32)" style="background: #7f3286;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 33)" style="background: #ff0ae7;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 34)" style="background: #ff0357;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 35)" style="background: #ff9bcb;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 36)" style="background: #22b1a1;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 37)" style="background: #1e7590;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 38)" style="background: #2231ff;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 39)" style="background: #1def55;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 40)" style="background: #068d60;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 41)" style="background: #154e60;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 42)" style="background: #a0f742;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 43)" style="background: #47F225;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 44)" style="background: #0c9d2c;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 45)" style="background: #CAE57B;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 46)" style="background: #f5bc22;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 47)" style="background: #e2940f;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 48)" style="background: #ff8001;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 49)" style="background: #ff5e00;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 51)" style="background: #d13809;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 56)" style="background: #1b1411;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 57)" style="background: #261d19;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 58)" style="background: #42332d;"></div>
                            <div class="colour-selection" onclick="changeColor('beard_3', 61)" style="background: #000;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `)
})

$(".makeup_circle").click(function() {
    if (clientId) {
        isChangingHairStyle = false
        $.post('https://Sam_barber/switchCategory', JSON.stringify({clientId: clientId}));
    } else {
        currentItem = "makeup"
        $("#currentPrice").html(`<b>${prices["makeup"]}$</b>`)
        $.post('https://Sam_barber/switchCategory', JSON.stringify({}))
    }
    $("#panel").empty()
    $("#panel").append(`
        <div class="position:absolute;height:60%;">
            <div style="width: 92%;margin-left: auto;margin-right: auto;margin-top: 5%;height: 45%;background-color: rgb(25, 25, 25);border-radius: 12px;">
                <div style="display: inline-flex;margin: 10px;">
                    <div style="margin-right: 15px;width:31%">
                        <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;font-size:15px">${translate.makeup_style}<span class="itemLabel" id="name-makeup_1">ㅤ</span></p>
                        <div style="display: inline-flex;margin-bottom: 10px;width: 101%;justify-content: space-evenly;">
                            <button onclick="previous('makeup_1')" id="minus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                <i class="fa-solid fa-caret-left"></i>
                            </button>
                            <p id="current-makeup_1" style="font-family: 'Montserrat', sans-serif;font-size: 20px;color: #dededef9;margin-left: 18px;margin-right: 18px;">${currentValue["makeup_1"].value}</p>
                            <button onclick="next('makeup_1')" id="plus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                <i class="fa-solid fa-caret-right"></i>
                            </button>
                        </div>
                        ${skinManager != "qb-clothing" && `
                            <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;margin-bottom: -1px; font-size:15px;">${translate.makeup_opacity}</p>
                            <input type="range" min="0" max="10" value="0" class="slider" id="makeup_2" onmousemove="changeRange('makeup_2')">
                        ` || ``}
                    </div>
                    <div style="width:66%">
                        <p style="color: #dededef9;font-size: 20px;line-height: 0px;margin-top: 13px;font-family: 'Montserrat', sans-serif;text-align: left; margin-left: 3px;">${translate.makeup_color}</p>
                        <div style="display: flex;flex-wrap: wrap;width: 101%;">
                            <div class="colour-selection" onclick="changeColor('makeup_3', 0)" style="background: #a7081f;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 1)" style="background: #e31549;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 2)" style="background: #ff1a6a;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 3)" style="background: #57213f;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 4)" style="background: #6b234d;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 5)" style="background: #781923;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 6)" style="background: #391216;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 7)" style="background: #6b3035;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 8)" style="background: #7b4c40;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 9)" style="background: #79635e;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 10)" style="background: #9d7c8c;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 11)" style="background: #6e3635;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 12)" style="background: #78312b;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 13)" style="background: #54180f;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 14)" style="background: #733139;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 15)" style="background: #834160;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 16)" style="background: #a8639e;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 17)" style="background: #842c5c;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 18)" style="background: #6b0b2c;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 19)" style="background: #671835;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 20)" style="background: #170408;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 21)" style="background: #1b0610;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 22)" style="background: #5e0e14;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 23)" style="background: #7c0b13;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 24)" style="background: #280304;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 25)" style="background: #891833;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 26)" style="background: #922894;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 27)" style="background: #530360;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 28)" style="background: #3c0053;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 29)" style="background: #34174e;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 30)" style="background: #1c0725;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 31)" style="background: #1c0420;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 32)" style="background: #1e0050;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 33)" style="background: #121131;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 34)" style="background: #0d1a5b;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 35)" style="background: #193586;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 36)" style="background: #073e7a;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 37)" style="background: #004f73;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 38)" style="background: #007a5b;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 39)" style="background: #007238;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 40)" style="background: #004a19;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 41)" style="background: #19350b;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 42)" style="background: #157500;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 43)" style="background: #548900;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 44)" style="background: #828f01;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 45)" style="background: #5d5700;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 46)" style="background: #8a6900;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 47)" style="background: #944301;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 48)" style="background: #871a00;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 49)" style="background: #40160c;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 50)" style="background: #72561f;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 51)" style="background: #928679;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 52)" style="background: #61677a;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 53)" style="background: #545966;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 54)" style="background: #252d37;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 55)" style="background: #181820;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 56)" style="background: #090909;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 57)" style="background: #0b2c3c;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 58)" style="background: #171f3b;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 59)" style="background: #0b0a10;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 60)" style="background: #403832;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 61)" style="background: #403232;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 62)" style="background: #1c1414;"></div>
                            <div class="colour-selection" onclick="changeColor('makeup_3', 63)" style="background: #22201a;"></div>
                        </div>
                    </div>
                </div>
            </div>
            ${(skinManager != "qb-clothing" && skinManager != "fivem-appearance") && `
                <div style="width: 92%;margin-left: auto;margin-right: auto;margin-top: 5%;height: 45%;background-color: rgb(25, 25, 25);border-radius: 12px;">
                    <div style="display: inline-flex;margin: 10px;">
                        <div style="width:100%">
                            <p style="color: #dededef9;font-size: 20px;line-height: 0px;margin-top: 13px;font-family: 'Montserrat', sans-serif;text-align: left; margin-left: 3px;">${translate.makeup2_color}</p>
                            <div style="display: flex;flex-wrap: wrap;width: 101%;">
                                <div class="colour-selection" onclick="changeColor('makeup_4', 0)" style="background: #a25667;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 1)" style="background: #b16380;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 2)" style="background: #ac6f8a;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 3)" style="background: #9f7089;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 4)" style="background: #a17289;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 5)" style="background: #a26370;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 6)" style="background: #966067;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 7)" style="background: #835a64;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 8)" style="background: #94797b;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 9)" style="background: #927b7d;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 10)" style="background: #9e8391;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 11)" style="background: #916e78;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 12)" style="background: #95686f;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 13)" style="background: #905750;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 14)" style="background: #977b8d;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 15)" style="background: #9a798c;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 16)" style="background: #a583a8;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 17)" style="background: #a77192;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 18)" style="background: #a35b88;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 19)" style="background: #98637e;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 20)" style="background: #75445d;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 21)" style="background: #633f4c;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 22)" style="background: #823845;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 23)" style="background: #a33948;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 24)" style="background: #982430;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 25)" style="background: #a86382;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 26)" style="background: #9f54a3;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 27)" style="background: #9c489f;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 28)" style="background: #8a409d;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 29)" style="background: #743e7d;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 30)" style="background: #7b3c7d;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 31)" style="background: #6c4278;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 32)" style="background: #713990;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 33)" style="background: #4b5580;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 34)" style="background: #47609c;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 35)" style="background: #4272a1;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 36)" style="background: #3a80a2;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 37)" style="background: #4594a6;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 38)" style="background: #3e9187;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 39)" style="background: #4b9c86;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 40)" style="background: #337a32;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 41)" style="background: #2f7a0f;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 42)" style="background: #67944c;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 43)" style="background: #99ac56;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 44)" style="background: #a4a94f;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 45)" style="background: #a09940;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 46)" style="background: #a89a4a;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 47)" style="background: #966934;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 48)" style="background: #af633c;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 49)" style="background: #a06f0f;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 50)" style="background: #a99b83;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 51)" style="background: #a9a7a9;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 52)" style="background: #a9b0be;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 53)" style="background: #817f8d;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 54)" style="background: #888993;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 55)" style="background: #685c63;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 56)" style="background: #45302c;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 57)" style="background: #607f8d;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 58)" style="background: #465167;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 59)" style="background: #4b4d69;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 60)" style="background: #7a6062;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 61)" style="background: #7b6567;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 62)" style="background: #6c5351;"></div>
                                <div class="colour-selection" onclick="changeColor('makeup_4', 63)" style="background: #413029;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            ` || ``}
            <div style="width: 92%;margin-left: auto;margin-right: auto;margin-top: 5%;height: 45%;background-color: rgb(25, 25, 25);border-radius: 12px;">
                <div style="display: inline-flex;margin: 10px;">
                    <div style="margin-right: 15px;width:31%">
                        <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;font-size:15px">${translate.lipstick_style}<span class="itemLabel" id="name-lipstick_1">ㅤ</span></p>
                        <div style="display: inline-flex;margin-bottom: 10px;width: 101%;justify-content: space-evenly;">
                            <button onclick="previous('lipstick_1')" id="minus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                <i class="fa-solid fa-caret-left"></i>
                            </button>
                            <p id="current-lipstick_1" style="font-family: 'Montserrat', sans-serif;font-size: 20px;color: #dededef9;margin-left: 18px;margin-right: 18px;">${currentValue["lipstick_1"].value}</p>
                            <button onclick="next('lipstick_1')" id="plus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                                <i class="fa-solid fa-caret-right"></i>
                            </button>
                        </div>
                        ${skinManager != "qb-clothing" && `
                            <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;margin-bottom: -1px; font-size:15px;">${translate.lipstick_opacity}</p>
                            <input type="range" min="0" max="10" value="0" class="slider" id="lipstick_2" onmousemove="changeRange('lipstick_2')">
                        ` || ``}
                    </div>
                    <div style="width:66%">
                        <p style="color: #dededef9;font-size: 20px;line-height: 0px;margin-top: 13px;font-family: 'Montserrat', sans-serif;text-align: left; margin-left: 3px;">${translate.lipstick_color}</p>
                        <div style="display: flex;flex-wrap: wrap;width: 101%;">
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 0)" style="background: #060606;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 1)" style="background: #131313;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 2)" style="background: #303230;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 3)" style="background: #1e0f0a;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 4)" style="background: #4e2a1d;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 5)" style="background: #90543d;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 6)" style="background: #EDC87D;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 7)" style="background: #F5D38F;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 8)" style="background: #F7D99D;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 9)" style="background: #FCE3B2;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 10)" style="background: #c5b495;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 11)" style="background: #dfcdac;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 12)" style="background: #F9E5BF;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 13)" style="background: #e3c48a;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 14)" style="background: #ebd09d;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 15)" style="background: #f6e3c0;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 16)" style="background: #8e8370;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 17)" style="background: #A4530B;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 18)" style="background: #EA3C11;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 19)" style="background: #620000;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 20)" style="background: #8d0000;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 21)" style="background: #ff0505;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 22)" style="background: #ff4242;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 23)" style="background: #ff5c26;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 24)" style="background: #F58159;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 25)" style="background: #ac5c41;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 26)" style="background: #AFABAA;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 27)" style="background: #BCB9B8;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 28)" style="background: #E6E6E6;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 29)" style="background: #FFFFFF;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 30)" style="background: #533c67;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 31)" style="background: #82619f;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 32)" style="background: #7f3286;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 33)" style="background: #ff0ae7;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 34)" style="background: #ff0357;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 35)" style="background: #ff9bcb;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 36)" style="background: #22b1a1;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 37)" style="background: #1e7590;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 38)" style="background: #2231ff;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 39)" style="background: #1def55;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 40)" style="background: #068d60;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 41)" style="background: #154e60;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 42)" style="background: #a0f742;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 43)" style="background: #47F225;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 44)" style="background: #0c9d2c;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 45)" style="background: #CAE57B;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 46)" style="background: #f5bc22;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 47)" style="background: #e2940f;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 48)" style="background: #ff8001;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 49)" style="background: #ff5e00;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 51)" style="background: #d13809;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 56)" style="background: #1b1411;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 57)" style="background: #261d19;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 58)" style="background: #42332d;"></div>
                        <div class="colour-selection" onclick="changeColor('lipstick_3', 61)" style="background: #000;"></div>
                    </div>
                </div>
            </div>
        </div>
            
        <div style="width: 92%;margin-left: auto;margin-right: auto;margin-top: 5%;height: 45%;background-color: rgb(25, 25, 25);border-radius: 12px;">
            <div style="display: inline-flex;margin: 10px;">
                <div style="margin-right: 15px;width:31%">
                    <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;font-size:15px">${translate.blush_style}<span class="itemLabel" id="name-blush_1">ㅤ</span></p>
                    <div style="display: inline-flex;margin-bottom: 10px;width: 101%;justify-content: space-evenly;">
                        <button onclick="previous('blush_1')" id="minus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                            <i class="fa-solid fa-caret-left"></i>
                        </button>
                        <p id="current-blush_1" style="font-family: 'Montserrat', sans-serif;font-size: 20px;color: #dededef9;margin-left: 18px;margin-right: 18px;">${currentValue["blush_1"].value}</p>
                        <button onclick="next('blush_1')" id="plus" style="width: 33px;height: 33px;background-color: #ff096a;border-radius: 6px;color: #fff;font-size: 23px;border: none;">
                            <i class="fa-solid fa-caret-right"></i>
                        </button>
                    </div>
                    ${skinManager != "qb-clothing" && `
                        <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;margin-bottom: -1px; font-size:15px;">${translate.blush_opacity}</p>
                        <input type="range" min="0" max="10" value="0" class="slider" id="blush_2" onmousemove="changeRange('blush_2')">
                    ` || ``}
                </div>
                <div style="width:66%">
                    <p style="color: #dededef9;font-size: 20px;line-height: 0px;margin-top: 13px;font-family: 'Montserrat', sans-serif;text-align: left; margin-left: 3px;">${translate.blush_color}</p>
                    <div style="display: flex;flex-wrap: wrap;width: 101%;">
                        <div class="colour-selection" onclick="changeColor('blush_3', 0)" style="background: #d60a22;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 1)" style="background: #ee3a64;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 2)" style="background: #ee6982;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 3)" style="background: #ff7489;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 4)" style="background: #cf566e;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 5)" style="background: #ff414b;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 6)" style="background: #b92b2b;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 7)" style="background: #ff7e6a;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 8)" style="background: #ffc190;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 9)" style="background: #ffd3ad;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 10)" style="background: #ffb798;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 11)" style="background: #ff8e6e;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 12)" style="background: #ff8c55;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 13)" style="background: #dc471f;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 14)" style="background: #ce766f;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 15)" style="background: #ed9da2;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 16)" style="background: #f8b3c3;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 17)" style="background: #f773a5;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 18)" style="background: #ff2f85;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 19)" style="background: #f44f71;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 20)" style="background: #84212d;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 21)" style="background: #711826;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 22)" style="background: #bc171f;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 23)" style="background: #f41034;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 24)" style="background: #e90000;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 25)" style="background: #ed506a;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 26)" style="background: #ec44b1;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 27)" style="background: #d918b3;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 28)" style="background: #cc0fb1;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 29)" style="background: #911879;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 30)" style="background: #a2016a;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 31)" style="background: #66164c;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 32)" style="background: #9314a4;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 33)" style="background: #29387e;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 34)" style="background: #3049a6;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 35)" style="background: #4cb2ff;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 36)" style="background: #23e2ff;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 37)" style="background: #28cfcf;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 38)" style="background: #25d7aa;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 39)" style="background: #18ca7e;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 40)" style="background: #0df036;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 41)" style="background: #249400;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 42)" style="background: #95dc17;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 43)" style="background: #e5f000;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 44)" style="background: #e9e000;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 45)" style="background: #ffed04;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 46)" style="background: #f9cf00;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 47)" style="background: #df7f01;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 48)" style="background: #fe6c00;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 49)" style="background: #cc6400;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 51)" style="background: #ffedc6;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 56)" style="background: #2d1b1b;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 57)" style="background: #d1fff3;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 58)" style="background: #8799aa;"></div>
                        <div class="colour-selection" onclick="changeColor('blush_3', 61)" style="background: #b1795a;"></div>
                    </div>
                </div>
            </div>
        </div>
    `)
})

$(".camrotate_circle").click(function() {
    if (clientId) {
        $.post('https://Sam_barber/cam', JSON.stringify({clientId: clientId}));
    } else {
        $.post('https://Sam_barber/cam', JSON.stringify({}));
    }
})

$("#hide").click(function() {
    if (clientId) {
        $.post('https://Sam_barber/hide', JSON.stringify({clientId: clientId}));
        clientId = undefined
    } else {
        $.post('https://Sam_barber/hide', JSON.stringify({}));
    }
})

$("#buy").click(function() {
    if (clientId) {
        $.post('https://Sam_barber/buy', JSON.stringify({clientId: clientId, isChangingHairStyle: isChangingHairStyle}));
    } else {
        $.post('https://Sam_barber/buy', JSON.stringify({currentItem: currentItem}));
    }
})

function previous(item) {
    if (currentValue[item].value > currentValue[item].min) {
        currentValue[item].value = currentValue[item].value - 1
    }
    $(`#current-${item}`).html(currentValue[item].value)
    if (CustomNames[item] && CustomNames[item][currentValue[item].value]) {
        $(`#name-${item}`).html(CustomNames[item][currentValue[item].value])
    } else {
        $(`#name-${item}`).html("ㅤ")
    }
    if (clientId) {
        if (item != 'makeup_1' && item != 'lipstick_1' && item != 'blush_1') {
            isChangingHairStyle = true
        }
        $.post('https://Sam_barber/change', JSON.stringify({
            type: item,
            new: currentValue[item].value,
            clientId: clientId,
        }));
    } else {
        $.post('https://Sam_barber/change', JSON.stringify({
            type: item,
            new: currentValue[item].value
        }));
    }
}

function next(item) {
    if (currentValue[item].value < currentValue[item].max) {
        currentValue[item].value = currentValue[item].value + 1
    }
    $(`#current-${item}`).html(currentValue[item].value)
    if (CustomNames[item] && CustomNames[item][currentValue[item].value]) {
        $(`#name-${item}`).html(CustomNames[item][currentValue[item].value])
    } else {
        $(`#name-${item}`).html("ㅤ")
    }
    if (clientId) {
        if (item != 'makeup_1' && item != 'lipstick_1' && item != 'blush_1') {
            isChangingHairStyle = true
        }
        $.post('https://Sam_barber/change', JSON.stringify({
            type: item,
            new: currentValue[item].value,
            clientId: clientId,
        }));
    } else {
        $.post('https://Sam_barber/change', JSON.stringify({
            type: item,
            new: currentValue[item].value
        }));
    }
}

function changeColor(item, dataId) {
    if (clientId) {
        $.post('https://Sam_barber/change', JSON.stringify({
            type: item,
            new: dataId,
            clientId: clientId
        }));
    } else {
        $.post('https://Sam_barber/change', JSON.stringify({
            type: item,
            new: dataId
        }));
    }
    currentValue[item].value = dataId
}

function changeRange(item) {
    let inputValue = $("#" + item).val()
    let result = inputValue
    if (result != currentValue[item].value) {
        if (clientId) {
            $.post('https://Sam_barber/change', JSON.stringify({
                type: item,
                new: result,
                clientId: clientId,
            }));
        } else {
            $.post('https://Sam_barber/change', JSON.stringify({
                type: item,
                new: result
            }));
        }
        currentValue[item].value = result
    }
}