<?php	
	class Trivia {
		const DB_HOST = '127.0.0.1';
		const DB_NAME = 'trivia';
		const DB_USER = 'ericsergio';
		const DB_PASSWORD = 'password';
		
		public function __construct() {
			//the :: operator allows you to access per class constants
			//the special keywords self, static, and parent are used to access properties or methods from inside the class definition.
			$conStr = sprintf("mysql:host=%s;dbname=%s", self::DB_HOST, self::DB_NAME);
			try {
				$this->pdo = new PDO($conStr, self::DB_USER, self::DB_PASSWORD);
			} catch (PDOException $e) {
				die($e->getMessage());
			}
		}
		private $pdo = null;
		public function new_players($player_1, $player_2, $level) {
			try {
				$this->pdo->beginTransaction();
							
				$arr_props = ['player_1', 'player_2', 'game_setting_id'];
				$arr_vals = ["'$player_1'", "'$player_2'", "$level"];

				$prop_str = implode(", ", $arr_props);
				$val_str = implode(", ", $arr_vals);
				$sql = "INSERT INTO players($prop_str) VALUES($val_str);";
				
				$stmt = $this->pdo->prepare($sql);
				$stmt->execute();
				$stmt->closeCursor();
				
				$arr_props = ['game_setting_id','players_id', 'player_1_name', 'player_2_name'];
				$prop_str = implode(", ", $arr_props);
				$sql_start_players_id = "INSERT INTO current_game($prop_str) 
				VALUES($arr_vals[2],
				    (SELECT players_id FROM players WHERE players_id = (SELECT MAX(players_id) FROM players))
					, $arr_vals[0], $arr_vals[1]
				)";
				
				$stmt = $this->pdo->prepare($sql_start_players_id);
				$stmt->execute();
				$stmt->closeCursor();
				
				$sql_delete_previous_p1 = "DELETE FROM p1_active_game WHERE p1_active_game_id > 0";
				$stmt = $this->pdo->prepare($sql_delete_previous_p1);
				$stmt->execute();
				$stmt->closeCursor();

				$sql_delete_previous_p2 = "DELETE FROM p2_active_game WHERE p2_active_game_id > 0";
				$stmt = $this->pdo->prepare($sql_delete_previous_p2);
				$stmt->execute();
				$stmt->closeCursor();
				
				$sql_p1_do_active = "INSERT INTO p1_active_game(p1_active_game_id, p_name) 
				VALUES(
					(SELECT MAX(current_game_id) FROM current_game),
					(SELECT player_1_name FROM current_game WHERE current_game_id = 
						(SELECT current FROM max_curr_game)
					)
				)";
				$stmt = $this->pdo->prepare($sql_p1_do_active);
				$stmt->execute();
				$stmt->closeCursor();
				
				
				$sql_p2_do_active = "INSERT INTO p2_active_game(p2_active_game_id, p_name) 
				VALUES(
					(SELECT MAX(current_game_id) FROM current_game),
					(SELECT player_2_name FROM current_game WHERE current_game_id = 
						(SELECT current FROM max_curr_game)
					)
				)";
				$stmt = $this->pdo->prepare($sql_p2_do_active);
				$stmt->execute();
				
				$this->pdo->commit();
				return true;
			} catch (PDOException $e) {
				$this->pdo->rollback();
				die($e->getMessage());
			}
		}
		public function goes_first($goes_first) {
			try {
				$this->pdo->beginTransaction();
				$update_query = "UPDATE current_game SET goes_first = '$goes_first' WHERE current_game_id = (SELECT current from max_curr_game)";
				echo $update_query;
				$stmt = $this->pdo->prepare($update_query);
				$stmt->execute();
				$stmt->closeCursor();
				
				$update_p1_active_query = "UPDATE p1_active_game SET turn_idx = 1 WHERE p_name = '$goes_first'";
				$stmt = $this->pdo->prepare($update_p1_active_query);
				$stmt->execute();
				$stmt->closeCursor();

				$update_p2_active_query = "UPDATE p2_active_game SET turn_idx = 1 WHERE p_name = '$goes_first'";
				$stmt = $this->pdo->prepare($update_p2_active_query);
				$stmt->execute();
				$stmt->closeCursor();
				
				$update_p1_active_query = "UPDATE p1_active_game SET turn_idx = 2 WHERE turn_idx IS NULL";
				$stmt = $this->pdo->prepare($update_p1_active_query);
				$stmt->execute();
				$stmt->closeCursor();

				$update_p2_active_query = "UPDATE p2_active_game SET turn_idx = 2 WHERE turn_idx IS NULL";
				$stmt = $this->pdo->prepare($update_p2_active_query);
				$stmt->execute();				
				
				$this->pdo->commit();
			} catch(PDOException $e) {
				echo "Error: ".$e->getMessage();
				exit;
			}
		}
		public function current_player_question($idx, $player_turn) {
		try {
			$this->pdo->beginTransaction();
			$query = "select @count:=count(question) as count from questions;";
			//$query = "call rand_test()";
			$stmt = $this->pdo->prepare($query);
			$stmt->execute();
			while($result = $stmt->fetch(PDO::FETCH_OBJ)) {
				$sql_count = $result->count;
				//echo $sql_count;
			}
			$stmt->closeCursor();
			
			$query1 = "select @rand_q:=floor(rand() * $sql_count) as rand;";
			//$query = "call rand_test()";
			$stmt = $this->pdo->prepare($query1);
			$stmt->execute();
			while($result = $stmt->fetch(PDO::FETCH_OBJ)) {
				$sql_rand = $result->rand;
				//echo "| $sql_rand |";
			}
			$stmt->closeCursor();

			$query2="select @rand_question:=question as question from questions where $sql_rand = question_id;";
			$stmt = $this->pdo->prepare($query2);
			$stmt->execute();
			while($result = $stmt->fetch(PDO::FETCH_OBJ)) {
				$sql_question = $result->question;
				//echo "<script type='text/javascript'>CollectData.currentData.question = $sql_question</script>";
				echo "<h2 id = 'currQuestion'> $sql_question </h2>";
				echo "<ul id = 'answerOptions'>";
			}
			$stmt->closeCursor();
			
			$query3="select @correct:=TRIM(correct_answer) as correct from correct_answers where $sql_rand = question_id;";
			$stmt = $this->pdo->prepare($query3);
			$stmt->execute();
			while($result = $stmt->fetch(PDO::FETCH_OBJ)) {
				$sql_correct = $result->correct;
				echo "<li id = 'correct'> $sql_correct </li>";
			}
			$stmt->closeCursor();
			
			$query4="SELECT @wrong1:=wrong_answer AS wrong1 FROM wrong_answers WHERE wrong_answer_id = (
						(select (MIN(w.wrong_answer_id))
						from questions q
						join wrong_answers w
						on q.question_id = w.question_id
						where q.question_id = $sql_rand
						order by wrong_answer_id)
			);";
			$stmt = $this->pdo->prepare($query4);
			$stmt->execute();
			while($result = $stmt->fetch(PDO::FETCH_OBJ)) {
				$sql_wrong1 = $result->wrong1;
				echo "<li id = 'wrong1'> $sql_wrong1 </li>";
			}
			$stmt->closeCursor();
			
			
			$query5="SELECT @wrong2:=wrong_answer AS wrong2 FROM wrong_answers WHERE wrong_answer_id = (
						(select (MIN(w.wrong_answer_id) + 1)
						from questions q
						join wrong_answers w
						on q.question_id = w.question_id
						where q.question_id = $sql_rand
						order by wrong_answer_id)
			);";
			$stmt = $this->pdo->prepare($query5);
			$stmt->execute();
			while($result = $stmt->fetch(PDO::FETCH_OBJ)) {
				$sql_wrong2 = $result->wrong2;
				echo "<li id = 'wrong2'> $sql_wrong2 </li>";
			}
			$stmt->closeCursor();

			$query6="SELECT @wrong3:=wrong_answer AS wrong3 FROM wrong_answers WHERE wrong_answer_id = (
						(select (MIN(w.wrong_answer_id) + 2)
						from questions q
						join wrong_answers w
						on q.question_id = w.question_id
						where q.question_id = $sql_rand
						order by wrong_answer_id)
			);";
			$stmt = $this->pdo->prepare($query6);
			$stmt->execute();
			while($result = $stmt->fetch(PDO::FETCH_OBJ)) {
				$sql_wrong3 = $result->wrong3;
				echo "<li id = 'wrong3'> $sql_wrong3 </li>";
				echo "</ul>";
			}
			$stmt->closeCursor();
			
			$query7 = "SELECT @correct_idx:=correct_answer_idx AS correct_idx FROM correct_answers WHERE question_id = $sql_rand;";
			$stmt = $this->pdo->prepare($query7);
			$stmt->execute();
			while($result = $stmt->fetch(PDO::FETCH_OBJ)) {
				$sql_correct_idx = $result->correct_idx;
				echo "<p id = 'correct_idx'>$sql_correct_idx</p>";
			}


//select correct_answer_idx into correct_idx from correct_answers where question_id = selected_question_id;
			
			$this->pdo->commit();
		} catch(PDOException $e) {
			echo "Error: ".$e->getMessage();
			exit;
		}

			//echo "index : $idx | player turn : $player_turn";
		}
		public function __destruct() {
			$this->pdo = null;
		}
	}
?>