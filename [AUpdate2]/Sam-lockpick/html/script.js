function Lockpick() {
    this.speed = 0;
    this.streak = 0;
    this.interval = null;
    this.streakTimeout = false;

    this.level = 1;
    this.isDecrease = true;
    this.randomSpeed = false;
    this.levelHeight = 18;
 
    this.init = () => {
        this.initEvents();
    };

    this.initEvents = () => {
        var self = this;

        // document on key down
        $(document).off('keydown');
        $(document).keydown(function(e) {
            if(e.which == 8 || e.which == 27){
                self.stop();
                self.deleteGame();
                $('.lockpickBg').fadeOut(200);
                $.post('https://sh-lockpick/callback', JSON.stringify({
                    success: false
                }));
            }
        });

        $(document).off('keypress');
        $(document).keypress(function(e) {
            if (e.which == 32) {
                var pointer = $('.pointer');
                var angle = pointer.data('angle');

                if (self.streakTimeout == true){
                    return
                }

                if ((angle >= 345 && angle <= 360) || (angle >= 0 && angle <= 15)) {
                    self.streak++;
                    $('.ring').css('transform', 'scale(1.08)');
                    $('#winzonePath').css('fill', '#5de072');

                    self.streakTimeout = true;
                    self.stop();

                    var baseScore = $('.baseScore');
                    var baseScoreHeight =  parseInt(baseScore.height());
                    baseScore.css('height', (baseScoreHeight + self.levelHeight) + 'px');
                    
                    var baseScore2 = $('.baseScore2');
                    baseScore2.css('height', self.levelHeight + 'px');
                    baseScore2.css('display', 'block');

                    baseScore2.animate({
                        transition: 'all .4s ease-in-out'
                    }, 0, function() {
                        baseScore2.css('height', '0px');
                    }); 

                    var audio = new Audio('lockpick.mp3');
                    audio.play();

                    setTimeout(function() {
                        $('.ring').css('transform', 'scale(1)');
                        $('#winzonePath').css('fill', '#ffffff');

                        if(self.randomSpeed == true){
                            var random = Math.floor(Math.random() * (self.speed * 2)) + 1;
                            self.speed = random;
                        }
                        
                        self.interval = setInterval(function() {
                            self.lockpick();
                        }, self.speed);

                        setTimeout(function() {
                            baseScore2.css('display', 'none');

                            self.streakTimeout = false;

                            if((baseScoreHeight + 18) > 112){
                                self.stop();
                                $('.lockpickBg').fadeOut(200);
                                setTimeout(function() {
                                    self.deleteGame();
                                    $.post('https://sh-lockpick/callback', JSON.stringify({
                                        success: true
                                    }));
                                }, 200);
                            }
                        }, 200);
                    }, 200);
                }else {
                    var baseScore = $('.baseScore');
                    var baseScoreHeight =  parseInt(baseScore.height());
                    baseScore.css('height', (baseScoreHeight - 18) + 'px');
                    
                    var baseScore3 = $('.baseScore3');
                    baseScore3.css('height', '0px');
                    baseScore3.css('display', 'block');
 
                    self.streakTimeout = true;
                    self.stop();

                    var audio = new Audio('error.mp3');
                    //volume lover
                    audio.volume = 0.2;
                    audio.play();

                    baseScore3.animate({
                        transition: 'all .4s ease-in-out'
                    }, 0, function() {
                        baseScore3.css('height', '18px');
                    }); 

                    $('#ringPath').css('fill-opacity', '1');
                    $('#ringPath').css('fill', '#f55c5e');
                    $('.ring').addClass('shake');   
 
                    setTimeout(function() {
                        baseScore3.css('height', '0px');
                        $('#ringPath').css('fill-opacity', '0.4');
                        $('#ringPath').css('fill', '#fff');
                        $('.ring').removeClass('shake');


                        var random = Math.floor(Math.random() * 10) + 1;
                        self.speed = random;
                        
                        self.interval = setInterval(function() {
                            self.lockpick();
                        }, self.speed);

                        setTimeout(function() {
                            baseScore3.css('display', 'none');
                            self.streakTimeout = false;
                            if(baseScoreHeight <= 0){
                                self.stop();
                                $('.lockpickBg').fadeOut(200);
                                setTimeout(function() {
                                    self.deleteGame();
                                    $.post('https://sh-lockpick/callback', JSON.stringify({
                                        success: false
                                    }));
                                }, 200);
                            }
                        }, 200);
                    }, 800); 
                }
            }
        });
    }

    this.createGame = (speed, settings) => {
        $('.lockpickBg').css('display', 'flex');

        var self = this;
        this.speed = speed;
        this.streak = 0;
        this.streakTimeout = false;

        if(settings != undefined){
            this.isDecrease = settings.isDecrease;
            this.level = settings.level;
        }

        if(this.level == 1){
            this.levelHeight = 18;
        }else if(this.level == 2){
            this.levelHeight = 24;
        }else if(this.level == 3){
            this.levelHeight = 30;
        }

        var baseScore = $('.baseScore');
        var baseScoreHeight = parseInt(baseScore.height());
        baseScoreHeight = 56;
        baseScore.css('height', baseScoreHeight + 'px');

        this.interval = setInterval(function() {
            self.lockpick();
        }, this.speed);
    }

    this.lockpick = () => {
        var self = this;
        var pointer = $('.pointer');
        var angle = pointer.data('angle');
        if (angle == undefined) {
            angle = 20;
        }
        if (angle == 360) {
            angle = 0;
        }
        angle += 1;
        pointer.css('rotate',  angle + 'deg');
        pointer.data('angle', angle);

        if(self.isDecrease == true){
            var baseScore = $('.baseScore');

            if(self.streakTimeout == false){
                var baseScoreHeight = parseInt(baseScore.height());
                baseScoreHeight -= 1;
                baseScore.css('height', baseScoreHeight + 'px');

                if(baseScoreHeight <= 0){
                    self.stop();
                    self.deleteGame();
                    $('.lockpickBg').fadeOut(200);
                    $.post('https://sh-lockpick/callback', JSON.stringify({
                        success: false
                    }));
                }
            } 
        }
    }

    this.stop = () => {
        clearInterval(this.interval);
        this.interval = null;
    }

    this.deleteGame = () => {
        this.stop();
        this.speed = 0;
        this.streak = 0;
        this.interval = null;
        this.streakTimeout = false;
        
        $('.baseScore').css('height', '56px');
        $('.baseScore2').css('height', '0px');
        $('.baseScore2').css('display', 'none');
        $('.pointer').css('rotate', '20deg');
        $('.pointer').data('angle', 20);
    }
}


function createGame(speed, settings){
    var ALockpick = new Lockpick();
    ALockpick.init();
    ALockpick.createGame(speed, settings);
}

window.addEventListener('message', function(event) {
    let data = event.data;
    switch(data.type){
        case 'createGame':
            createGame(data.speed, data.settings);
            break;
    }
});