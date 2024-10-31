import random

def guessNumber(name='PlayerOne'):
    game_count = 0
    player_wins= 0
    python_wins= 0
    winRate = 0

    def play_guessNumber():
        nonlocal name
        nonlocal player_wins
        nonlocal python_wins
        nonlocal winRate

        playerChoice = input(f"\n\n{name}, try to guess my number: 1, 2 or 3!\nR:")

        if playerChoice not in ["1","2","3"]:
            print(f'\nHey {name}, please enter 1, 2 or 3.')
            play_guessNumber()
        
        player = int(playerChoice)

        computerChoice = random.choice("123")
        computer = int(computerChoice)

        print(f"\n{name}, you chose {player} and Python chose {computer}")
        

        def decide_winner(player,computer):
            nonlocal name
            nonlocal player_wins
            nonlocal python_wins
            if player == computer:
                player_wins += 1
                return(f"\n{name}, you win!")
            else:
                python_wins += 1
                return(f"\nPython wins! Sorry, {name}...")
        
        game_result = decide_winner(player,computer)

        print(game_result)

        nonlocal game_count                  
        game_count += 1
        winRate = (player_wins / (player_wins + python_wins)) * 100
        print(f"\nGame count: {game_count} || {name} wins: {player_wins} vs Python wins: {python_wins}")
        print(f"\nWinning Rate: {winRate:.4f}% !")

        while True:
            playAgain = input(f"\nPlay Again, {name}?\nY for Yes\nQ to Quit\n\nR:")
            if playAgain.lower() not in ["y","q"]:
                continue
            else:
                break

        if playAgain == "Y" or playAgain == "y":
            return play_guessNumber()
        else:
            print(f"\nCongrats {name}!\n\nThanks for playing!")
            playAgain = False
            print(f"Bye {name}!\n")
            return
    return play_guessNumber


guessNumberGame = guessNumber()
if __name__ == "__main__":
    guessNumberGame()