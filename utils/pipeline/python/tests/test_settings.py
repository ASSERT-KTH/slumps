import utils
import configparser


def test_settings():

    print(utils.config.defaults(), utils.config["souper"]["path"])
    print(utils.config["souper"]["souper"])
    print(utils.config["souper"]["check"])

