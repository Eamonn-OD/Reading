var PEN = (function ($) {
  var ctx;
  var nextstep="init";
  var my = {};
  var states={};
    states["init"] =function(){
              var canvas = document.getElementById('canvas');
              if (canvas.getContext('2d')) {
                 ctx = canvas.getContext('2d');
              }

                   ctx.beginPath();
                    ctx.arc(75,75,50,0,Math.PI*2,true); // Outer circle
                    ctx.stroke();


                    ctx.moveTo(110,75);//first step

                   ctx.save();
                  nextstep="drawmouth";


  };
    states["drawmouth"]  =function(){
                        ctx.restore();
                         ctx.beginPath();
                        ctx.arc(75,75,35,0,Math.PI,false);   // Mouth (clockwise)
                        ctx.stroke();

                         ctx.save();
                         nextstep="lefteye";
                    };
    states["lefteye"]  =function(){
                        ctx.restore();
                         ctx.beginPath();
                         ctx.moveTo(65,65);
                        ctx.arc(60,65,5,0,Math.PI*2,true);    // Left eye
                        ctx.stroke();

                         ctx.save();
                         nextstep="righteye";
                    };
  states["righteye"]  =function(){
                        ctx.restore();
                         ctx.beginPath();
                         ctx.moveTo(95,65);
                         ctx.arc(90,65,5,0,Math.PI*2,true);  // Right eye
                          ctx.stroke();


                         ctx.save();
                          nextstep="nose";
                    };
  states["nose"]  =function(){
                        ctx.restore();
                         ctx.beginPath();
                          ctx.moveTo(83,85);//added 8 as arc then is drawn from this point
                           ctx.arc(75,85,8,0,Math.PI,false);  // nose
                          ctx.stroke();


                         ctx.save();
                    };




  function initCanvas(){
      var canvas = document.getElementById('canvas');
      if (canvas.getContext('2d')) {
           ctx = canvas.getContext('2d');
      }
     return function(){
                   ctx.beginPath();
                    ctx.arc(75,75,50,0,Math.PI*2,true); // Outer circle
                    ctx.stroke();


                    ctx.moveTo(110,75);//first step

                   ctx.save();
     }

  }

  function next(){
    console.log("nextstep="+nextstep);
    var step= states[nextstep];//reference to function
   // console.log(x);
    step();//call referenced function
  }

  /*function initCanvas(){
        return function(){
            var canvas = document.getElementById('canvas');

            if (canvas.getContext('2d')) {
                var ctx = canvas.getContext('2d');

                return function(){
                    ctx.arc(75,75,50,0,Math.PI*2,true); // Outer circle
                    ctx.stroke();


                    ctx.moveTo(110,75);//first step
                    console.log("filled rectangle ");
                    return function(){
                        ctx.arc(75,75,35,0,Math.PI,false);   // Mouth (clockwise)
                        ctx.stroke();
                        ctx.moveTo(65,65);
                        return function(){
                            ctx.arc(60,65,5,0,Math.PI*2,true);  // Left eye
                            ctx.stroke();
                            ctx.moveTo(95,65);
                            return function(){
                                ctx.arc(90,65,5,0,Math.PI*2,true);  // Right eye
                                ctx.stroke();
                                ctx.moveTo(83,85);//added 8 as arc then is drawn from this point
                                return function(){
                                    ctx.arc(75,85,8,0,Math.PI,false);  // nose

                                    //ctx.moveTo(10,10);

                                    //ctx.lineTo(35,45);

                                    ctx.stroke();
                                }
                            }
                        }
                    }
                }
            }
        }()
      }*/


  //=============PUBLIC=======================
  //my.initialize=initCanvas;
  my.nextBrushStroke=next;

  return my;

}(jQuery));