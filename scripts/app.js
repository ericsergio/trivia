function CurrentGame(stage, level, player1, player2, goes_first) {
	this.stage = stage || 1;
	this.level = level || 'needed';
	this.player1 = player1 || 'p1';
	this.player2 = player2 || 'p2';
	this.goes_first = goes_first || null;	
}

function CurrentTurn(stage, idx, player_turn) {
	this.stage = stage || 3;
	this.idx = idx || 0;
	this.player_turn = player_turn || null;
}

function Players(id, name, score) {
	this.id = id;
	this.name = name;
	this.score = score;
	this.currentTurn = false;
}

function getActivePlayer() {
	for(var p in Players) {
		if (Players[p].currentTurn === true) {
			var activePlayer = Players[p];
		}
	}
	return activePlayer;
}

//Players.prototype.getCurrent = function() {
//	if(this.name === CurrentGame.gameInit.goes_first) {
//	this.currentTurn = true;
//	}
//}

function turnOver() {
	var pArr = [];
	for(var p in Players) {
		pArr.push(Players[p]);
		if(Players[p].currentTurn === true) {
			var turnOver = Players[p];
		}
	}
	return turnOver;
}
function newTurn() {
	var pArr = [];
	for(var p in Players) {
		pArr.push(Players[p]);
		if(Players[p].currentTurn === false) {
			var nextTurn = Players[p];
		}
	}
	return nextTurn;
}
function switchTurn(prev, next) {
	prev = turnOver();
	next = newTurn();
	prev.currentTurn = false;
	next.currentTurn = true;
	CurrentTurn.turnInit.player_turn = next.name;
}

Players.prototype.addPoints = function () {
	var activePlayer = getActivePlayer();
	var consecutiveCorrect = CurrentTurn.turnInit.idx;
	
	if(consecutiveCorrect <= 3) {
		activePlayer.score += 10;
	} else {
		activePlayer.score += (10 * 1.25);
	}
//	activePlayer.score += 10;
	var eligibleElems = [$('#player1Display'), $('#player2Display')];
	var matchScoreElems = [$('#p1Score'), $('#p2Score')];
	for(var p in eligibleElems) {
		if(activePlayer.name === eligibleElems[p].html()) {
			var activeIdx = eligibleElems.indexOf(eligibleElems[p]);
		}
	}
	matchScoreElems[activeIdx].html(activePlayer.score);
}

CurrentGame.gameInit = new CurrentGame();

$(document).ready(function () {
	$('#start').on('click', function () {
		$(this).css({
			'box-shadow': 'inset 0px 0px 55px 2px #001a00'
		});
		$('#newGameDiv #initGame').append('<ul id = "levelQ"></ul>');
		var levels = ['Easy', 'Medium', 'Hard'];
		for(var p in levels) {
			if($('#levelQ').children() > 0) {
				$('#levelQ').children().remove();
			}
			$('#levelQ').append('<li id = "' + levels[p] + '">' + levels[p] + '</li>');
		}
		var startLeftPx = $('#start').offset().left;
		var levelQPaddingLeftPx = Number($('#levelQ').css('paddingLeft').replace('px', '')) / 2;
		var halfLevelQWidthPx = Number($('#levelQ').css('width').replace('px', '')) / 2;
		var levelQLeftPx = (startLeftPx - (halfLevelQWidthPx));// + levelQPaddingLeftPx));
		$('#levelQ').css('left', levelQLeftPx);
		$('#levelQ').children().on('click', function () {
			CurrentGame.gameInit.level = $(this).index();
			$(this).css({
				'box-shadow': 'inset 0px 0px 55px 2px #001a00'
			});
			$('#levelQ').children().not($(this)).css({
				'box-shadow': '0px 0px 35px 2px #000000'
			})
			if($('#playerQ')) {
				$('#playerQ').remove();
			}
			$('#newGameDiv #initGame').append('<ul id = "playerQ"></ul>');
			$('#playerQ').append('<li><input type = "text" id = "p1"></input></li>');
			$('#playerQ').append('<li><input type = "text" id = "p2"></input></li>');
			$('#playerQ').append('<li id = "confirmPlayers" onclick = "doPlayers()">Confirm</li>');
			var levelQWidthPx = halfLevelQWidthPx * 2;
			var playerQWidthPx = Number($('#playerQ').css('width').replace('px', ''));
			$('#playerQ').css('left', levelQLeftPx)
			$('#p1').focus();
		});
	});	
});


