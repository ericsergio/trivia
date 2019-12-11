start transaction;
 #1
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
1, #id Number#
"In what year did Barack Obama win his 2nd presidential election?", #Question#
1,  #genre_id#
1, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"2012" #answer
);
 #end 1
 #2
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
2, #id Number#
"What was the name given to the quick and precise attack by the U.S. that initiated the Iraq war?", #Question#
1,  #genre_id#
2, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Shock & Awe" #answer
);
 #end 2
 #3
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
3, #id Number#
"Which of the following herbicides/defoliants were used  in the Vietnam war?", #Question#
1,  #genre_id#
3, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Agent Orange" #answer
);
 #end 3
 #4
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
4, #id Number#
"Which country occupied the Korean Peninsula until the end of WWII?", #Question#
1,  #genre_id#
4, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Japan" #answer
);
 #end 4
 #5
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
5, #id Number#
"What was the longest battle of WWII?", #Question#
1,  #genre_id#
5, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Battle of the Atlantic" #answer
);
 #end 5
 #6
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
6, #id Number#
"What disease caused a third of total military deaths during WWI?", #Question#
1,  #genre_id#
6, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Spanish Flu" #answer
);
 #end 6
 #7
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
7, #id Number#
"The Santa Barbara oil spill is the largest oil spill off the coast of California to date. In What year did the Santa Barbara oil spill occur?", #Question#
2,  #genre_id#
7, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"1969" #answer
);
 #end 7
 #8
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
8, #id Number#
"The Tōhoku earthquake was the most powerful earthquake ever recorded in Japan, and the 4th in the world. What was it's magnitude?", #Question#
2,  #genre_id#
8, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"9.0" #answer
);
 #end 8
 #9
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
9, #id Number#
"What was the first pathogen identified as a virus?", #Question#
2,  #genre_id#
9, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Tobacco mosaic virus" #answer
);
 #end 9
 #10
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
10, #id Number#
"What is is the smallest indivisible portion of a pure chemical substance?", #Question#
2,  #genre_id#
10, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"A molecule" #answer
);
 #end 10
 #11
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
11, #id Number#
"The interaction of Earth's magnetic field and the solar wind are the components that make up what?", #Question#
2,  #genre_id#
11, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"The ionosphere" #answer
);
 #end 11
 #12
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
12, #id Number#
"a market where there are a few buyers and many sellers is a …", #Question#
2,  #genre_id#
12, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Oligopsony" #answer
);
 #end 12
 #13
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
13, #id Number#
"What is Macroeconomic output is usually measured by?", #Question#
3,  #genre_id#
13, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"GDP" #answer
);
 #end 13
 #14
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
14, #id Number#
"As of 2019, which country has the largest economy in the world by GDP?", #Question#
3,  #genre_id#
14, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"China" #answer
);
 #end 14
 #15
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
15, #id Number#
"As of 2019, what is the largest company in the US by consolidated revenue?", #Question#
3,  #genre_id#
15, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Walmart" #answer
);
 #end 15
 #16
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
16, #id Number#
"In the US, which body of government has the power to initiate impeachment?", #Question#
4,  #genre_id#
16, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Congress" #answer
);
 #end 16
 #17
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
17, #id Number#
"How are each state's number of congressional seats determined? ", #Question#
4,  #genre_id#
17, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Population" #answer
);
 #end 17
 #18
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
18, #id Number#
"All states hold their gubernatorial elections (governor elections) every four years except New Hampshire and what other state?", #Question#
4,  #genre_id#
18, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Vermont" #answer
);
 #end 18
 #19
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
19, #id Number#
"In Politics, the 'revolving door' is a reference to what?", #Question#
4,  #genre_id#
19, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Elected officials becoming lobbysts" #answer
);
 #end 19
 #20
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
20, #id Number#
"Which of these NFL quarterbacks were not part of the 2012 draft?", #Question#
5,  #genre_id#
20, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Cam Newton" #answer
);
 #end 20
 #21
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
21, #id Number#
"How many NBA Championships did Micheal Jordan win wil the Chicago Bulls?", #Question#
5,  #genre_id#
21, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"6" #answer
);
 #end 21
 #22
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
22, #id Number#
"Who holds the record for the most hits in their career?", #Question#
5,  #genre_id#
22, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Pete Rose" #answer
);
 #end 22
 #23
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
23, #id Number#
"As of 2019, how many teams are there in the NHL?", #Question#
5,  #genre_id#
23, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"31" #answer
);
 #end 23
 #24
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
24, #id Number#
"Where were the 1984 summer olympics held?", #Question#
5,  #genre_id#
24, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Los Angeles, California" #answer
);
 #end 24
 #25
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
25, #id Number#
"What is the capital of New Mexico?", #Question#
6,  #genre_id#
25, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Santa Fe" #answer
);
 #end 25
 #26
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
26, #id Number#
"Which country has the 2nd largest portion of the Amazon rainforest within their borders?", #Question#
6,  #genre_id#
26, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Peru" #answer
);
 #end 26
 #27
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
27, #id Number#
"Which body of water is off the coats of Italy and Croatia?", #Question#
6,  #genre_id#
27, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Adriatic Sea" #answer
);
 #end 27
 #28
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
28, #id Number#
"The Han river is located in which of these asian countries?", #Question#
6,  #genre_id#
28, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"South Korea" #answer
);
 #end 28
 #29
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
29, #id Number#
"All of these countries are located in mainland southeast asia or indochina except this country", #Question#
6,  #genre_id#
29, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Singapore" #answer
);
 #end 29
 #30
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
30, #id Number#
"Which of the following countries is located on the equator?", #Question#
6,  #genre_id#
30, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Uganda" #answer
);
 #end 30
 #31
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
31, #id Number#
"Beirut is located next to which body of water?", #Question#
6,  #genre_id#
31, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Mediterranean Sea" #answer
);
 #end 31
 #32
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
32, #id Number#
"How many internet addresses did the original IPV4 protocol provide?", #Question#
7,  #genre_id#
32, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"4.3 Billion" #answer
);
 #end 32
 #33
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
33, #id Number#
"The Society of automotive engineers established an autonomous car standard classifying how many levels of automation?", #Question#
7,  #genre_id#
33, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"5" #answer
);
 #end 33
 #34
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
34, #id Number#
"Where was the first 5G cellular network?", #Question#
7,  #genre_id#
34, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"South Korea" #answer
);
 #end 34
 #35
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
35, #id Number#
"What hack achieved the largest retail credit card breach in history?", #Question#
7,  #genre_id#
35, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"The Home Depot Hack" #answer
);
 #end 35
 #36
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
36, #id Number#
"Where was the band Pink Floyd formed?", #Question#
8,  #genre_id#
36, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"London" #answer
);
 #end 36
 #37
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
37, #id Number#
"What was the rapper Nas's debut album?", #Question#
8,  #genre_id#
37, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Illmatic" #answer
);
 #end 37
 #38
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
38, #id Number#
"Which of these grunge bands' lead vocalists died as a direct result from substance abuse?", #Question#
8,  #genre_id#
38, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Alice in Chains" #answer
);
 #end 38
 #39
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
39, #id Number#
"What is the name of the 80's band that came out with the song 'Here I go again'?", #Question#
8,  #genre_id#
39, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Whitesnake" #answer
);
 #end 39
 #40
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
40, #id Number#
"While Michael Jackson is known as the king of pop, who is known as the queen?", #Question#
8,  #genre_id#
40, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Madonna" #answer
);
 #end 40
 #41
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
41, #id Number#
"Ludwig van Beethoven lived during which of these eras?", #Question#
8,  #genre_id#
41, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Classical era" #answer
);
 #end 41
 #42
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
42, #id Number#
"Which of these action movie stars was appointed as a UN ambassador for global justice?", #Question#
9,  #genre_id#
42, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Nicolas Cage" #answer
);
 #end 42
 #43
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
43, #id Number#
"Which of these movies did Edward Norton win the 'Best Actor' Academy award at the 71st Academy Awards in 1999?", #Question#
9,  #genre_id#
43, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"American History X" #answer
);
 #end 43
 #44
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
44, #id Number#
"Who directed the movie Super Troopers?", #Question#
9,  #genre_id#
44, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"Jay Chandrasekhar " #answer
);
 #end 44
 #45
