import configparser
import os


BASE_DIR = os.path.dirname(__file__)

config = configparser.ConfigParser(
    interpolation=configparser.ExtendedInterpolation())
config.read(f"{BASE_DIR}/config.ini")


private = configparser.ConfigParser(
    interpolation=configparser.ExtendedInterpolation())
private.read(f"{BASE_DIR}/private.ini")

