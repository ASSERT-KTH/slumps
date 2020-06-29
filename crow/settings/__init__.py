import configparser

config = configparser.ConfigParser(
    interpolation=configparser.ExtendedInterpolation())
config.read(f"./config.ini")

private = configparser.ConfigParser(
    interpolation=configparser.ExtendedInterpolation())
private.read(f"./private.ini")
