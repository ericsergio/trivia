drop database if exists trivia;
create database trivia;
use trivia;

drop table if exists sub_genres;
drop table if exists genres;
create table genres(
	genre_id int not null auto_increment,
	genre_name varchar(45) not null,
    primary key(genre_id)
)
engine = InnoDB
default character set = utf8mb4;

create table sub_genres(
	sub_genre_id int not null auto_increment,
	sub_genre_name varchar(45) not null,
    genre_id int not null,
    primary key(sub_genre_id),
    index sub_genres_fk_genres_idx (genre_id asc) visible,
    constraint sub_genres_fk_genres
		foreign key (genre_id)
        references trivia.genres(genre_id)
        on delete restrict
        on update restrict
)
engine = InnoDB
default character set = utf8mb4;

drop table if exists game_settings;
create table game_settings(
	game_setting_id int not null,
    game_setting_difficulty varchar(8) not null,
    game_setting_time int not null,
    primary key(game_setting_id)
)
engine = InnoDB
default character set = utf8mb4;

drop table if exists questions;
create table questions(
	question_id int not null,
	question varchar(345) not null,
    genre_id int not null,
    sub_genre_id int not null,
	correct_answer_idx int not null,
    game_setting_id int not null,
    primary key(question_id),
    index questions_fk_sub_genres_idx (sub_genre_id asc) visible,
	index questions_fk_genres_idx (genre_id asc) visible,
    constraint questions_fk_sub_genres
		foreign key (sub_genre_id)
        references trivia.sub_genres(sub_genre_id)
        on delete restrict
        on update restrict,
    constraint questions_fk_genres
		foreign key (genre_id)
        references trivia.genres(genre_id)
        on delete restrict
        on update restrict,
#	constraint questions_fk_current_game
#		foreign key (current_game_id)
#        references trivia.current_game(current_game_id)
#        on delete restrict
#        on update restrict,
	constraint questions_fk_game_setting
		foreign key (game_setting_id)
        references trivia.game_settings(game_setting_id)
        on delete restrict
        on update restrict
)
engine = InnoDB
default character set = utf8mb4;

drop table if exists correct_answers;
create table correct_answers(
	question_id int not null,
    correct_answer_idx int default null,
    correct_answer varchar(345) not null,
    primary key(question_id),
    index correct_answers_fk_questions_idx (question_id asc) visible,
    constraint correct_answers_fk_questions
		foreign key (question_id)
        references trivia.questions(question_id)
        on delete restrict
        on update restrict
)
engine = InnoDB
default character set = utf8mb4;

drop table if exists wrong_answers;
create table wrong_answers(
	wrong_answer_id int not null auto_increment,
    wrong_answer varchar(345) not null,
    question_id int not null,
    primary key(wrong_answer_id),
    index wrong_answers_fk_questions_idx (question_id asc) visible,
    constraint wrong_answers_fk_questions
		foreign key (question_id)
        references trivia.questions(question_id)
        on delete restrict
        on update restrict
)
engine = InnoDB
default character set = utf8mb4;

drop table if exists players;
create table players(
	players_id int(5) not null auto_increment,
    player_1 varchar(50) default 'Player 1',
    player_2 varchar(50) default 'Player 2',
    game_setting_id int,
    primary key(players_id),
    index players_fk_current_game_idx (game_setting_id),
    constraint players_fk_game_settings
		foreign key (game_setting_id)
        references trivia.game_settings(game_setting_id)
        on delete restrict
        on update restrict
)
engine = InnoDB
default character set = utf8mb4;

drop table if exists current_game;
create table current_game(
	current_game_id int not null auto_increment,
	game_setting_id int not null,
    players_id int not null,
    player_1_name varchar(100),
    player_2_name varchar(100),
    goes_first varchar(100) default null,
    primary key(current_game_id),
    index current_game_fk_players_idx (players_id asc) visible,
    constraint current_game_fk_players
		foreign key (players_id)
        references trivia.players(players_id)
        on delete restrict
        on update restrict
)
engine = InnoDB
default character set = utf8mb4;

drop table if exists high_scores;
create table high_scores(
	high_score_id int not null auto_increment,
    players_id int not null,
    player_first_name varchar(50) default 'anonymous',
    player_last_name varchar(50) default null,
    primary key(high_score_id),
    index high_scores_fk_players_idx (high_score_id),
	constraint high_scores_fk_players
        foreign key (players_id)
        references trivia.players(players_id)
        on delete restrict
        on update restrict
)
engine = InnoDB
default character set = utf8mb4;

drop table if exists p1_active_game;
create table p1_active_game(
	p1_active_game_id int not null,
    p_name varchar(100) default null,
    score int DEFAULT 0,
    turn_idx int default null,
    primary key(p1_active_game_id),
    constraint p1_active_game_fk_current_game
		foreign key (p1_active_game_id)
        references trivia.current_game(current_game_id)
        on delete restrict
        on update restrict
)
engine = InnoDB
default character set = utf8mb4;

