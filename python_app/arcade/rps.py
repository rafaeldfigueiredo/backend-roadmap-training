import random
import sys
from enum import Enum


def rps(name='PlayerOne'):
    game_count = 0
    player_wins= 0
    python_wins= 0

    def play_RPS():
        nonlocal name
        nonlocal player_wins
        nonlocal python_wins
        class RPS(Enum):
            ROCK = 1
            PAPER = 2
            SCISSORS = 3

        playerChoice = input(f"\n\n{name}, please enter...\n1 for Rock,\n2 For Paper,\n3 For Rock\nR:")

        if playerChoice not in ["1","2","3"]:
            print(f'{name}, please enter 1, 2 or 3.')
            play_RPS()
        
        player = int(playerChoice)     

        computerChoice = random.choice("123")
        computer = int(computerChoice)

        print(f"\n{name}, you chose {str(RPS(player)).replace('RPS.','')} and Python chose {str(RPS(computer)).replace('RPS.','')}")
        

        def decide_winner(player,computer):
            nonlocal name
            nonlocal player_wins
            nonlocal python_wins
            if player == 1 and computer == 3:
                player_wins += 1
                return(f"{name}, you win!")
            elif player == 2 and computer == 1:
                player_wins += 1
                return(f"{name}, you win!")
            elif player == 3 and computer == 1:
                player_wins += 1
                return(f"{name}, you win!")
            elif player == computer:
                return("Tie!")
            else:
                python_wins += 1
                return(f"Python wins! Sorry, {name}...")
        
        game_result = decide_winner(player,computer)

        print(game_result)

        nonlocal game_count                  
        game_count += 1

        print(f"\nGame count: {game_count} || {name} wins: {player_wins} vs Python wins: {python_wins}")

        while True:
            playAgain = input(f"\nPlay Again, {name}?\nY for Yes\nQ to Quit\n\nR:")
            if playAgain.lower() not in ["y","q"]:
                continue
            else:
                break

        if playAgain == "Y" or playAgain == "y":
            return play_RPS()
        else:
            print(f"\nCongrats {name}!\n\nThanks for playing!")
            playAgain = False
            print(f"Bye {name}!\n")
            return
    return play_RPS


rock_paper_scissors = rps()
if __name__ == "__main__":
    rock_paper_scissors()