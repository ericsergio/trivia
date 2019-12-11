function CurrentGame(stage, level, player1, player2, goes_first) {
	this.stage = stage || 1;
	this.level = level || 'needed';
	this.player1 = player1 || 'p1';
	this.player2 = player2 || 'p2';
	this.goes_first = goes_first || null;	
}

function CurrentTurn(stage, idx, player_turn) {
	this.stage = stage || 3;
	this.idx = idx || 1;
	this.player_turn = player_turn || null;
}

/*function CollectData(question, correct, wrong1, wrong2, wrong3, idx) {
	this.question = question || null;
	this.correct = correct || null;
	this.wrong1 = wrong1 || null;
	this.wrong2 = wrong2 || null;
	this.wrong3 = wrong3 || null;
	this.idx = idx || null;
}*/


CurrentGame.gameInit = new CurrentGame();
//CollectData.currentData = new CollectData();

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
	var props = [];
	for(var p in obj) {
		props.push(obj[p]);	
	}
	$.post("pages/fn.php", {stage: props[0], level: props[1], player1: props[2], player2: props[3], goes_first: props[4], current_turn: props[5], get_question: props[6] })
	.done(function(data) {
		console.log("updateFunction: " + data);
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
	
}

/*function collect() {
	var arr = [];
	arr.push($('#currQuestion').text().replace(/ \t/,'').replace(/\t /, ''));
	$('#answerOptions').each(function () {
		arr.push($(this).text().replace(/ \t/,'').replace(/\t /, ''))
	});
	arr.push(Number($('#correct_idx').html()));
	CollectData.currentData = new CollectData();
	CollectData.currentData.question = arr[0];	
}*/
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
		updateGoesFirst(CurrentGame.gameInit);
		$('#start').fadeOut(1000);
		p1.fadeOut(1000);
		p2.fadeOut(1000);
		$('#vs').fadeOut(1000);
		var countStart = 3;
		var timer = setInterval(function() {
			if(countStart === 0) {
				countStart = null;
				$('#selectedFirst').remove();
				CurrentGame.gameInit.stage = 3;
				var idx = 1;
				CurrentTurn.turnInit = new CurrentTurn(CurrentGame.gameInit.stage, idx, CurrentGame.gameInit.goes_first);
				getCurrentQuestion(CurrentTurn.turnInit);
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
	}, startNum)

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