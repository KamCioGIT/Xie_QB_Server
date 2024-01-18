let data

const Names = {
    [0]: {
        "name": "名称",
        "score": "时间分",
        "uid": "UID",
        "inv": "最大背包格数",
        "inv_weight": "最大背包负重",
        "phone": "手机号",
        "birth": "出生日期",
        "sex": "性别",
        "group": "组织",
        "gang": "帮派",
        "logged_days": "登录天数",
    },
    [1]: {
        "model": "车型",
        "plate": "车牌",
    }
}

window.addEventListener('message', function (event) {
    let action = event.data.action
    if (action == "OpenMenu") {
        $(".container").css('display', 'flex');
        $(".content-box").empty();
        var buttons = document.querySelectorAll(".button");
        buttons.forEach(function (btn) {
            btn.classList.remove("selected-button");
        });
        addMessage('California RolePlay<br>欢迎回来!');
        $(".container").fadeIn(250);
        data = event.data.data;
        $("#uid").text('UID:' + data[0].uid);
        $("#name").text('名称:' + data[0].name);
        $("#score").text('时间分:' + data[0].score);
        $("#server-online").html('<i class="fa-solid fa-people-group" style="color:#dd9501;"></i> ' + data.online);
        $("#server-time").html('<i class="fa-solid fa-clock" style="color:#dd9501;"></i> ' + getTime());
    } else if (action == "setHouses") {
        let datas = event.data.data;
        addMessage('房产:' + datas.length);
        for (var i = 0; i < datas.length; i++) {
            var houseInfo = datas[i];
            addHouseTable(houseInfo.id, houseInfo.name);
        }
    } else if (action == "setAchievement") {
        let datas = event.data.data;
        addMessage('成就:' + event.data.total + '/' + datas.length+ '(拥有玩家数每小时更新一次)');
        /* const sortButtonHTML = '<button class="sortButton" id="sortAchievementsButton">时间升序</button>';
        $(".sort-buttons-container").append(sortButtonHTML);
        const sortIDButtonHTML = '<button class="sortButton" id="sortAchievementsIDButton">ID升序</button>';
        $(".sort-buttons-container").append(sortIDButtonHTML); */
        const buttonContainer = document.createElement("div");
        buttonContainer.classList.add("sort-buttons-container");

        const sortButtonHTML = '<button class="sortButton" id="sortAchievementsButton">时间升序</button>';
        buttonContainer.innerHTML += sortButtonHTML;

        const sortIDButtonHTML = '<button class="sortButton" id="sortAchievementsIDButton">ID升序</button>';
        buttonContainer.innerHTML += sortIDButtonHTML;

        const sortCountButtonHTML = '<button class="sortButton" id="sortAchievementsCountButton">稀有度升序</button>';
        buttonContainer.innerHTML += sortCountButtonHTML;

        $(".content-box").append(buttonContainer);
        for (var i = 0; i < datas.length; i++) {
            var houseInfo = datas[i];
            addAchievementTable(houseInfo.id, houseInfo.name, houseInfo.desc, houseInfo.time, event.data.AchievementsCount[i]);
        }
        $("#sortAchievementsButton").on("click", function () {
            sortAchievementsByTime();
        });
        $("#sortAchievementsIDButton").on("click", function () {
            sortAchievementsById();
        });
        $("#sortAchievementsCountButton").on("click", function () {
            sortAchievementsByCount();
        });
    }
})

