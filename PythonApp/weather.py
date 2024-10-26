import requests
from pprint import pprint
from dotenv import load_dotenv
import os

load_dotenv()

def get_current_weather():
    print('\nGet Current Weather\n')
    city = input("\nPlease enter a city:\nR: ")
    request_url = f"https://api.openweathermap.org/data/2.5/weather?appid={os.getenv('API_KEY')}&q={city}&units=metric"

    weather_data = requests.get(request_url).json()
    return weather_data

if __name__== "__main__":
    get_current_weather()