drop table if exists p2_active_game;
create table p2_active_game(
	p2_active_game_id int not null,
    p_name varchar(100) default null,
    score int DEFAULT 0,
    turn_idx int default null,
    primary key(p2_active_game_id),
    constraint p2_active_game_fk_current_game
		foreign key (p2_active_game_id)
        references trivia.current_game(current_game_id)
        on delete restrict
        on update restrict
)
engine = InnoDB
default character set = utf8mb4;

insert into genres(genre_name) values ('History');
insert into genres(genre_name) values ('Science');
insert into genres(genre_name) values ('Economics');
insert into genres(genre_name) values ('Politics');
insert into genres(genre_name) values ('Sports');
insert into genres(genre_name) values ('Geography');
insert into genres(genre_name) values ('Technology');
insert into genres(genre_name) values ('Music');
insert into genres(genre_name) values ('Movies');

insert into sub_genres(sub_genre_name, genre_id) values ('Modern', 1);
insert into sub_genres(sub_genre_name, genre_id) values ('Iraq War', 1);
insert into sub_genres(sub_genre_name, genre_id) values ('Vietnam War', 1);
insert into sub_genres(sub_genre_name, genre_id) values ('Korean War', 1);
insert into sub_genres(sub_genre_name, genre_id) values ('WWII', 1);
insert into sub_genres(sub_genre_name, genre_id) values ('WWI', 1);
insert into sub_genres(sub_genre_name, genre_id) values ('Environmental', 2);
insert into sub_genres(sub_genre_name, genre_id) values ('Geological', 2);
insert into sub_genres(sub_genre_name, genre_id) values ('Biological', 2);
insert into sub_genres(sub_genre_name, genre_id) values ('Chemistry', 2);
insert into sub_genres(sub_genre_name, genre_id) values ('Atmospheric', 2);
insert into sub_genres(sub_genre_name, genre_id) values ('Micro', 3);
insert into sub_genres(sub_genre_name, genre_id) values ('Macro', 3);
insert into sub_genres(sub_genre_name, genre_id) values ('Global', 3);
insert into sub_genres(sub_genre_name, genre_id) values ('Domestic', 3);
insert into sub_genres(sub_genre_name, genre_id) values ('Impeachment', 4);
insert into sub_genres(sub_genre_name, genre_id) values ('Congressional', 4);
insert into sub_genres(sub_genre_name, genre_id) values ('State', 4);
insert into sub_genres(sub_genre_name, genre_id) values ('Lobbying', 4);
insert into sub_genres(sub_genre_name, genre_id) values ('Football', 5);
insert into sub_genres(sub_genre_name, genre_id) values ('Basketball', 5);
insert into sub_genres(sub_genre_name, genre_id) values ('Baseball', 5);
insert into sub_genres(sub_genre_name, genre_id) values ('Hockey', 5);
insert into sub_genres(sub_genre_name, genre_id) values ('Olympics', 5);
insert into sub_genres(sub_genre_name, genre_id) values ('North_America', 6);
insert into sub_genres(sub_genre_name, genre_id) values ('South_America', 6);
insert into sub_genres(sub_genre_name, genre_id) values ('Europe', 6);
insert into sub_genres(sub_genre_name, genre_id) values ('Asia', 6);
insert into sub_genres(sub_genre_name, genre_id) values ('Southeast_Asia', 6);
insert into sub_genres(sub_genre_name, genre_id) values ('Africa', 6);
insert into sub_genres(sub_genre_name, genre_id) values ('Middle_East', 6);
insert into sub_genres(sub_genre_name, genre_id) values ('Internet', 7);
insert into sub_genres(sub_genre_name, genre_id) values ('Automation', 7);
insert into sub_genres(sub_genre_name, genre_id) values ('Innovations', 7);
insert into sub_genres(sub_genre_name, genre_id) values ('Hacks', 7);
insert into sub_genres(sub_genre_name, genre_id) values ('Classic_Rock', 8);
insert into sub_genres(sub_genre_name, genre_id) values ('Hip_Hop', 8);
insert into sub_genres(sub_genre_name, genre_id) values ('Grunge', 8);
insert into sub_genres(sub_genre_name, genre_id) values ('80\'s', 8);
insert into sub_genres(sub_genre_name, genre_id) values ('Pop', 8);
insert into sub_genres(sub_genre_name, genre_id) values ('Classical', 8);
insert into sub_genres(sub_genre_name, genre_id) values ('Action', 9);
insert into sub_genres(sub_genre_name, genre_id) values ('Drama', 9);
insert into sub_genres(sub_genre_name, genre_id) values ('Comedy', 9);
insert into sub_genres(sub_genre_name, genre_id) values ('Documentaries', 9);

insert into game_settings(game_setting_id, game_setting_difficulty, game_setting_time) values(0, 'easy', 60);
insert into game_settings(game_setting_id, game_setting_difficulty, game_setting_time) values(1, 'middle', 45);
insert into game_settings(game_setting_id, game_setting_difficulty, game_setting_time) values(2, 'hard', 30);

create or replace view max_curr_game as 
select max(current_game_id) as current
from current_game;

