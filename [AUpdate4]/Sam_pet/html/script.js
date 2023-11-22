data = ""
buyId = 0
index = 0
pedPrimaryId = 0
pedPrimarynetID = 0
let showInfo = true

var id
var petPrice
var petName
var petLabel
var pedHash
var petGender
var petHungryLevel
var petThirstLevel
var petEnergyLevel
var petHealthLevel
var petLevel 
var hungryDecrase
var thirstDecrase
var petBoughtAnim
var petTexureID
var animalList
var petXP = 0
var lastXP = 100
var isOutSide
var mynetID
var interactBool = false
var screen = ""
var petLength = 0
var secondData = ""

const interactionKeyDOM = document.getElementsByClassName("pet-bg")[0];

let interactionKeyOpened = false;
window.addEventListener("message",function (e) {  
  action = e.data.action  
  data = e.data.petlist
  const coordX = e.data.coordX;
  const coordY = e.data.coordY;
  switch (action) {
    case "OPEN_BOUGHTSCREEN":
      screen = "OPEN_BOUGHTSCREEN"
      return buyMenu(data,e.data.secondhand)
    case "MY_PETS":
      screen = "MY_PETS"
      petLength = data.length
      return myPet(data,0,"first")  ;
    case "SHOW_KEY":
      return openInteractionKey(coordX, coordY, e.data.petName,e.data.petLevel,e.data.petIMG,e.data.petHungryLevel, e.data.petThirstLevel, e.data.petEnergyLevel, e.data.petHealthLevel, e.data.petGender, e.data.vehicleSeat, e.data.showInfo,e.data.Locales);
    case "CLOSE_KEY":
      return closeInteractionKey();
    case "OPEN_CONTROLPANEL":
      return openControlMenu(e.data.data, e.data.Locales, e.data.Orders, e.data.ManualMode, e.data.isSelling)
    case "SHOW_NOTIFY":
      return systemNotify(e.data.message,e.data.level,e.data.Locales)
    }
})


$(".petleft").click(function (e) { 
  index = index  - 1
  if (index<0) {
    index = 0
  }else{
    myPet(data,index,"left")
  }
});

$(".petright").click(function (e) { 
  console.log(index);
  index = index  + 1
  if (index>petLength-1) {
    index = petLength-1
  }else{
    myPet(data,index,"right")
  }
});



systemNotify = function(message,level,Locales) {
  console.log(message);
  Locales = Locales
  $(".levelup-headerside-text").text("")
  $(".levelup-skill-headerside-level").text("")
  $(".levelup-headerside-level").text("")
  $('.levelup-bottomside').text(message)
  if (level !== undefined) {
      $(".levelup-headerside-text").text("LEVEL UP!")
      $(".levelup-headerside-level").text(level)
  }
  $(".levelup-notify").animate({top: "75vh"},2000, function() {
      $(".levelup-notify").animate({top: "105vh"}, 1600)
  });
}


