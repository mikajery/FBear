var Threesixty = function(threesixty) {
  var ready             = false,
      dragging          = false,
      pointerStartPosX  = 0,
      pointerEndPosX    = 0,
      pointerDistance   = 0,
      monitorStartTime  = 0,
      monitorInt        = 10,
      ticker            = 0,
      speedMultiplier   = 10,
      collection        = window[threesixty.data('threesixty-frames')],
      totalFrames       = collection.length - 1,
      currentFrame      = 0,
      frames            = [],
      endFrame          = 0,
      loadedImages      = 0,
      interval,
      spinner           = threesixty.find('[data-threesixty=spinner]'),
      spinner_id        = threesixty.data('threesixty-spinner'),
      images            = threesixty.find('[data-threesixty=images]')
  ;

  var addSpinner = function () {
    var _spinner = new CanvasLoader(spinner_id);
    _spinner.setShape("spiral");
    _spinner.setDiameter(90);
    _spinner.setDensity(90);
    _spinner.setRange(1);
    _spinner.setSpeed(4);
    _spinner.setColor("#333333");
    _spinner.show();
    spinner.fadeIn("slow");
  };

  var loadImage = function() {
    var li = document.createElement("li");
    var imageName = collection[loadedImages + 1];
    var image = $('<img>').attr('src', imageName).addClass("previous-image").appendTo(li);

    frames.push(image);
    images.append(li);

    $(image).load(function() {
      imageLoaded();
    });
  };

  var imageLoaded = function() {
    loadedImages++;
    spinner.find('span').text(Math.floor(loadedImages / totalFrames * 100) + "%");
    if (loadedImages == totalFrames) {
      frames[0].removeClass("previous-image").addClass("current-image");
      spinner.fadeOut("slow", function(){
        spinner.hide();
        showThreesixty();
      });
    } 
    else 
    {
      loadImage();
    }
  };

  var showThreesixty = function() {
    images.fadeIn("slow");
    ready = true;
    spin();
    refresh();
  };

  addSpinner();
  loadImage();

  var render = function () {
    if(currentFrame !== endFrame)
    { 
      var frameEasing = endFrame < currentFrame ? Math.floor((endFrame - currentFrame) * 0.1) : Math.ceil((endFrame - currentFrame) * 0.1);
      hidePreviousFrame();
      currentFrame += frameEasing;
      showCurrentFrame();
    } 
    else 
    {
      window.clearInterval(ticker);
      ticker = 0;
    }
  };
  
  var refresh = function() {
    if (ticker === 0) 
      ticker = self.setInterval(render, Math.round(1000 / 60));
  };
  
  var hidePreviousFrame = function() 
  {
    frames[getNormalizedCurrentFrame()].removeClass("current-image").addClass("previous-image");
  };
  
  var showCurrentFrame = function() 
  {
    frames[getNormalizedCurrentFrame()].removeClass("previous-image").addClass("current-image");
  };
  
  var getNormalizedCurrentFrame = function() 
  {
    var c = -Math.ceil(currentFrame % totalFrames);
    if (c < 0) c += (totalFrames - 1);
    return c;
  };
  
  var getPointerEvent = function(event) 
  {
    return event.originalEvent.targetTouches ? event.originalEvent.targetTouches[0] : event;
  };

  var trackPointer = function(event) 
  {
    if (ready && dragging) 
    {
      pointerEndPosX = getPointerEvent(event).pageX;
      if (monitorStartTime < new Date().getTime() - monitorInt) 
      {
        pointerDistance = pointerEndPosX - pointerStartPosX;
        endFrame = currentFrame - Math.ceil((totalFrames - 1) * speedMultiplier * (pointerDistance / threesixty.width()));
        refresh();
        monitorStartTime = new Date().getTime();
        pointerStartPosX = getPointerEvent(event).pageX;
      }
    }
  };

  threesixty.mousedown(function (event) {
    event.preventDefault();
    pointerStartPosX = getPointerEvent(event).pageX;
    dragging = true;
    clearInterval(interval);
  });
  
  $(document).mouseup(function (event){
    event.preventDefault();
    dragging = false;
  });
  
  $(document).mousemove(function (event){
    event.preventDefault();
    trackPointer(event);
  });
  
  threesixty.on("touchstart", function (event) {
    event.preventDefault();
    pointerStartPosX = getPointerEvent(event).pageX;
    dragging = true;
  });
  
  threesixty.on("touchmove", function (event) {
    event.preventDefault();
    trackPointer(event);
  });
  
  threesixty.on("touchend", function (event) {
    event.preventDefault();
    dragging = false;
  });

  var spin = function() {
    interval = setInterval(function() {
      endFrame--;
      refresh();
    }, 50)
  }
};

$(function () {
  $('[data-type="threesixty"]').each(function() {
    new Threesixty($(this));
  });
});