<?php

$level = $_POST['level'];
$player_1 = $_POST['player1'];
$player_2 = $_POST['player2'];

class Trivia {
	const DB_HOST = '127.0.0.1';
	const DB_NAME = 'trivia';
	const DB_USER = 'ericsergio';
	const DB_PASSWORD = 'password';
	
	public function __construct() {
		//the :: operator allows you to access per class constants
		//the special keywords self, static, and parent are used to access properties or methods from inside the class definition.
		//Pretty sure that means that if/when I were to create a class that extended Trivia then the connection string would be this with parent rather than self
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
			    (SELECT players_id FROM players WHERE players_id = (SELECT max(players_id) FROM players))
				, $arr_vals[0], $arr_vals[1]
			)";
			
			$stmt = $this->pdo->prepare($sql_start_players_id);
			$stmt->execute();
			$this->pdo->commit();
			return true;
		} catch (PDOException $e) {
			$this->pdo->rollback();
			die($e->getMessage());
		}
	}
	public function __destruct() {
		$this->pdo = null;
	}
}
	$new_game = new Trivia();
	$new_game->new_players($player_1, $player_2, $level);
?>