function myPet(data,index,direction) {
  $(".clothPage").hide()
  $(".petright").show()
  $(".petleft").show()
  id = data[index].id
  petName = data[index].petName
  petLabel = data[index].petLabel
  petHungryLevel = data[index].petHungryLevel
  petThirstLevel = data[index].petThirstLevel
  petEnergyLevel = data[index].petEnergyLevel
  petHealthLevel = data[index].petHealthLevel
  petGender = data[index].petgender
  petLevel = data[index].petlevel
  pedHash = data[index].pedhash
  hungryDecrase = data[index].hungrydecrase
  thirstDecrase = data[index].thirstdecrase
  animalList = data[index].listOf
  listOf = data[index].listOf
  petTexureID = data[index].pettexureid
  isOutSide = data[index].isOutSide
  mynetID = data[index].netID
  if (data[index].isOutSide==1) {
    $(".takeaway,.takeawaytext,.petright,.petleft").show()
    $(".take,taketext").hide()
  }else{
    $(".take,.taketext").show()
    $(".takeawaytext,.takeaway").hide()
  }
  if (direction=="right") {
    setTimeout(() => {
      $(".pet-face").attr("src",`${data[index].petIMG}`);
    }, 500);
    $(".pet-face").animate({ left: `-25rem` }, 400, function () {
      $(".pet-face").css('opacity','0')
      $(".pet-face").css('left','25rem')
      $(".pet-face").css('opacity','1')
    })
    $(".pet-face").animate({ left: `7rem` }, 400, function () {})    
  }else if(direction=="left"){
    setTimeout(() => {
      $(".pet-face").attr("src",`${data[index].petIMG}`);
    }, 500);
    $(".pet-face").animate({ left: `25rem` }, 400, function () {
      $(".pet-face").css('opacity','0')
      $(".pet-face").css('left','-25rem')
      $(".pet-face").css('opacity','1')
    })
    $(".pet-face").animate({ left: `7rem` }, 400, function () {})    
  }else{
    $(".pet-face").attr("src",`${data[index].petIMG}`);

    $(".pet-face").animate({ opacity: `1` }, 1200, function () {
      // $(".pet-face").animate({ top: `1rem` }, 500, function () {})
    })
  }
  $(".healthdata").animate({ width: `${data[index].petHealthLevel*4+50}` }, 550, function () {})
  $(".enerjidata").animate({ width: `${data[index].petEnergyLevel*4+50}` }, 550, function () {})
  $(".damladata").animate({ width: `${data[index].petThirstLevel*4+50}` }, 550, function () {})
  $(".kemikdata").animate({ width: `${data[index].petHungryLevel*4+50}` }, 550, function () {})
  $("body,.pet-select,.buy").fadeIn(200)
  
  $(".pet-buymenu,.notbuy,.pet-left").hide()
  $(".pet-name").html(data[index].petName)
  $(".pet-info").html($(this).data("info"))
  $(".healthdata").css(`width`,`${data[index].petHealthLevel*4+50}`)
  $(".enerjidata").css(`width`,`${data[index].petEnergyLevel*4+50}`)
  $(".kemikdata").css(`width`,`${data[index].petHungryLevel*4+50}`)
  $(".damladata").css(`width`,`${data[index].petThirstLevel*4+50}`)
  $(".agetext").html(`Age: <span style="color: white;font-family: SF-Pro-Display;">${data[index].petAge}</span>`)
  $(".leveltext").html(`Lv: <span style="color: white;font-family: SF-Pro-Display;">${data[index].petLevel}</span>`)
  $(".sextext").html(`<span style="color:gray;font-family: SF-Pro-Display;">Sex:</span> ${data[index].petGender}`)
  // $(".home,.top,.item-box,.bottom-icon,.buy-bg").fadeOut(500)
  $(".take").data("netID", data[index].netID);
  $(".take").data("id", data[index].id);
  $(".takeaway").data("netID", data[index].netID);
  $(".takeaway").data("id", data[index].id);
}

