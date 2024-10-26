import argparse
import sys
from rps import rps
from guess_number import guessNumber

def arcade(name="PlayerOne"):
    
    playerChoice = input("Welcome to the FigArcade!\n\nChoose one of these games!\n1. Rock-Paper-Scissors\n2. Guess My Number\nX to quit!\nR:")
    if playerChoice not in ["1","2","x","X"]:
            print(f'\nHey {name}, please enter 1, 2 or x.')
            arcade(name)
    if playerChoice.upper() == "X":
          sys.exit(f"\nThanks for playing, {name}!")
    elif playerChoice == "1":
          rock_paper_scissors = rps(name)
          rock_paper_scissors()
          arcade(name)
    elif playerChoice == "2":
          guessNumberGame= guessNumber(name)
          guessNumberGame()
          arcade(name)
parser = argparse.ArgumentParser(
    description="Provides a personalized game experience."
)

parser.add_argument(
    "-n",
    "--name",
    metavar='name',
    required=True,
    help="The name of the person playing.")

args = parser.parse_args()

arcade(args.name)
