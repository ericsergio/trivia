drop procedure if exists rand_question;
DELIMITER //
create procedure rand_question()
begin
	declare question_count int;
	declare selected_question_id int;
    declare random_question varchar(345);
    declare correct varchar(345);
    declare incorrect_1 varchar(345);
    declare incorrect_2 varchar(345);
    declare incorrect_3 varchar(345);
    declare correct_idx int;
    
    select count(question) into question_count from questions;
	select floor(rand() * question_count) into selected_question_id;
    select question into random_question from questions where selected_question_id = question_id;
    select correct_answer into correct from correct_answers where question_id = selected_question_id;
    
    select wrong_answer into incorrect_1
    from wrong_answers
	where wrong_answer_id = (
		(select (min(w.wrong_answer_id))
		from questions q
		join wrong_answers w
		on q.question_id = w.question_id
		where q.question_id = selected_question_id
		order by wrong_answer_id)
);

    select wrong_answer into incorrect_2
    from wrong_answers
	where wrong_answer_id = (
		(select (min(w.wrong_answer_id) + 1)
		from questions q
		join wrong_answers w
		on q.question_id = w.question_id
		where q.question_id = selected_question_id
		order by wrong_answer_id)
);

    select wrong_answer into incorrect_3
    from wrong_answers
	where wrong_answer_id = (
		(select (min(w.wrong_answer_id) + 2)
		from questions q
		join wrong_answers w
		on q.question_id = w.question_id
		where q.question_id = selected_question_id
		order by wrong_answer_id)
);

	select correct_answer_idx into correct_idx from correct_answers where question_id = selected_question_id;
    
    select question_count as count, selected_question_id as selected, random_question, correct_idx, 
    correct, incorrect_1, incorrect_2, incorrect_3;
    
end//
DELIMITER ;