const openControlMenu = (data,Locales, Orders, ManualMode, isSelling) => {
  $(".pet-bg").css("opacity","100%")
  $(".opList").empty();
  $(".pet-operations").show();
  // let energy = Math.ceil(data.petEnergyLevel);
  // var r = document.querySelector(":root");
  document.querySelector(":root").style.setProperty("--value1", Math.ceil(data.petHungryLevel));
  document.querySelector(":root").style.setProperty("--value2", Math.ceil(data.petEnergyLevel));
  document.querySelector(":root").style.setProperty("--value3", Math.ceil(data.petHealthLevel));
  document.querySelector(":root").style.setProperty("--value4", Math.ceil(data.petThirstLevel));

  $(".dogface").attr("src",`${data.petIMG}`);

  $.each(Orders, function (i, v) {
      if (data.listOf == v.listOf) {
              if (data.petHealthLevel >= 3) {
                  if (data.petLevel >= v.level) {
                      clickable = true
                      style = "display:none;"
                  } else {
                      clickable = false
                      style = "display:block;"
                  }
              } else {
                  clickable = false
                  style = "display:block;"
              }
              $(".opList").append(`
              <div data-netid=${Number(data.netID)} data-animaltype="${v.listOf}" data-event="${v.args}" data-clickable=${clickable} class="opitem">
              <div style="${style}" class="level">
                <img class="lockkknk" src="../images/lock.png" alt="">
                <div class="levelnumber">${v.level}</div>
              </div>
              <div style="${style}" class="test"></div>
              <div class="opitembg"></div>
              <img class="nonselectbg" src="../images/nonselectop.png" alt="">
              <div class="opdot" style="${v.dotStyle}" ></div>
              <div class="optext" style="${v.textStyle}">${v.label}</div>
              <img class="knks" src="${v.svg}" alt="">
            </div>
              `)
          
      }
      // $(".pet-operations .box .opList").append(orderHTML);
      $('.opitem').click(function (e) { 
        e.preventDefault();
        eventName = $(this).attr('data-event')
        animalType = $(this).attr('data-animaltype') 
        animalNetworkID = $(this).attr('data-netid') 
        clickable = $(this).attr('data-clickable') 
        if (eventName=="lab-pet:client:backPet") {
          $(".pet-bg").css("opacity","0%")
        }
        if (clickable == "true") {
            $.post("https://Sam_pet/setEvent", JSON.stringify({eventName,animalType,animalNetworkID}));
        }
      });
  });
}

let number = 0;
let texture = 0;
let type = "";

$(document).on('click', '.setcloth', function(e){
  const direction = $(this).data("direction");
  type = $(this).data("type");

  if (type === "hat") {
    number = (direction === "right") ? Math.min(number + 1, 2) : Math.max(number - 1, 0);
    $("#hatinput").val(number);
    $(".hatcount").html(`${number}/2`);
  }else if(type=="leash"){
    number = (direction === "right") ? Math.min(number + 1, 2) : Math.max(number - 1, 0);
    $("#leashinput").val(number);
    $(".leashcount").html(`${number}/2`);
  }else if(type=="glasses"){
    number = (direction === "right") ? Math.min(number + 1, 2) : Math.max(number - 1, 0);
    $("#glassesinput").val(number);
    $(".glassescount").html(`${number}/2`);

  }

  $.post("https://Sam_pet/setcloth", JSON.stringify({ type, number, texture }));
});

$(document).on('click', '.settexture', function(e){
  const direction = $(this).data("direction");
  let category = $(this).data("category");
  if (category=="hat") {
    texture = (direction === "right") ? Math.min(texture + 1, 8) : Math.max(texture - 1, 0);
    $(".hattexture").val(texture);
    $(".hattexturecount").html(`${texture}/8`); 
  }else if(category == "leash"){
    texture = (direction === "right") ? Math.min(texture + 1, 6) : Math.max(texture - 1, 0);
    $(".leashtexture").val(texture);
    $(".leashtexturecount").html(`${texture}/6`);
  }else if(category == "glasses"){
    texture = (direction === "right") ? Math.min(texture + 1, 6) : Math.max(texture - 1, 0);
    $(".glassestexture").val(texture);
    $(".glassestexturecount").html(`${texture}/6`);
  }
  $.post("https://Sam_pet/setcloth", JSON.stringify({ type, number, texture }));
});