insert into questions(question_id, question, genre_id, sub_genre_id,correct_answer_idx, game_setting_id) values(
45, #id Number#
"As of 2019, what is the top grossing documentary of all time?", #Question#
9,  #genre_id#
45, #sub_genre_id#
    (select floor(rand() * 5)),
0 #difficulty#
);
select @question_id:=max(question_id) from questions;select @correct_idx:=correct_answer_idx from questions where question_id = @question_id; 
insert into correct_answers(question_id, correct_answer_idx, correct_answer) values(    @question_id, @correct_idx,
"fahrenheit 9/11" #answer
);
 #end 45

insert into wrong_answers(wrong_answer, question_id) values("2012", 1 );     
insert into wrong_answers(wrong_answer, question_id) values("2004", 1 );     
insert into wrong_answers(wrong_answer, question_id) values("2008", 1 );     
insert into wrong_answers(wrong_answer, question_id) values("Blitzkrieg", 2 );     
insert into wrong_answers(wrong_answer, question_id) values("Desert Storm", 2 );    
insert into wrong_answers(wrong_answer, question_id) values("Mission Accomplished", 2 );    
insert into wrong_answers(wrong_answer, question_id) values("DDT", 3 );     
insert into wrong_answers(wrong_answer, question_id) values("Glyphosate", 3 );     
insert into wrong_answers(wrong_answer, question_id) values("Mr. Pink", 3 );    
insert into wrong_answers(wrong_answer, question_id) values("USSR", 4 );     
insert into wrong_answers(wrong_answer, question_id) values("Germany", 4 );     
insert into wrong_answers(wrong_answer, question_id) values("China", 4 );     
insert into wrong_answers(wrong_answer, question_id) values("Stalingrad", 5 );     
insert into wrong_answers(wrong_answer, question_id) values("Battle of Midway", 5 );   
insert into wrong_answers(wrong_answer, question_id) values("Battle of Berlin", 5 );   
insert into wrong_answers(wrong_answer, question_id) values("Ebola", 6 );     
insert into wrong_answers(wrong_answer, question_id) values("Malaria", 6 );     
insert into wrong_answers(wrong_answer, question_id) values("Small Pox", 6 );    
insert into wrong_answers(wrong_answer, question_id) values("1912", 7 );     
insert into wrong_answers(wrong_answer, question_id) values("1937", 7 );     
insert into wrong_answers(wrong_answer, question_id) values("1999", 7 );     
insert into wrong_answers(wrong_answer, question_id) values("10.0", 8 );     
insert into wrong_answers(wrong_answer, question_id) values("8.8", 8 );     
insert into wrong_answers(wrong_answer, question_id) values("9.5", 8 );     
insert into wrong_answers(wrong_answer, question_id) values("HIV", 9 );     
insert into wrong_answers(wrong_answer, question_id) values("Ebola", 9 );     
insert into wrong_answers(wrong_answer, question_id) values("Norovirus", 9 );     
insert into wrong_answers(wrong_answer, question_id) values("Atom", 10 );     
insert into wrong_answers(wrong_answer, question_id) values("Nuetron", 10 );     
insert into wrong_answers(wrong_answer, question_id) values("Proton", 10 );     
insert into wrong_answers(wrong_answer, question_id) values("Lithosphere", 11 );     
insert into wrong_answers(wrong_answer, question_id) values("Biosphere", 11 );     
insert into wrong_answers(wrong_answer, question_id) values("Hydrosphere", 11 );     
insert into wrong_answers(wrong_answer, question_id) values("Monopoly", 12 );     
insert into wrong_answers(wrong_answer, question_id) values("Oligopoly", 12 );     
insert into wrong_answers(wrong_answer, question_id) values("Monopsony", 12 );     
insert into wrong_answers(wrong_answer, question_id) values("DDR", 13 );     
insert into wrong_answers(wrong_answer, question_id) values("ROFL", 13 );     
insert into wrong_answers(wrong_answer, question_id) values("BYOB", 13 );     
insert into wrong_answers(wrong_answer, question_id) values("Russia", 14 );     
insert into wrong_answers(wrong_answer, question_id) values("USA", 14 );     
insert into wrong_answers(wrong_answer, question_id) values("India", 14 );     
insert into wrong_answers(wrong_answer, question_id) values("Apple", 15 );     
insert into wrong_answers(wrong_answer, question_id) values("Amazon", 15 );     
insert into wrong_answers(wrong_answer, question_id) values("ExxonMobil", 15 );     
insert into wrong_answers(wrong_answer, question_id) values("Judiciary", 16 );     
insert into wrong_answers(wrong_answer, question_id) values("Executive", 16 );     
insert into wrong_answers(wrong_answer, question_id) values("Legislative", 16 );     
insert into wrong_answers(wrong_answer, question_id) values("Land area", 17 );    
insert into wrong_answers(wrong_answer, question_id) values("Lobbysts", 17 );     
insert into wrong_answers(wrong_answer, question_id) values("Each state has a set number", 17 );
insert into wrong_answers(wrong_answer, question_id) values("Washington", 18 );     
insert into wrong_answers(wrong_answer, question_id) values("New Jersey", 18 );    
insert into wrong_answers(wrong_answer, question_id) values("Florida", 18 );     
insert into wrong_answers(wrong_answer, question_id) values("Immigration", 19 );     
insert into wrong_answers(wrong_answer, question_id) values("Newly elected members of congress", 19 ); 
insert into wrong_answers(wrong_answer, question_id) values("Senators", 19 );     
insert into wrong_answers(wrong_answer, question_id) values("Ryan Tannehil", 20 );    
insert into wrong_answers(wrong_answer, question_id) values("Andrew Luck", 20 );    
insert into wrong_answers(wrong_answer, question_id) values("Russell Wilson", 20 );    
insert into wrong_answers(wrong_answer, question_id) values("4", 21 );     
insert into wrong_answers(wrong_answer, question_id) values("7", 21 );     
insert into wrong_answers(wrong_answer, question_id) values("5", 21 );     
insert into wrong_answers(wrong_answer, question_id) values("Cal Ripken Jr.", 22 );   
insert into wrong_answers(wrong_answer, question_id) values("Derek Jeter", 22 );    
insert into wrong_answers(wrong_answer, question_id) values("Kirby Pucket", 22 );    
insert into wrong_answers(wrong_answer, question_id) values("28", 23 );     
insert into wrong_answers(wrong_answer, question_id) values("36", 23 );     
insert into wrong_answers(wrong_answer, question_id) values("32", 23 );     
insert into wrong_answers(wrong_answer, question_id) values("Tokyo, Japan", 24 );    
insert into wrong_answers(wrong_answer, question_id) values("London, England", 24 );    
insert into wrong_answers(wrong_answer, question_id) values("Sydney, Australia", 24 );    
insert into wrong_answers(wrong_answer, question_id) values("St Augustine", 25 );    
insert into wrong_answers(wrong_answer, question_id) values("Albuquerque", 25 );     
insert into wrong_answers(wrong_answer, question_id) values("Sedona", 25 );     
insert into wrong_answers(wrong_answer, question_id) values("Brazil", 26 );     
insert into wrong_answers(wrong_answer, question_id) values("Columbia", 26 );     
insert into wrong_answers(wrong_answer, question_id) values("Venezuela", 26 );     
insert into wrong_answers(wrong_answer, question_id) values("Mediterranean Sea", 27 );    
insert into wrong_answers(wrong_answer, question_id) values("Black Sea", 27 );    
insert into wrong_answers(wrong_answer, question_id) values("Ionian Sea", 27 );    
insert into wrong_answers(wrong_answer, question_id) values("China", 28 );     
insert into wrong_answers(wrong_answer, question_id) values("Mongolia", 28 );     
insert into wrong_answers(wrong_answer, question_id) values("Taiwan", 28 );     
insert into wrong_answers(wrong_answer, question_id) values("Cambodia", 29 );     
insert into wrong_answers(wrong_answer, question_id) values("Laos", 29 );     
insert into wrong_answers(wrong_answer, question_id) values("Vietnam", 29 );     
insert into wrong_answers(wrong_answer, question_id) values("Angola", 30 );     
insert into wrong_answers(wrong_answer, question_id) values("Zambia", 30 );     
insert into wrong_answers(wrong_answer, question_id) values("Ethiopia", 30 );     
insert into wrong_answers(wrong_answer, question_id) values("Red Sea", 31 );    
insert into wrong_answers(wrong_answer, question_id) values("Persian Gulf", 31 );    
insert into wrong_answers(wrong_answer, question_id) values("Gulf of Oman", 31 );   
insert into wrong_answers(wrong_answer, question_id) values("12.7 Billion", 32 );    
insert into wrong_answers(wrong_answer, question_id) values("5.4 Billion", 32 );    
insert into wrong_answers(wrong_answer, question_id) values("2.1 Billion", 32 );    
insert into wrong_answers(wrong_answer, question_id) values("3", 33 );     
insert into wrong_answers(wrong_answer, question_id) values("4", 33 );     
insert into wrong_answers(wrong_answer, question_id) values("7", 33 );     
insert into wrong_answers(wrong_answer, question_id) values("United States", 34 );    
insert into wrong_answers(wrong_answer, question_id) values("China", 34 );     
insert into wrong_answers(wrong_answer, question_id) values("Russia", 34 );     
insert into wrong_answers(wrong_answer, question_id) values("JP Morgan Chase & Co Hack", 35 );
insert into wrong_answers(wrong_answer, question_id) values("The Conficker worm", 35 );   
insert into wrong_answers(wrong_answer, question_id) values("The DNC Hack", 35 );   
insert into wrong_answers(wrong_answer, question_id) values("New York", 36 );    
insert into wrong_answers(wrong_answer, question_id) values("Liverpool", 36 );     
insert into wrong_answers(wrong_answer, question_id) values("Glasgow", 36 );     
insert into wrong_answers(wrong_answer, question_id) values("Distant Relatives", 37 );    
insert into wrong_answers(wrong_answer, question_id) values("Life is Good", 37 );   
insert into wrong_answers(wrong_answer, question_id) values("It Was Written", 37 );   
insert into wrong_answers(wrong_answer, question_id) values("Pearl Jam", 38 );    
insert into wrong_answers(wrong_answer, question_id) values("Soundgarden", 38 );     
insert into wrong_answers(wrong_answer, question_id) values("Nirvana", 38 );     
insert into wrong_answers(wrong_answer, question_id) values("Kiss", 39 );     
insert into wrong_answers(wrong_answer, question_id) values("Scorpions", 39 );     
insert into wrong_answers(wrong_answer, question_id) values("Poison", 39 );     
insert into wrong_answers(wrong_answer, question_id) values("Gwen Stefani", 40 );    
insert into wrong_answers(wrong_answer, question_id) values("Mariah Carey", 40 );    
insert into wrong_answers(wrong_answer, question_id) values("Beyonce", 40 );     
insert into wrong_answers(wrong_answer, question_id) values("Romantic era", 41 );    
insert into wrong_answers(wrong_answer, question_id) values("Renaissance era", 41 );    
insert into wrong_answers(wrong_answer, question_id) values("Baroque era", 41 );    
insert into wrong_answers(wrong_answer, question_id) values("Arnold Schwzenegger", 42 );    
insert into wrong_answers(wrong_answer, question_id) values("Clint Eastwood", 42 );    
insert into wrong_answers(wrong_answer, question_id) values("John Travolta", 42 );    
insert into wrong_answers(wrong_answer, question_id) values("Rounders", 43 );     
insert into wrong_answers(wrong_answer, question_id) values("Fight Club", 43 );    
insert into wrong_answers(wrong_answer, question_id) values("12 Monkeys", 43 );    
insert into wrong_answers(wrong_answer, question_id) values("Woody Allen", 44 );    
insert into wrong_answers(wrong_answer, question_id) values("Terrence Malick", 44 );    
insert into wrong_answers(wrong_answer, question_id) values("Alexander Payne", 44 );    
insert into wrong_answers(wrong_answer, question_id) values("Earth", 45 );     
insert into wrong_answers(wrong_answer, question_id) values("An inconvenient Truth", 45 );   
insert into wrong_answers(wrong_answer, question_id) values("Bowling for Columbine", 45 ); 
commit;
