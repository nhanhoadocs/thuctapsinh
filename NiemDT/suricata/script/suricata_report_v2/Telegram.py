import requests

def send(token, chat_id, text):
    requests.get(
        "https://api.telegram.org/bot{}/sendMessage?chat_id={}&text={}&parse_mode=Markdown"
        .format(token, chat_id, text))