const openInteractionKey = (coordX, coordY,petName,petLevel,petIMG,petHungryLevel, petThirstLevel, petEnergyLevel, petHealthLevel, petGender, vehicleSeat, showInfo, Locales) => {
  interactBool = true
  $('body').show()
  $(".pet-select,.buy,.all,.pet-buymenu").hide()
  Locales = Locales
  $('.pet-interacttext').html('You must press <span style="color: white;font-family: SF-Pro-Display;">E</span>  to interact')
  if (petIMG !== undefined) {
      $('.pet-img').css({'background-image':'url('+petIMG+')'})
  } else {
    $('.pet-img').css({'background-image':'url(./unkownpet.png)'})
  }
  showInfo = showInfo
  if (!vehicleSeat) {

      if (showInfo) {
          if (interactionKeyOpened) {
              interactionKeyDOM.style.left = coordX*100+"%";
              interactionKeyDOM.style.right = (100 - coordX*100)+"%";
              interactionKeyDOM.style.top = coordY*100+"%";
              interactionKeyDOM.style.bottom = (100 - coordY*100)+"%";
          }
          else {
              interactionKeyDOM.style.left = coordX*100+"%";
              interactionKeyDOM.style.right = (100 - coordX*100)+"%";
              interactionKeyDOM.style.top = coordY*100+"%";
              interactionKeyDOM.style.bottom = (100 - coordY*100)+"%";
              
              interactionKeyOpened = true;
              interactionKeyDOM.classList.add("fadeIn");
              setTimeout(function(){
                  interactionKeyDOM.classList.remove("fadeIn");
                  interactionKeyDOM.style.opacity = 1
              }, 1000);
          }
      }
  }
}


$(document).on('keydown', function () {
  switch (event.keyCode) {
    case 69:
      if (interactionKeyOpened) {
        $(".pet-operations").fadeIn(500)
        $(".pet-operations").show()
      }else{
        $(".pet-operations").fadeOut(500)
      }
  }
});

$(document).on('keydown', function () {
  switch (event.keyCode) {
    case 27:
      if (interactionKeyOpened || interactBool) {
        $(".pet-operations").hide()
        $(".pet-bg").css("opacity","0%")
        frknNuiClose()
      }else if(screen=="OPEN_BOUGHTSCREEN"){
        $("body").hide()
        $(".first").show()
        frknNuiClose()
      }else if(screen=="MY_PETS"){
        $(".pet-select").fadeOut(500)
        $("body").fadeOut(500)
        frknNuiClose()
      }
    }
});


$(document).on('keydown', function () {
  switch (event.keyCode) {
    case 8:
      if (interactBool) {
        $(".pet-bg").css("opacity","0%")
        $(".pet-operations").hide()
        frknNuiClose()
      }
    }
});



const closeInteractionKey = () => {
  interactBool = false
  if (showInfo) {
    $(".pet-operations").hide()
      interactionKeyOpened = false;
      interactionKeyDOM.classList.add("fadeOut");
      setTimeout(function(){
          interactionKeyDOM.classList.remove("fadeOut");
          interactionKeyDOM.style.opacity = 0
      }, 1000);
  }
  frknNuiClose();
};



const cancelMenu = () => {
  boughtMenu = false

  $('.pet-mypetsmenu').css({'opacity':'0'})
  $('.pet-mypetsmenu').css({'display':'none'})

  $('.pet-boughtmenus').css({'opacity':'0'})
  $('.pet-boughtmenus').css({'display':'none'})
  if (side["controlPanel"]) {
      showMenus("controlPanel", "pet-interaction")
  }
  if (side["interactionPanel"]) {
      showMenus("interactionPanel", "pet-input-area")

  }
  // showMenus()
  $.post(`https://${GetParentResourceName()}/closeMenu`);
};

const frknNuiClose = () => {
  $.post(`https://${GetParentResourceName()}/closeMenu`);
}

function test(x) {
    $(".selectbg").hide()
  $(x).children(".selectbg").show()
}

function cl(x) {
  // $(".selectbg").hide()
}

