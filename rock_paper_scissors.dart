import 'dart:io';

///The List of Player choice for the game
List<String> playerChoices = ['rock', 'paper', 'scissors'];

//Check the player input if it's valid or not
String? checkInput(String? input) {
  if (input == null || !playerChoices.contains(input.toLowerCase())) {
    return null;
  }
  return input.toLowerCase();
}

///This function Keep asking the player choice input until the input is valid
String userChoice(String playerName){
  String? input;
  do {
    stdout.write("$playerName ,enter your choice (rock, paper, scissors): ");
    String? player1Inputted = stdin.readLineSync();
    input = checkInput(player1Inputted);

    if (input == null) {
      print('Invalid input. Please try again.');
    }
  } while (input == null);
  return input;
}

///Compare the two moves from the plyer 1 and player 2 and then decides who'sthe winner
String? finalWinner(String  player1, String player2){
  if (player1 == player2){
    return null;
  } else if (player1 == 'rock' && player2 == 'scissors') {
    return 'player1';
  }else if (player1 == 'paper' && player2 == 'rock'){
    return 'player1';
  }else if (player1 == 'scissors' && player2 == 'paper'){
    return 'player1';
  }else{
    return 'player2';
  }
}

//This is the main function where the game will run and ask for players move.
void main(){
  print('WELCOME TO THE RPS GAME');
  print('====Rock, Paper, Scissorss====');

  stdout.write('Player 1 enter your name: ');
  String? player1Inputted = stdin.readLineSync();
  String playerName = player1Inputted ?? '';

  playerName = playerName.trim();
  if (playerName == ''){
    playerName = 'Player 1';
  }

  stdout.write('Player 2 enter your name: ');
  String? player2Inputted = stdin.readLineSync();
  String player2Name = player2Inputted ?? '';
  player2Name = player2Name.trim();
  if (player2Name == ''){
    player2Name = 'Player 2';
  }

  int player1Scores = 0;
  int player2Scores = 0;
  String playerAgain;

do{
  String player1Choice = userChoice(playerName);

  /// Tis hides the Player 1 move before the Player 2 choose their move
  int i = 0;
  while (i < 30){
    print('');
    i = i + 1;
  }

  String player2Choice = userChoice(player2Name);

  String ? gameWinner = finalWinner(player1Choice, player2Choice);
  String ? winnerGreeting;

  if (gameWinner == 'player1'){
    player1Scores++;
    winnerGreeting = 'Congratulations $playerName, you won the game!';
  } else if (gameWinner == 'player2'){
    player2Scores++;
    winnerGreeting = 'Congratulations $player2Name, you won the game!';
  } else {
    winnerGreeting = 'The game result is It\'s a tie!';
  }

  print('$playerName chose is: $player1Choice');
  print('$player2Name chose is: $player2Choice');
  print(winnerGreeting);

  stdout.write('Do you want to play again? (yes/no): ');
  String? playersecondRound = stdin.readLineSync();
  playerAgain = playersecondRound ?? 'n';
  playerAgain = playerAgain.trim().toLowerCase();
}while (playerAgain == 'yes' || playerAgain == 'y');

///This print all the scores of the players after the rounds they played
print('====FINAL SCORES OF ALL THE ROUNDS====');
print('$playerName: $player1Scores');
print('$player2Name: $player2Scores');

if (player1Scores > player2Scores){
  print('Congratulations $playerName, you won the gameeeee!');  
}else if (player2Scores > player1Scores){
  print('Congratulations $player2Name, you won the gameeeee!');
}else{
  print('The game result is :  It\'s a tie!');
}
}