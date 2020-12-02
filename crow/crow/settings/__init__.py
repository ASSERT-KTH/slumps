import configparser
import os


BASE_DIR = os.path.dirname(__file__)

config = configparser.ConfigParser(
        interpolation=configparser.ExtendedInterpolation())
config.read(f"{BASE_DIR}/config.ini")



def reload():
    config = configparser.ConfigParser(
        interpolation=configparser.ExtendedInterpolation())
    config.read(f"{BASE_DIR}/config.ini")

    return config