function buyMenu(data,secondhand) {
  secondData = secondhand
  console.log(JSON.stringify(secondhand));
  $(".pet-face").animate({ opacity: `1` }, 1200, function () {
    // $(".pet-face").animate({ top: `1rem` }, 500, function () {})
  })
  $("body,.pet-buymenu,.notbuy,.pet-left,.top,.item-box,.bottom-icon,.buy-bg").show()
  $(".pet-select,.buy,.petright,.petleft").hide()
  $(".item-box").empty()
  $.each(data["Dogs"], function (i, v) { 
    $(".item-box").append(`
    <div data-id="${i}" data-type="${v.listOf}" data-name="${v.petName}" data-info="${v.petLabel}" data-level="${v.petLevel}"  data-health="${v.healthRatio}" data-energy="${v.energyRatio}" data-hunger="${v.hungryRatio}" data-thrist="${v.thirstRatio}" data-img="${v.img}" data-selectimg ="${v.selectimg}"data-sex="${v.petGender}" data-age="${v.petAge}" data-hash = "${v.pedHash}"data-petBoughtAnim = "${v.petBoughtAnim}" onmouseover="test(this)" onmouseout="cl(this)"   class="item">
          <img class="itembg" src="${v.dogBg}" alt="">
          <img class="itemborder" src="${v.dogPpBorder}" alt="">
          <img class="selectbg" src="../images/newitembg.png" alt="">
          <img src="${v.img}" class="dogimg" alt="">
          <img src="${v.feet}" class="dogicon" alt="">
          <div class="dogname">${v.petName}</div>
          <div class="desc">Horem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.
          </div>
          <div style="color:${v.priceColor}" class="price">$24.000</div>
          <img data-id="${i}" data-type="${v.listOf}" data-name="${v.petName}" data-info="${v.petLabel}" data-level="${v.petLevel}"  data-health="${v.healthRatio}" data-energy="${v.energyRatio}" data-hunger="${v.hungryRatio}" data-thrist="${v.thirstRatio}" data-img="${v.img}" data-selectimg ="${v.selectimg}"data-sex="${v.petGender}" data-age="${v.petAge}" data-hash = "${v.pedHash}"data-petBoughtAnim = "${v.petBoughtAnim}" src="../images/group-299.png" class="soru" alt="">
        </div>
        `)     
      });
}


$(document).on('click', '.item', function(e){
  $(".selectbg").hide()
  $(this).children(".selectbg").show()

  pedHash = $(this).data("hash")
  animalList = $(this).data("type")
  petBoughtAnim = $(this).data("petBoughtAnim")
  buyId = $(this).data("id")
  $.post("https://Sam_pet/changePet", JSON.stringify({pedHash,animalList, petBoughtAnim}),function (x) {  });
});

$(document).on('click', '.mama', function(e){
  //  SATIŞ SİSTEMİ YAZILACAK SONRA FİNİTO
});





spawn = ""
$(".take").click(function (e) {
  spawn = "takeout"
  $.post("https://Sam_pet/spawnPet", JSON.stringify({id,mynetID, petName,petLabel,petHungryLevel,petThirstLevel,petEnergyLevel,petHealthLevel,petGender,petLevel,pedHash,hungryDecrase,thirstDecrase,animalList,listOf, petXP, lastXP,petTexureID,spawn}),function (x) {})  
  $("body").hide()
  $(".take,.taketext").hide()
  $(".takeawaytext,.takeaway").show()
});

$(".takeaway").click(function (e) {
  spawn = "takeaway"
  $.post("https://Sam_pet/spawnPet", JSON.stringify({id,mynetID, petName,petLabel,petHungryLevel,petThirstLevel,petEnergyLevel,petHealthLevel,petGender,petLevel,pedHash,hungryDecrase,thirstDecrase,animalList,listOf, petXP, lastXP,petTexureID,spawn}),function (x) {})  
  $("body").hide()
  $(".takeaway,.takeawaytext").hide()
  $(".take,taketext").show()
});

function sus(x){
  console.log("sdgds");
  $(".item .itembg").attr('src','../images/itembg.png');
  $(".item-sus2").css('display','none');
  $(".item-sus").css('display','none');
  $($(x).children('.itembg')).attr('src','../images/itembgclick.png');
  $($(x).children('.item-sus2')).css('display','block');
  $($(x).children('.item-sus')).css('display','block');
}


function close() {
  $("body").hide()
}