function doPlayers() {
	$('#levelQ').remove();
	if($('#p1').val().length > 0) {
		CurrentGame.gameInit.player1 = $('#p1').val();
	} else {
		CurrentGame.gameInit.player1 = 'Player1';
	}
	if($('#p1').val().length > 0) {
		CurrentGame.gameInit.player2 = $('#p2').val();
	} else {
		CurrentGame.gameInit.player2 = 'Player2';
	}
	insertNewPlayers(CurrentGame.gameInit);
	$('#playerQ').remove();
	$('#initGame').append('<p id = "player1Display">' + CurrentGame.gameInit.player1 + '</p>');
	$('#initGame').append('<p id = "player2Display">' + CurrentGame.gameInit.player2 + '</p>');
	
	var startLeftPx = $('#start').offset().left;
	var p1LeftPx = startLeftPx * .8;
	var p1 = $('#player1Display'), p2 = $('#player2Display');
	p1.css({
		'left': p1LeftPx,
		'width': '10%',
		'backgroundColor': 'beige'
		});
	p2.css({
		'right': p1LeftPx,
		'width': '10%',
		'backgroundColor': 'beige'
		});
	startGame();
}

function insertNewPlayers(obj) {
	var props = [];
	for(var p in obj) {
		props.push(obj[p]);	
	}
	$.post("pages/fn.php", { stage: props[0], level: props[1], player1: props[2], player2: props[3], goes_first: props[4], current_turn: props[5], get_question: props[6] })
	.done(function(data) {
		console.log("ajax response : " + data);
	});
};
function updateGoesFirst(obj) {
	CurrentGame.gameInit.stage = 2;
	/////////////set players current
	var props = [];
	for(var p in obj) {
		props.push(obj[p]);	
	}
	$.post("pages/fn.php", {stage: props[0], level: props[1], player1: props[2], player2: props[3], goes_first: props[4], current_turn: props[5], get_question: props[6] })
	.done(function(data) {
		//console.log("updateFunction: " + data);
	});
}
function getCurrentQuestion(obj) {
	var props = [];
	for(var p in obj) {
		props.push(obj[p]);
	}
	$.post("pages/fn.php", {stage: props[0], idx: props[1], player_turn: props[2] })
	.done(function(data) {
		$('#questionDiv').append(data);
	});
	////////////////
}

