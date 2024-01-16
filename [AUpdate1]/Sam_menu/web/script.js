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