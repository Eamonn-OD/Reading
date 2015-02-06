
CREATE TABLE words(
   word_id INT NOT NULL AUTO_INCREMENT,
   word VARCHAR(100) NOT NULL,
  type VARCHAR(100) NOT NULL,
  image VARCHAR(100) NOT NULL,
   num_attempted INT NOT NULL,
  num_successful INT NOT NULL,
   last_try DATE,
   PRIMARY KEY ( word_id )
);

CREATE TABLE sentences(
   sentence_id INT NOT NULL AUTO_INCREMENT,
   sentence VARCHAR(100) NOT NULL,
  word_id INT NOT NULL,

   PRIMARY KEY ( sentence_id ),
   FOREIGN KEY (word_id)
        REFERENCES words(word_id)
        ON DELETE CASCADE
);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'I' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I like to _verb_', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I am a boy', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'He' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('He likes to _verb_', @last);
INSERT INTO sentences(sentence,word_id) VALUES('He is happy', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'She' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('She loves to _verb_', @last);
INSERT INTO sentences(sentence,word_id) VALUES('She is a girl', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'We' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('We want to _verb_', @last);
INSERT INTO sentences(sentence,word_id) VALUES('We can _verb_', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'They' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('They want to _verb_', @last);
INSERT INTO sentences(sentence,word_id) VALUES('They can _verb_', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'all' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('All the boys want to _verb_', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I want to eat all the ice cream', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'at' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I _adverb_ to _verb_ at school', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'like' ,'adverb' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I like to _verb_', @last);
INSERT INTO sentences(sentence,word_id) VALUES('We like school', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'love' ,'adverb' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('We love to _verb_', @last);
INSERT INTO sentences(sentence,word_id) VALUES('She loves to _verb_', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'want' ,'adverb' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('We want to _verb_', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I want to _verb_', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'can' ,'nonadverb' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('We can _verb_', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I can _verb_', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'the' ,'nonadverb' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I can run to the school', @last);
INSERT INTO sentences(sentence,word_id) VALUES('The cat loves to eat', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'it' ,'nonadverb' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I _adverb_ it', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'run' ,'verb' ,'run.jpg' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('We want to run', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I can run', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'jump' ,'verb' ,'jump.jpg' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('She likes to jump', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I love to jump', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'eat' ,'verb' ,'eat.jpg' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('They like to eat', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I love to eat', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'play' ,'verb' ,'play.jpg' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('We want to play', @last);
INSERT INTO sentences(sentence,word_id) VALUES('We can play', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'learn' ,'verb' ,'learn.jpg' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('They love to learn', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I want to learn to read', @last);
INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'read' ,'verb' ,'read.jpg' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('We want to read', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I love to read', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'drink' ,'verb' ,'drink.jpg' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('She likes to drink water', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I drink water', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'up' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I look up at the sky', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I ran up the hill', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'yes' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I like to say yes', @last);
INSERT INTO sentences(sentence,word_id) VALUES('My Mum asked if I wanted ice cream.  I said YES', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'no' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I was thirsty but there was no water to drink.', @last);
INSERT INTO sentences(sentence,word_id) VALUES('My Dad said no when I asked for ice cream', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'for' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I asked my mother for a cookie.', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I went looking for my sister', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'was' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I was looking for my sister', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'said' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I said hello to my friend.', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'see' ,'verb' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I see my sister up on the hill.', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'go' ,'verb' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I go to school every day', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'by' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I go by the Fire House every day', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'three' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('There are three pigs in the farm', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'have' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I have a toy dinosaur', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I have a fire truck', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'four' ,'number-plural' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I am four years old', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'was' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I was at school yesterday', @last);
INSERT INTO sentences(sentence,word_id) VALUES('He was happy when I gave him my cookie', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'five' ,'number-plural' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I have five fingers', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I have five toes', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'her' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('It was her toy', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I ate her cookie and she was sad.', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'your' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I gave you your cookie', @last);
INSERT INTO sentences(sentence,word_id) VALUES('This is your toy', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'what' ,'question' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('What is your name?', @last);
INSERT INTO sentences(sentence,word_id) VALUES('What time is it?', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'why' ,'question' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('Why is that?', @last);
INSERT INTO sentences(sentence,word_id) VALUES('Why do I go to school?', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'out' ,'preposition' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I went out to the garage', @last);
INSERT INTO sentences(sentence,word_id) VALUES('Get out of here!', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'big' ,'adjective' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('The cookie he ate was very big', @last);
INSERT INTO sentences(sentence,word_id) VALUES('He took a big bite out of his apple', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'little' ,'adjective' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('There was only a little milk left in the cup', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I have a little brother', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'white' ,'color' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('When the snow fell it turned everything white', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'black' ,'color' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('The boy had black hair', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'blue' ,'color' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('The sky is blue on  sunny day', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'green' ,'color' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('The sky is blue on  sunny day', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'how' ,'question' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('How are you?', @last);
INSERT INTO sentences(sentence,word_id) VALUES('How did he do that?', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'where' ,'question' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('Where are you?', @last);
INSERT INTO sentences(sentence,word_id) VALUES('Where is the car?', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'when' ,'question' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('When is my birthday?', @last);
INSERT INTO sentences(sentence,word_id) VALUES('When can we go home?', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'yellow' ,'color' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('The sun looks yellow in the sky', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'six' ,'number-plural' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I have six cars', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I have six trucks', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'red' ,'color' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('The fire truck is red', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'seven' ,'number-plural' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I have seven hats', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I have seven toy guns', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'not' ,'adjective' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('He is not tired', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I am not little', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'eight' ,'number-plural' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I have eight shoes', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I have eight socks', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'got' ,'adjective' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('He got a toy for his birthday', @last);
INSERT INTO sentences(sentence,word_id) VALUES('I got cold when I played in the snow', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'new' ,'adjective' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('She likes her new toy', @last);
INSERT INTO sentences(sentence,word_id) VALUES('My Dad got a new girlfriend', @last);

INSERT INTO words ( word,type,image, num_attempted,num_successful ) VALUES( 'old' ,'adjective' ,'NONE' , 0,0);
SET @last := LAST_INSERT_ID();
INSERT INTO sentences(sentence,word_id) VALUES('I am four years old', @last);
INSERT INTO sentences(sentence,word_id) VALUES('Her dog is very old', @last);


