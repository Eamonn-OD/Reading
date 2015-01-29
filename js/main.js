

var APP = (function ($) {
    var my = {};


  var wordObj;//current word







    function hideSightWords(){

        $("#sightword-section").hide();
    }
    function hideSentences(){

        $("#sentence-section").hide();
    }

 function getSightWord(){




        if(DICTIONARY.isFinished() ){
            $("#sight-word").text("DONE!" );
            $('#type-buttons').show();

        }else{
          wordObj=DICTIONARY.getNextWord();
            console.log("in getSightWord->"+wordObj.word);
            $("#sight-word").text(wordObj.word);
        }

        $("#sight-word-counter").text(DICTIONARY.getCounterString());
    }

  function getStreak(){

    $.ajax("get_streak.php") .done(function(data) {
      console.log(data);
      var  $streak_result=data.streak[0].streak; //format is {"streak":[{"id":"1","streak":"0"}]}
      console.log("Streak Result is "+$streak_result);
      $('#streak').text("You have done this activity " +  $streak_result+ " days in a row");
    });

  }

//=====PUBLIC===================================




  my.correctSightWord=function(){
       PEN.nextBrushStroke();
    console.log("word_id->"+wordObj.word_id);
        $.post( "score_word.php", { word_id: wordObj.word_id, result: "correct" } );

       getSightWord();
    }

    my.incorrectSightWord=function(){
       $.post( "score_word.php", { word_id: wordObj.word_id, result: "incorrect" } );
        DICTIONARY.addIncorrectWord(wordObj);
        getSightWord();
    }



    my.start= function (){


      $.ajax({

        url: "update_streak.php",
        data: { id: 1 }
      }).done(function( msg ) {
          console.log("Streak Updated");
           console.log("in start function");
          $('#main-canvas').show();
          $('#start-button-section').hide();
           getStreak();
           getSightWord();
        });

    }

    my.getSentence= function () {

        var x=DICTIONARY.getSentenceWithImage();


        hideSightWords();

        $("#sentence").text(x.sentence);


        //show an image
        $("#action-image").show("fast", function() {

            $(this).attr('src', "img/"+x.image);

        });

    };

    return my;
}(jQuery));
