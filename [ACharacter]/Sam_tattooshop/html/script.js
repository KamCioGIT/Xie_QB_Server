var clientId = null
var categories = null
var clientIsFemale = false
var tattooList = {}
var catNumber = 0
var selectedCategory = null
var selectedTattoo = null

window.addEventListener('message', function(event){
    var item = event.data;
    if (item.action == "show") {
        $("body").css("display", "block");
        if (item.clientId) {
            clientId = item.clientId
        }
        categories = item.categories
        clientIsFemale = item.isFemale
        tattooList = item.TattooList
        loadCategories();
        $('.headerName').text(translate.header_tattoo);
        $('.headerShop').text(translate.header_shop);
    }
    if (item.action == "hide") {
        $("body").css("display", "none");
    }
    if (item.action == "openAgain") {
        $("body").css("display", "block");
    }
    if (item.action == "updateui") {
        tattooList = item.TattooList
        loadCategory(item.collection, catNumber);
    }
});

$("#hide").click(function() {
    if (clientId) {
        $.post('https://Sam_tattooshop/hide', JSON.stringify({clientId: clientId}));
        clientId = undefined
    } else {
        $.post('https://Sam_tattooshop/hide');
    }
    $('.optionsCircle').empty();
    $("#panelInside").empty();
})

$(document).on('click', '#remove', function(e){
    var collection = $(this).data("collection");
    var id = $(this).data("tattooid");
    if (clientId) {
        $.post('https://Sam_tattooshop/remove', JSON.stringify({
            clientId: clientId,
            collection: collection,
            id: id
        }));
    } else {
        $.post('https://Sam_tattooshop/remove', JSON.stringify({
            collection: collection,
            id: id
        }));
    }
})

$(document).on('click', '#buy', function(e){
    var collection = $(this).data("collection")
    var id = $(this).data("tattooid")
    if (clientId) {
        $.post('https://Sam_tattooshop/buy', JSON.stringify({
            clientId: clientId,
            collection: collection,
            id: id
        }));
    } else {
        $.post('https://Sam_tattooshop/buy', JSON.stringify({
            collection: collection,
            id: id
        }));
    }
})

$(document).on('click', '#show', function(e){
    if (selectedTattoo && JSON.stringify(selectedTattoo) == JSON.stringify($(this))) {
        if (clientId) {
            $.post('https://Sam_tattooshop/reloadThis', JSON.stringify({
                item: $(this).data("tattooid"),
                collection: $(this).data("collection"),
                clientId: clientId,
            }));
        } else {
            $.post('https://Sam_tattooshop/reloadThis', JSON.stringify({
                item: $(this).data("tattooid"),
                collection: $(this).data("collection")
            }));
        }
        return
    }
    if (selectedTattoo) {
        $(selectedTattoo).removeClass("tattoo-selected");
    }
    selectedTattoo = $(this)
    var collection = $(this).data("collection")
    var id = $(this).data("tattooid")
    $(selectedTattoo).addClass("tattoo-selected");

    if (clientId) {
        $.post('https://Sam_tattooshop/change', JSON.stringify({
            item: id,
            collection: collection,
            clientId: clientId,
        }));
    } else {
        $.post('https://Sam_tattooshop/change', JSON.stringify({
            item: id,
            collection: collection
        }));
    }
})

