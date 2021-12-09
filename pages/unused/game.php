<?php
	class TriviaGame {
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
		public function current_player_question() {
			
			echo "<p>one two three</p>";
			/*try{
				$sql_question = "CALL rand_question()";
				$stmt = $this->pdo->prepare($sql_question);
				$stmt->execute();
				while($result = $stmt->fetch(PDO::FETCH_OBJ)) {
					$sql_field_count = $result->count;
					$sql_field_selected = $result->selected;
					$sql_field_random_question = $result->random_question;
					$sql_field_correct_idx = $result->correct_idx;
					$sql_field_correct = $result->correct;
					$sql_field_incorrect_1 = $result->incorrect_1;
					$sql_field_incorrect_2 = $result->incorrect_2;
					$sql_field_incorrect_3 = $result->incorrect_3;
					//echo $sql_field_question;
					$result_arr = [$sql_field_count, $sql_field_selected, $sql_field_random_question, $sql_field_correct_idx, $sql_field_correct, $sql_field_incorrect_1, $sql_field_incorrect_2, $sql_field_incorrect_3];
					extract($result_arr);
					foreach($result_arr as $current) {
						echo "<p>$current</p>";
					}
				}
				
				//echo $sql_field_random_question;
			} catch(PDOException $e) {
				echo "Error: ".$e->getMessage();
				exit;
			}*/
			//echo $result_arr[2];
			//echo "index : $idx | player turn : $player_turn";
		}
		public function __destruct() {
			$this->pdo = null;
		}
	}
$trivia_game = new TriviaGame();
$trivia_game->current_player_question();	

/*
$user = 'ericsergio';$pass = 'password';$host = '127.0.0.1';$db_name = 'trivia';
		
		$dsn = "mysql:host=$host;dbname=$db_name";
		
	try {
		$db = new PDO($dsn, $user, $pass);
		$query = "CALL rand_question()";
		$stmt = $db->prepare($query);
		$stmt->execute();
	
		while($result = $stmt->fetch(PDO::FETCH_OBJ)) {
			$sql_field_count = $result->count;
			$sql_field_selected = $result->selected;
			$sql_field_random_question = $result->random_question;
			$sql_field_correct_idx = $result->correct_idx;
			$sql_field_correct = $result->correct;
			$sql_field_incorrect_1 = $result->incorrect_1;
			$sql_field_incorrect_2 = $result->incorrect_2;
			$sql_field_incorrect_3 = $result->incorrect_3;
			echo $sql_field_random_question;
		}
		
	$db = NULL;
	} catch(PDOException $e) {
		echo "Error: ".$e->getMessage();
		exit;
	}
*/
?>