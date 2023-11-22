const DEBUG = true;
if (!DEBUG) console.log = function () {};

let timeout;
window.addEventListener('message', function (event) {
	var item = event.data;

	if (item.type === "tutorial") {
		showTutorial();
        $("#kook_info").html('请前往Kook频道的绑定专区输入：<em><div id="bind">绑定' + item.kook + '</div></em> 以绑定您的Kook账号');
	}else if (item.type === "hide") {
        hideTutorial();
    }

});

//tutorial
const PAGES = $('.introtext').length;
let page = 1;

function showTutorial() {
	$(".tutorialcontainer").css("display", "flex");
	page = 1;
	for (let i = 1; i <= PAGES; i++)
		$("#page" + i).css("display", "none");
	$("#page1").css("display", "block");
}

function hideTutorial() {
	$(".tutorialcontainer").css("display", "none");

	for (let i = 1; i <= PAGES; i++)
		$("#page" + i).css("display", "none");

    $.post('https://Sam_tutorial/tutorial_exit');
}

function nextPage() {
	$("#page" + page).css("display", "none");
	page = Math.min(PAGES, page + 1);
	$("#page" + page).css("display", "block");
}

function prevPage() {
	$("#page" + page).css("display", "none");
	page = Math.max(1, page - 1);
	$("#page" + page).css("display", "block");
}

$(".next").click((e) => {
	if ($(e.target).hasClass("finish")){
        const tempInput = document.createElement('input');
        console.log($("#bind").text());
        const citizenid = $("#bind").text();
        tempInput.value = citizenid;
        
        document.body.appendChild(tempInput);
        tempInput.select();
        document.execCommand('copy');
        document.body.removeChild(tempInput);
        window.invokeNative("openUrl", 'https://kook.top/8W8Y23');
        return;
    }
	//return hideTutorial();

	nextPage();
});


$(".prev").click((e) => {
	if ($(e.target).hasClass("skip")) {
		$("#page" + page).css("display", "none");
		page = PAGES;
		$("#page" + page).css("display", "block");
		return;
	}

	prevPage();
});

document.onkeydown = checkKey;

function checkKey(e) {
	e = e || window.event;

	if (e.keyCode == '37') {
        if(page == 1) {
            $("#page" + page).css("display", "none");
            page = PAGES;
            $("#page" + page).css("display", "block");
            return;
        }
		prevPage();
	} else if (e.keyCode == '39') {
        if(page == PAGES)
            return hideTutorial();
		nextPage();
	} else if (e.keyCode == '13') {
        if(page == PAGES)
            return hideTutorial();
		nextPage();
	}
}