function loadCategory(typeDlc, numberOfSelected) {
    var type = typeDlc
    var catNumber = numberOfSelected
    if (clientId) {
        $.post('https://Sam_tattooshop/switchCategory', JSON.stringify({clientId: clientId}));
    } else {
        $.post('https://Sam_tattooshop/switchCategory')
    }
    $("#panelInside").empty()
    $("#panelInside").html(`
        <div>
            <div style="width: 92%;margin-left: auto;margin-right: auto;margin-top: 5%;height: 45%;background-color: rgb(25, 25, 25);border-radius: 12px;">
                <div style="display: inline-flex;margin: 10px;width: 100%;">
                    <div style="margin-right: 15px;width: 100%;">
                        <p style="font-family: 'Montserrat', sans-serif;text-align:left;color: #dededef9;font-size:15px">${translate.category}<b>${catNumber}</b></p>
                        <div class="tattoosCategories">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    `)
    for (const [key, value] of Object.entries(tattooList[`${type}`])) {
        if (!clientIsFemale && value.nameHashMale || clientIsFemale && value.nameHashFemale) {
            var itemPrice = (value.hasTattoo && value.removePrice || value.price)
            var baseTattoosMenu = `
                <div style="width: 100%;height: 2vw;">
                    <div style="display: flex;width: 100%;">
                        <p style="font-family: 'Montserrat', sans-serif;font-weight: bold;color: white;width: inherit;margin-block: 5px;">${value.label}</p>
                    <div>
                    <div style="display: flex;">
                        <div style="color: white;padding-inline: 22px;height: 30px;background: #ffffff17;border-radius: 5px;margin-inline: 4px;">
                            <p style="font-family: 'Montserrat', sans-serif;color: white;margin-block: 4px;color: greenyellow;text-shadow: 0px 0px 5px rgba(172, 255, 47, 0.543);">$${itemPrice}</p>
                        </div>`
            if (value.hasTattoo) {
                baseTattoosMenu = baseTattoosMenu + `
                    <div id="remove" data-tattooid="${key}" data-collection="${type}">
                        <i style="color: white;margin-block: 7px" class="fa-solid fa-trash"></i>
                    </div>
                `
            } else {
                baseTattoosMenu = baseTattoosMenu + `
                    <div id="buy" data-tattooid="${key}" data-collection="${type}">
                        <i style="color: white;margin-block: 7px" class="fa-solid fa-dollar-sign"></i>
                    </div>
                `
            }
            baseTattoosMenu = baseTattoosMenu + `
                        <div id="show" data-tattooid="${key}" data-collection="${type}"">
                            <i style="color: white;margin-block: 7px;" class="fa-solid fa-eye"></i>
                        </div>
                    </div>
                </div>
            `
            $(".tattoosCategories").append(baseTattoosMenu)
        }
    }
    if (selectedTattoo) {
        $(selectedTattoo).addClass("tattoo-selected");
    }
}

function loadCategories() {
    if (!categories) return
    if (categories['1']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpbusiness_overlays" data-number="1"><p>1</p></div>`);
    if (categories['2']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mphipster_overlays" data-number="2"><p>2</p></div>`);
    if (categories['3']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpbiker_overlays" data-number="3"><p>3</p></div>`);
    if (categories['4']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpairraces_overlays" data-number="4"><p>4</p></div>`);
    if (categories['5']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpbeach_overlays" data-number="5"><p>5</p></div>`);
    if (categories['6']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpchristmas2_overlays" data-number="6"><p>6</p></div>`);
    if (categories['7']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpgunrunning_overlays" data-number="7"><p>7</p></div>`);
    if (categories['8']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpimportexport_overlays" data-number="8"><p>8</p></div>`);
    if (categories['9']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mplowrider2_overlays" data-number="9"><p>9</p></div>`);
    if (categories['10']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mplowrider_overlays" data-number="10"><p>10</p></div>`);
    if (categories['11']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpchristmas2017_overlays" data-number="11"><p>11</p></div>`);
    if (categories['12']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpheist3_overlays" data-number="12"><p>12</p></div>`);
    if (categories['13']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpheist4_overlays" data-number="13"><p>13</p></div>`);
    if (categories['14']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpluxe_overlays" data-number="14"><p>14</p></div>`);
    if (categories['15']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpluxe2_overlays" data-number="15"><p>15</p></div>`);
    if (categories['16']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpsecurity_overlays" data-number="16"><p>16</p></div>`);
    if (categories['17']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpsmuggler_overlays" data-number="17"><p>17</p></div>`);
    if (categories['18']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpstunt_overlays" data-number="18"><p>18</p></div>`);
    if (categories['19']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpsum2_overlays" data-number="19"><p>19</p></div>`);
    if (categories['20']) $(".optionsCircle").append(`<div class="itemCircle" data-type="mpvinewood_overlays" data-number="20"><p>20</p></div>`);
    if (categories['21']) $(".optionsCircle").append(`<div class="itemCircle" data-type="vms_overlays" data-number="21"><p>21</p></div>`);
    if (categories['22']) $(".optionsCircle").append(`<div class="itemCircle" data-type="multiplayer_overlays" data-number="22"><p>22</p></div>`);
    
    $(".itemCircle").click(function() {
        if (selectedCategory) {
            $(selectedCategory).removeClass("category-selected");
        }
        selectedCategory = $(this)
        $(selectedCategory).addClass("category-selected");
        var type = $(this).data("type")
        catNumber = $(this).data("number")
        selectedTattoo = null
        loadCategory(type, catNumber)
    })
}