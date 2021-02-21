from crow.utils import updatesettings
import sys

if __name__ == "__main__":
    print("Updating system settings based on the provided cli args")
    updatesettings(sys.argv)

