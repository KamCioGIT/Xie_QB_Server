is = false


window.addEventListener('message', function(event) {
    const data = event.data;
    if (data.type == 'open'){
        $("body").fadeIn(250)
    }
    
    if (data.type == 'closesnr'){
      $("body").fadeOut(250)
      $.post('https://snr_animpos/close', JSON.stringify({
          close: true
      }));
  }
})