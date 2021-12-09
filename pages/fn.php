<?php
	$stage = $_POST['stage'];
	include('trivia.php');
	$new_game = new Trivia();
	if($stage == 1) {
		$level = $_POST['level'];
		$player_1 = $_POST['player1'];
		$player_2 = $_POST['player2'];
		$new_game->new_players($player_1, $player_2, $level);
	}
	if($stage == 2) {
		$goes_first = $_POST['goes_first'];
		$new_game->goes_first($goes_first);
	}
	if($stage == 3) {
		$idx = $_POST['idx'];
		$player_turn = $_POST['player_turn'];
		$new_game->current_player_question($idx, $player_turn);
	}
?>