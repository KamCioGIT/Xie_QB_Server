var keyId;
var keyName;


$(function() {
 window.addEventListener('message', function(event) {
  var data = event.data;
  if (data.type == 'loadUnit') {
   $('body').fadeIn(500);
   $('#device').css('display', 'flex');
   $('#daysRemaining').text(data.daysRemaining);
   $('#warehouseLevel').text(data.storageLevel);
   $('#warehouseKeys').text(data.warehouseKeys);
   $('#storageCash').text("$" + data.storedCash);
   $('#upgradeCost').text("$" + data.upgradeCost);

   $('#sevenDays').text("$" + data.rentPrice);
   $('#thirtyDays').text("$" + data.rentPrice * 4);

   $("#warehouseKeyList").empty();
   for (let i = 0; i < data.keys.length; i++) {
    const element = data.keys[i];
    $("#warehouseKeyList").append('<h5 id="warehouseKey">' + element.name + '<span style="float: right; margin-right: 2%; margin-top: 0.8%; color: rgba(138, 2, 2, 0.52);"><i onclick="deleteKey(`' + element.id + '`)" class="fa-solid fa-trash"></i></span></h5>');
   }
  } else if (data.type == 'updateUnit') {
   $('#daysRemaining').text(data.daysRemaining);
   $('#warehouseLevel').text(data.storageLevel);
   $('#warehouseKeys').text(data.warehouseKeys);
   $('#storageCash').text("$" + data.storedCash);
   $('#upgradeCost').text("$" + data.upgradeCost);

   $('#sevenDays').text("$" + data.rentPrice);
   $('#thirtyDays').text("$" + data.rentPrice * 4);

   $("#warehouseKeyList").empty();
   for (let i = 0; i < data.keys.length; i++) {
    const element = data.keys[i];
    $("#warehouseKeyList").append('<h5 id="warehouseKey">' + element.name + '<span style="float: right; margin-right: 2%; margin-top: 0.8%; color: rgba(138, 2, 2, 0.52);"><i onclick="deleteKey(`' + element.id + '`)" class="fa-solid fa-trash"></i></span></h5>');
   }
  } else if (data.type == 'storedCash') {
    $('body').show();
    $('#storedCash').show();
    $('#cashAmount').text("$" + data.cash)
  } else { 
   $('body').fadeOut(500);
   $('#device').hide();
   $('#storedCash').hide();
  }
 });

 document.onkeydown = function(data) {
  if (data.which == 27) {
   $("body").fadeOut(100);
   $.post('https://' +  GetParentResourceName() + '/close')
  }
 }

 $('#keyName').on('input', function() {
  var text = $(this).val();
  keyName = text;
 });

 $('#keyId').on('input', function() {
  var text = $(this).val();
  keyId = text;
 });

 $('#cancelwarehouseKey').click(function(){
  $("#warehouseKeyMenu").hide()
 });

 $('#newWarehouseKey').click(function(){
  $("#warehouseKeyMenu").show()
 });

 $('#addwarehouseKey').click(function(){
  if (keyId.length > 0 && keyName.length > 0) {
   $.post('https://' +  GetParentResourceName() + '/addKey', JSON.stringify({id: keyId, name: keyName}));
   $('#keyName').val("");
   $('#keyId').val("");
  }
 });

 $('#terminateWarehouse').click(function(){
  $.post('https://' +  GetParentResourceName() + '/terminateWarehouse');
 });

 $('#add7Days').click(function(){
  $.post('https://' +  GetParentResourceName() + '/addDays', JSON.stringify({days: 7, price: 1}));
 });

 $('#add28Days').click(function(){
  $.post('https://' +  GetParentResourceName() + '/addDays', JSON.stringify({days: 28, price: 4}));
 });

 $('#upgradeWarehouse').click(function(){
  $.post('https://' +  GetParentResourceName() + '/upgradeWarehouse');
 });
});
