<?php
/*
class Trivia {
	const DB_HOST = '127.0.0.1';
	const DB_NAME = 'trivia';
	const DB_USER = 'ericsergio';
	const DB_PASSWORD = 'password';

	//$level = $_POST['level'];
	//$player1 = $_POST['player1'];
	//$player2 = $_POST['player2'];			
			
	public function __construct() {
		$this->level = $_POST['level'];
		$this->player1 = $_POST['player1'];
		$this->player2 = $_POST['player2'];
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
			
			//$level = $_POST['level'];
			//$player1 = $_POST['player1'];
			//$player2 = $_POST['player2'];			
			
			$arr_props = ['player_1', 'player_2', 'game_setting_id'];
			$arr_vals = [":player_1", ":player2", ":level"];

			$prop_str = implode(", ", $arr_props);
			$val_str = implode(", ", $arr_vals);
			$sql = "INSERT INTO players($prop_str) VALUES($val_str);";
			$stmt = $this->pdo->prepare($sql);
			$stmt->execute(array(":player_1" => $player_1));
			$stmt->execute(array(":player_2" => $player_2));
			$stmt->execute(array(":level" => $level));
			$stmt->closeCursor();
			
			$arr_props = ['game_setting_id','players_id', 'player_1_name', 'player_2_name'];
			$prop_str = implode(", ", $arr_props);
			$sql_start_players_id = "INSERT INTO current_game($prop_str) 
			VALUES($arr_vals[2],
			    (SELECT players_id FROM players WHERE players_id = 
					(SELECT max(players_id) FROM players)
				), $arr_vals[0], $arr_vals[1]
			)";
			$stmt = $this->pdo->prepare($sql_start_players_id);
			$stmt->execute();
			/*$stmt->closeCursor();
			
			$sql_player1_currentgame = "UPDATE current_game SET player_1_name = (
				SELECT player_1 FROM players
			    WHERE players.players_id = current_game.players_id
			) WHERE current_game.game_setting_id = 3";
			$stmt = $this->pdo->prepare($sql_player1_currentgame);
			$stmt->execute();
			$stmt->closeCursor();
			
			$sql_player2_currentgame = "UPDATE current_game SET player_2_name = (
				SELECT player_2 FROM players
			    WHERE players.players_id = current_game.players_id
			) WHERE current_game.game_setting_id = 3";
			$stmt = $this->pdo->prepare($sql_player2_currentgame);
			$stmt->execute();
			$stmt->closeCursor();
			
			$sql_level_currentgame = "UPDATE current_game SET game_setting_id = (
				SELECT game_setting_id FROM players
			    WHERE players.players_id = current_game.players_id
			) WHERE current_game.game_setting_id = 3";
			$stmt = $this->pdo->prepare($sql_level_currentgame);
			$stmt->execute();
			
			$this->pdo->commit();
			
			echo "if you see this then sweet";
			
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
	$obj = new Trivia();
	$obj->new_players($player_1, $player_2, $level);
*/
//========================================================
/*function one() {
	$id = $_POST['id'];
	$level = $_POST['level'];
	$player1 = $_POST['player1'];
	$player2 = $_POST['player2'];
	
	
	$arr_props = ['player_1', 'player_2', 'game_setting_id'];
	$arr_vals = ["'$player1'", "'$player2'", $level];

	$prop_str = implode(", ", $arr_props);
	$val_str = implode(", ", $arr_vals);
	
	$user = 'ericsergio';$pass = 'password';$host = '127.0.0.1';$db_name = 'trivia';
	$dsn = "mysql:host=$host;dbname=$db_name";
	$sql_players_id = '';
	
	try {
		$db = new PDO($dsn, $user, $pass);
		$query = "INSERT INTO players($prop_str) VALUES($val_str);";
		
		$stmt = $db->prepare($query);
		$stmt->execute();
		$db = NULL;
	} catch (PDOException $e) {
		echo "Error: " . $e->getMessage();
		exit;
	}
	echo  "<br />" . $query . "<br />"; 
	$db = NULL;
}

/*function three() {
	$id = $_POST['id'];
	$level = $_POST['level'];
	$player1 = $_POST['player1'];
	$player2 = $_POST['player2'];
	
	$arr_props = ['game_setting_id', 'players_id', 'player_1_name', 'player_2_name'];
	
	$prop_str = implode(", ", $arr_props);
	
	
	$user = 'ericsergio';$pass = 'password';$host = '127.0.0.1';$db_name = 'trivia';
	$dsn = "mysql:host=$host;dbname=$db_name";
	
	try {
		$db = new PDO($dsn, $user, $pass);
		$query = "INSERT INTO current_game($prop_str) VALUES($level, (SELECT MAX(players_id) FROM players) , '$player1', '$player2';";
		
		$stmt = $db->prepare($query);
		$stmt->execute();
		$db = NULL;
	} catch (PDOException $e) {
		echo "Error: " . $e->getMessage();
		exit;
	}
	echo  "<br />" . $query . "<br />"; 
	$db = NULL;
}
*/
//========================================
/*
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
			
			$sql_p1_do_active = "INSERT INTO p1_active_game(p1_active_game_id) 
			VALUES(
				(SELECT MAX(current_game_id) FROM current_game)
			)";
			$stmt = $this->pdo->prepare($sql_p1_do_active);
			$stmt->execute();
			$stmt->closeCursor();
			
			echo $sql_p1_do_active;
			
			$sql_p2_do_active = "INSERT INTO p2_active_game(p2_active_game_id) 
			VALUES(
				(SELECT MAX(current_game_id) FROM current_game)
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
	public function __destruct() {
		$this->pdo = null;
	}
}
	$new_game = new Trivia();
	$new_game->new_players($player_1, $player_2, $level);
?>
*/
//=====================
/*

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
			$stmt->closeCursor();
			
			$sql_do_active = "CALL active_game()";
			$stmt = $this->pdo->prepare($sql_do_active);
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
/*
?>