function startGame() {
	var p1 = $('#player1Display'), p2 = $('#player2Display');
	var p1Left = p1.offset().left, p2Left = p2.offset().left, p2Top = p2.offset().top;
	var p2Height = Number(p2.css('height').replace('px', ''));
	$('body').prepend('<p id = "vs">VS</p>');
	var pVs = $('#vs');
	var vsLeft = (p1Left + p2Left) / 2;
	pVs.css({
		'position':'absolute',
		'top':p2Top - p2Height,
		'left':vsLeft
	});
	var startNum = ((Math.round(Math.random() * 50)) * 99);
	$('#count').html(startNum);
	var interval = setInterval(function() {doStart(startNum)}, 200);
	setTimeout(function() {
		clearInterval(interval);
		if((startNum % 2) === 0) {
			firstP = p2.html();
		} else {
			firstP = p1.html();
		}
		$('#newGameDiv').append('<p id = "selectedFirst">' + firstP + '</p>');
		CurrentGame.gameInit.goes_first = firstP;
		
		
		var gamePlayers = [CurrentGame.gameInit.player1, CurrentGame.gameInit.player2];
		Players[[CurrentGame.gameInit.goes_first]] = new Players(1, CurrentGame.gameInit.goes_first, 0);
		
		if(CurrentGame.gameInit.goes_first !== Players[[CurrentGame.gameInit.player1]]) {
			Players[[CurrentGame.gameInit.player1]] = new Players(2, CurrentGame.gameInit.player1, 0);
		} 
		if(CurrentGame.gameInit.goes_first !== Players[[CurrentGame.gameInit.player2]]) {
			Players[[CurrentGame.gameInit.player2]] = new Players(2, CurrentGame.gameInit.player2, 0)
		};
		
		for(var p in Players) {
			if(Players[p].name === CurrentGame.gameInit.goes_first)
			Players[p].currentTurn = true;
		}
		
		updateGoesFirst(CurrentGame.gameInit);
		$('#start').fadeOut(1000);
		p1.fadeOut(1000);
		p2.fadeOut(1000);
		$('#vs').fadeOut(1000);
		var countStart = 3;
		var timer = setInterval(function() {
			if(countStart === 0) {
				countStart = null;
				//$('#selectedFirst').remove();
				CurrentGame.gameInit.stage = 3;
				var idx = 1;
				CurrentTurn.turnInit = new CurrentTurn(CurrentGame.gameInit.stage, idx, CurrentGame.gameInit.goes_first);
				
				getCurrentQuestion(CurrentTurn.turnInit);
				p1.css({
					'top': '15%',
					'left': '4%'
				})
				p1.show();
				var p1ScoreTop = p1.offset().top + 15;
				p1.before('<p id = "p1Score"></p>');
				$('#p1Score').css({
					'top':p1ScoreTop + 'px',
					'left':'4%'
				})
				p2.css({
					'top': '30%',
					'left': '4%'
				})
				p2.show();
				var p2ScoreTop = p2.offset().top + 15;
				p2.before('<p id = "p2Score"></p>');
				$('#p2Score').css({
					'top':p2ScoreTop + 'px',
					'left':'4%'
				})
			}
			$('#selectedFirst').html(countStart);
			$('#selectedFirst').css({
				"fontSize" : "3.7em"
			})
			countStart -= 1;
		}, 1000);
		setTimeout(function () {
			clearInterval(timer);
		}, 4000);
		$('#newGameDiv').append('<div id = "questionDiv"></div>');
	}, startNum);
};

function doStart(startNum) {
	var p1 = $('#player1Display'), p2 = $('#player2Display');
	if(startNum % 2 === 0) {
		var p1Color = "#ff0000", p2Color = "#00cccc";
	} else {
		var p2Color = "#ff0000", p1Color = "#00cccc";
	};
	p1.css("backgroundColor", p1Color);
	p2.css("backgroundColor", p2Color);
	if(p1.css("backgroundColor") != p2Color) {
		setTimeout(function() {
			p1.css("backgroundColor", p2Color);
		}, 100);
		setTimeout(function() {
			p2.css("backgroundColor", p1Color);
		}, 100);
	};
};

function doCorrect() {
	setTimeout(function() {
		Players.prototype.addPoints();
		$('#questionDiv').children().remove();
		getCurrentQuestion(CurrentTurn.turnInit);
		CurrentTurn.turnInit.idx += 1;
	}, 400);
}
function doWrong() {
	setTimeout(function() {
		$('#showTurn').remove();
		switchTurn();
		$('#player1Display').after('<p id = "showTurn">' + CurrentTurn.turnInit.player_turn + '</p>');
		$('#questionDiv').children().remove();
		CurrentTurn.turnInit.idx = 0;
		getCurrentQuestion(CurrentTurn.turnInit);
	}, 400);
}

function clicked(idx) {
	$('#answerOptions').children(':eq(' + idx + ')').css('box-shadow', '0px 2px 5px 2px #000000');
}