$(".setbg").click(function (e) { 
  $(".item-box").empty();
  $.each(data[$(this).data("category")], function (i, v) { 
    $(".item-box").append(`
    <div onmouseover="test(this)" data-id="${i}" data-type="${v.listOf}" data-name="${v.petName}" data-info="${v.petLabel}" data-level="${v.petLevel}"  data-health="${v.healthRatio}" data-energy="${v.energyRatio}" data-hunger="${v.hungryRatio}" data-thrist="${v.thirstRatio}" data-img="${v.img}" data-selectimg ="${v.selectimg}"data-sex="${v.petGender}" data-age="${v.petAge}" data-hash = "${v.pedHash}"data-petBoughtAnim = "${v.petBoughtAnim}" onmouseout="cl(this)"   class="item">
    <img class="itembg" src="${v.dogBg}" alt="">
    <img class="itemborder" src="${v.dogPpBorder}" alt="">
    <img class="selectbg" src="../images/newitembg.png" alt="">
    <img src="${v.img}" class="dogimg" alt="">
    <img src="${v.feet}" class="dogicon" alt="">
    <div class="dogname">${v.petName}</div>
    <div class="desc">Horem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.
    </div>
    <div style="color:${v.priceColor}" class="price">$24.000</div>
    <img data-id="${i}" data-type="${v.listOf}" data-name="${v.petName}" data-info="${v.petLabel}" data-level="${v.petLevel}"  data-health="${v.healthRatio}" data-energy="${v.energyRatio}" data-hunger="${v.hungryRatio}" data-thrist="${v.thirstRatio}" data-img="${v.img}" data-selectimg ="${v.selectimg}"data-sex="${v.petGender}" data-age="${v.petAge}" data-hash = "${v.pedHash}"data-petBoughtAnim = "${v.petBoughtAnim}" src="../images/group-299.png" class="soru" alt="">
  </div>
        `)     
      });
});



$(document).on('click', '.setbg', function(e){
  $('.categoryRect').attr('style',"fill:#181818")
  $('.categoryPath').attr('style',"fill:#616161")
  $($(this).children('rect')).attr('style',"fill:white")
  $($(this).children('path')).attr('style',"fill:#7C71FB")
});

$(document).on('click', '.basketsvg', function(e){
  $(this).children('.setbasket').attr('style',"fill:gray")
  setTimeout(() => {
    $(this).children('.setbasket').attr('style',"fill:#181818")
  }, 100);
  if (secondData != "") {
    $(".item-box").empty()
    $.each(secondData, function (i, v) { 
      $(".item-box").append(`
      <div data-id="none" data-type="${v.listOf}" data-name="${v.petName}" data-info="${v.petLabel}" data-level="${v.petLevel}"  data-health="${v.healthRatio}" data-energy="${v.energyRatio}" data-hunger="${v.hungryRatio}" data-thrist="${v.thirstRatio}" data-img="${v.img}" data-selectimg ="${v.selectimg}"data-sex="${v.petGender}" data-age="${v.petAge}" data-hash ="${v.petHash}"data-petBoughtAnim = "${v.petBoughtAnim}" onmouseover="test(this)" onmouseout="cl(this)"   class="item">
            <img class="itembg" src="../images/dogbg1.png" alt="">
            <img class="itemborder" src="../images/dog1border.png" alt="">
            <img class="selectbg" src="../images/newitembg.png" alt="">
            <img src="${v.petIMG}" class="dogimg" alt="">
            <img src="${v.feet}" class="dogicon" alt="">
            <div style="left:9rem;" class="dogname">${v.petName}</div>
            <div class="desc">This dog is the dog of user ${v.petOwner} id. The dog is level ${v.petLevel} and seems to be in very good condition. The price set by the seller is ${v.petSellingPrice}$, to buy it, first press the dog and then the buy button at the bottom.
            </div>
          `)     
        });
  } 
});

$(document).on('click', '.setbg', function(e){

});

