import configparser

def get_config(file):
    config = configparser.ConfigParser()
    config.read(file)
    return config