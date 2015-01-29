var DICTIONARY = (function ($) {





  var my = {};
  var words=[];
  var incorrectwords=[];

  var verbs=[];
  var adverbs=[];
  var plural_number=[]
  var SIGHT_WORD_INDEX=-1;
  var text="";

  function shuffle(array) {
    var currentIndex = array.length, temporaryValue, randomIndex ;

    // While there remain elements to shuffle...
    while (0 !== currentIndex) {

      // Pick a remaining element...
      randomIndex = Math.floor(Math.random() * currentIndex);
      currentIndex -= 1;

      // And swap it with the current element.
      temporaryValue = array[currentIndex];
      array[currentIndex] = array[randomIndex];
      array[randomIndex] = temporaryValue;
    }

    return array;
  }


  function init(){


    $.ajax("get_words.php") .done(function(data) {

      //console.log(data);
       $.each( data, function( key, val ) {

        val.forEach(function(entry) {
          console.log("about to push '"+entry.word+"' into words array");
          words.push(entry);
          if(entry.type === "verb"){
            verbs.push(entry);
          }else if(entry.type === "adverb"){
            adverbs.push(entry);
          }else if(entry.type === "number-plural"){
            plural_number.push(entry);
          }
          //=================

          //===============
        });
      });
      words=shuffle(words);
});



  }

  function getRandom(max) {
       return Math.floor((Math.random() * max) );
  }
  function getRandomWordObjectFrom(arr){
    return arr[getRandom(arr.length)];
  }


  function getSentenceFromIncorrectWord(wordObj){
    var result={};
    var image=wordObj.image;
      var sentence=getRandomWordObjectFrom(wordObj.sentences);
      console.log(sentence);
       var index=sentence.indexOf("_adverb_") ;
      if(index > -1){
        var adverb=getRandomWordObjectFrom(adverbs);
        sentence=sentence.replace("_adverb_",adverb.word);

      }
       index=sentence.indexOf("_verb_") ;
      if(index > -1){
        var verb=getRandomWordObjectFrom(verbs);
        sentence=sentence.replace("_verb_",verb.word);
        image=verb.image;
        console.log(sentence);
      }

      index=sentence.indexOf("_numberplural_") ;
      if(index > -1){
        var num=getRandomWordObjectFrom(plural_number);
        sentence=sentence.replace("_numberplural_",num.word);
        image=num.image;
        console.log(sentence);
      }

      result.sentence= sentence;
      result.image= image;
    return result
  }


  //=======PUBLIC==========
  my.initialize=init;

  my.addIncorrectWord=function(word){
    if(word){
      incorrectwords.push(word);
    }

  }

  my.printWords=function(){

    words.forEach(function(entry) {
          console.log("xx"+entry);
        });
  }

  my.getNextWord=function(){
       SIGHT_WORD_INDEX++;
        return words[SIGHT_WORD_INDEX];

    }

   my.isFinished=function(){


        return SIGHT_WORD_INDEX===(words.length -1);
    }
   my.getCounterString=function(){


        return (SIGHT_WORD_INDEX + 1)+ "/" +words.length;
    }
    my.getSentenceWithImage=function(){
      var result={};
      var wordObj=incorrectwords.shift() //takes from start of array

      //var wordObj=getRandomWordObjectFrom(incorrectwords);
      if(wordObj==null){
        result.sentence= "DONE!";

      }else{
        result=getSentenceFromIncorrectWord(wordObj);
      }





      return result;
    }


   return my;

}(jQuery));