$(document).on('click', '.opitem', function(e){
  $(".dogpath").attr('style', "fill:#383838")
  $(".dogpathbg").attr('style', "fill:#272727")
  $(".dogicon").attr('style', "stroke:#383838") 
  $(".opitembg").css("background-color","#262525")
  $(".nonselectbg").attr("src","../images/nonselectop.png")
  $($(this).children('.opitembg')).css('background-color','white')
  $($(this).children('.nonselectbg')).attr("src","../images/selectop.png")
  svg = $(this).children("svg")
  $(svg).children(".dogicon").attr("style", "stroke:#FB7171") 
  $(svg).children(".dogpath").attr("style", "fill:#FB7171") 
  $(svg).children(".dogpathbg").attr("style", "fill:#FFFFFF") 
  setTimeout(() => {
    $($(this).children('.opitembg')).css('background-color','#262525')
    $($(this).children('.nonselectbg')).attr("src","../images/nonselectop.png")
    svg = $(this).children("svg")
    $(svg).children(".dogicon").attr("style", "stroke:#383838") 
    $(svg).children(".dogpath").attr("style", "fill:#383838") 
    $(svg).children(".dogpathbg").attr("style", "fill:#272727") 
  }, 100);
});



$(document).on('click', '.soru', function(e){
  pedId = $(this).data("id")
  animalList = $(this).data("type")
  pedHash = $(this).data("hash")
  petBoughtAnim = $(this).data("petBoughtAnim")

  $(".first").hide()
  $(".second").show()
  
  $(".healthdata").css(`width`,`${$(this).data("health")}`)
  $(".enerjidata").css(`width`,`${$(this).data("energy")}`)
  $(".kemikdata").css(`width`,`${$(this).data("hunger")}`)
  $(".damladata").css(`width`,`${$(this).data("thrist")}`)

  $(".pet-face").attr("src",$(this).data("img"));
  $(".pet-name").html($(this).data("name"))
  $(".pet-info").html($(this).data("info"))
  $(".agetext").html(`Age: <span style="color: white;font-family: SF-Pro-Display;">${$(this).data("age")}</span>`)
  $(".leveltext").html(`Lv: <span style="color: white;font-family: SF-Pro-Display;">${$(this).data("level")  }</span>`)
  $(".sextext").html(`<span style="color:gray;font-family: SF-Pro-Display;">Sex:</span> ${$(this).data("sex")}`)
  $(".home,.top,.item-box,.bottom-icon").fadeOut(500)
  $(".pet-select").fadeIn(500)
  $.post("https://Sam_pet/changePet", JSON.stringify({pedHash,animalList, petBoughtAnim}),function (x) {  
  });
})

$(".buy-bg .text").click(function (e) { 
  clothArray = [
    hat = {
      "draw" : $("#hatinput").val(),
      "texture" : $(".hattexture").val()
    },
    leash = {
      "draw" : $("#leashinput").val(),
      "texture" : $(".leashtexture").val()
    },
    glasses = {
      "draw" : $("#glassesinput").val(),
      "texture" : $(".glassestexture").val()
    }
  ]
  console.log(JSON.stringify(clothArray));
  $.post("https://Sam_pet/buyPet", JSON.stringify({buyId,clothArray}));     
  close()
});


$(".carpi").click(function (e) { 
  $(".top,.item-box,.bottom-icon,.buy-bg,.buyImg,.first").fadeIn(500)
  $(".pet-select,.selectImg,.second").fadeOut(500)
});

$(".circle").click(function (e) { 
  $.post(`http://Sam_pet/camReset`);

});

// document.getElementById("left").addEventListener("mousedown", async function(){
//     left = true;
//     while (left){
//         $.post(`http://Sam_pet/left`);
//         await wait(7);
//     } 
// });

// document.getElementById("left").addEventListener("mouseup", function() { left = false;  right = false; });
 
// document.getElementById("right").addEventListener("mousedown", async function(){
//   right = true;
//     while (right){
//         $.post(`http://Sam_pet/right`);
//         await wait(7);
//     }   
// });
// document.getElementById("right").addEventListener("mouseup", function() { left = false;  right = false; });
 
// function wait(ms) {
//     return new Promise(resolve => setTimeout(resolve, ms));
// }