function getTime() {
    const localDateTime = new Date();
    const shanghaiTimeZone = 'Asia/Shanghai';
    const options = { timeZone: shanghaiTimeZone, year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric' };
    const shanghaiDateTimeString = localDateTime.toLocaleString('zh-CN', options);
    return shanghaiDateTimeString
}

function closeButton() {
    closeHUD();
}

$(document).keyup(function (e) {
    if (e.keyCode === 27) {
        closeHUD()
    }
})

function addTable(name, amount) {
    $(".content-box").append(`
        <div class="table-row">
            <div class="table-data-name">${name}</div>
            <div class="table-data-amount">${amount}</div>
        </div>
    `);
}

function addCarTable(name, plate, distance, status) {
    $(".content-box").append(`
        <div class="table-car">
            <img src="./assets/vehicles/${name}.png" class="car-img"></img>
            <div class="car-info">
                <p class="model">车型:${name}(${plate})</p>
                <p class="distance"><i class="fa-solid fa-road" style="color:#dd9501;"></i>里程:${distance}</p>
                <p class="status"><i class="fa-solid fa-car-side" style="color:#dd9501;"></i>状态:${status}</p>
            </div>
            <button class="middle-right-button" id="${plate}" onclick="getCar(this.id)">定位</button>
        </div>
    `);
}

function addHouseTable(id, name) {
    $(".content-box").append(`
        <div class="table-house">
            <div class="car-info">
                <p class="model" style="color:white;">门牌号:${name}</p>
                <p class="distance" style="color:white;"><i class="fa-solid fa-house-chimney-user" style="color:#dd9501;"></i>房屋:${id}</p>
            </div>
            <button class="middle-right-button" id="${id}" onclick="getLocation(this.id)">定位</button>
        </div>
    `);
}

function addAchievementTable(id, name, desc, time, count) {
    if (time == 'none') {
        time = '(未获得)'
    } else {
        time = '(获得时间:' + time + ')'
    }
    $(".content-box").append(`
        <div class="table-achievement" id="${id}">
            <img src="./assets/achievement/${id}.png" class="achievement-img"></img>
            <div class="car-info">
                <div class="model-container">
                    <p class="model" style="color:white;">${name}<div class="achi_time" style="color:green;">${time}</div><div class="achi_count" style="color:white; display: inline-block;">拥有的玩家<div class="achi_count2" style="color:green; display: inline-block;">${count}</div>%</div></p>
                </div>
                <p class="distance" style="color:white;"><i class="fa-solid fa-star" style="color:#dd9501;"></i>${desc}</p>
            </div>
        </div>
    `);
}

let sortTime = false;
function sortAchievementsByTime() {
    let sortButtonHTML = '<button class="sortButton" id="sortAchievementsButton">时间升序</button>';
    if (sortTime) {
        sortButtonHTML = '<button class="sortButton" id="sortAchievementsButton">时间降序</button>';
    }
    const $achievementTables = $(".table-achievement");

    sortTime = !sortTime;
    // Convert tables to an array and sort them based on time
    const sortedAchievements = [...$achievementTables].sort((a, b) => {
        const timeA = $(a).find(".achi_time").text(); // Get the time text from the progress bar
        const timeB = $(b).find(".achi_time").text();

        // Parse the time text into a Date object for comparison
        const dateA = timeA === '未获得' ? new Date(0) : new Date(timeA.substring(6, timeA.length - 1));
        const dateB = timeB === '未获得' ? new Date(0) : new Date(timeB.substring(6, timeB.length - 1));

        if (sortTime) {
            return dateA - dateB; // Ascending order
        } else {
            return dateB - dateA; // Descending order
        }
    });
    // Empty the content-box and append the sorted tables
    $(".content-box").find(".table-achievement").remove();
    $("#sortAchievementsButton").replaceWith(sortButtonHTML);
    $(".content-box").append(sortedAchievements);

    // Add a click event handler to the new button for further sorting
    $("#sortAchievementsButton").on("click", function () {
        sortAchievementsByTime();
    });
}

let sortId = false;
function sortAchievementsById() {
    let sortButtonHTML = '<button class="sortButton" id="sortAchievementsIDButton">ID升序</button>';
    if (!sortId) {
        sortButtonHTML = '<button class="sortButton" id="sortAchievementsIDButton">ID降序</button>';
    }
    $("#sortAchievementsIDButton").replaceWith(sortButtonHTML);
    sortId = !sortId;
    const $achievementTables = $(".table-achievement");

    // Sort the array based on the "id" attribute
    const sortedAchievements = [...$achievementTables].sort((a, b) => {
        var idA = parseInt($(a).attr("id"));
        var idB = parseInt($(b).attr("id"));
        if (sortId) {
            return idB - idA;
        } else {
            return idA - idB;
        }
    });

    $(".content-box").find(".table-achievement").remove();

    $(".content-box").append(sortedAchievements);
    $("#sortAchievementsIDButton").on("click", function () {
        sortAchievementsById();
    });
}

let sortCount = false;
function sortAchievementsByCount() {
    let sortButtonHTML = '<button class="sortButton" id="sortAchievementsCountButton">稀有度升序</button>';
    if (!sortCount) {
        sortButtonHTML = '<button class="sortButton" id="sortAchievementsCountButton">稀有度降序</button>';
    }
    $("#sortAchievementsCountButton").replaceWith(sortButtonHTML);
    sortCount = !sortCount;
    const $achievementTables = $(".table-achievement");

    // Sort the array based on the "id" attribute
    const sortedAchievements = [...$achievementTables].sort((a, b) => {
        const countA = $(a).find(".achi_count2").text(); // Get the time text from the progress bar
        const countB = $(b).find(".achi_count2").text();
        if (sortCount) {
            return countB - countA;
        } else {
            return countA - countB;
        }
    });

    $(".content-box").find(".table-achievement").remove();

    $(".content-box").append(sortedAchievements);
    $("#sortAchievementsCountButton").on("click", function () {
        sortAchievementsByCount();
    });
}

function getCar(id) {
    $.post(`https://${GetParentResourceName()}/findCar`, JSON.stringify({ plate: id }))
}

function getLocation(id) {
    $.post(`https://${GetParentResourceName()}/findHouse`, JSON.stringify({ id: id }))
}

function addMessage(message) {
    $(".content-box").append(`
        <p class="message">${message}</p>
    `);
}

function changeButton(id) {
    $(".content-box").empty();
    if (id == 0) {
        for (const key in Names[id]) {
            if (Names[id].hasOwnProperty(key)) {
                const value = Names[id][key];
                addTable(value, data[id][key]);
            }
        }
    } else if (id == 1) {
        if (data[id] == undefined) {
            addMessage('你没有车辆');
        } else {
            addMessage('车辆:' + data[id].length);
            for (var i = 0; i < data[id].length; i++) {
                var vehicleInfo = data[id][i];
                addCarTable(vehicleInfo.model, vehicleInfo.plate, vehicleInfo.distance, vehicleInfo.status);
            }
        }
    } else if (id == 2) {
        $.post(`https://${GetParentResourceName()}/getHouses`)
    } else if (id == 3) {
        addMessage('你没有产业');
    } else if (id == 4) {
        addMessage('维护中...');
    } /* else if (id == 5) {
        addMessage('维护中...');
    } */ else if (id == 5) {
        $.post(`https://${GetParentResourceName()}/getAchievement`)
    }
}

function handleButtonClick(button) {
    var buttons = document.querySelectorAll(".button");
    buttons.forEach(function (btn) {
        btn.classList.remove("selected-button");
    });
    button.classList.add("selected-button");
    for (let i = 0; i < buttons.length; i++) {
        if (buttons[i].classList.contains("selected-button")) {
            changeButton(i);
        }
    }
}

function closeHUD() {
    $(".container").fadeOut(250)
    $.post(`https://${GetParentResourceName()}/menuClosed`)
}

$(document).ready(function () {
    $('#closeButton').click(function () {
        closeHUD();
    });
});