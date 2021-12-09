<?php
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
	if($id === '1') {
		try{
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
	} else {
	try{
		$db = new PDO($dsn, $user, $pass);
		$query = "SELECT players_id, game_setting_id FROM players WHERE $arr_props[0] like $arr_vals[0];";
		$stmt = $db->prepare($query);
		$stmt->execute();
		while($result = $stmt->fetch(PDO::FETCH_OBJ)) {
			$sql_players_id = $result->players_id;
			$sql_game_setting_id = $result->game_setting_id;
			$result_arr = [$sql_players_id, $sql_game_setting_id];
			extract($result_arr);
			$fp = fopen("t.txt", 'a');
			fwrite($fp, $result_arr[0]);
			fclose($fp);

		}
		$db = NULL;
	} catch (PDOException $e) {
		echo "Error: " . $e->getMessage();
		exit;
	}
}
?>
