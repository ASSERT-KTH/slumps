import sys

import os
from settings import config


def printProgressBar(iteration, total, prefix='', suffix='', decimals=1, length=40, fill='█'):
    """
    Call in a loop to create terminal progress bar
    @params:
        iteration   - Required  : current iteration (Int)
        total       - Required  : total iterations (Int)
        prefix      - Optional  : prefix string (Str)
        suffix      - Optional  : suffix string (Str)
        decimals    - Optional  : positive number of decimals in percent complete (Int)
        length      - Optional  : character length of bar (Int)
        fill        - Optional  : bar fill character (Str)
    """
    percent = ("{0:." + str(decimals) + "f}").format(100 *
                                                     (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print('%s |%s| %s%% %s' % (prefix, bar, percent, suffix))
    

class ANSISCreen(object):

	def __init__(self):
		self.MARGIN_BOTTOM = 2
		self.MAX_LOGS = 5
		self.overallTotal = 1
		self.total_progress = 0
		self.log = []

	def init_screen(self, number_of_processes, overallTotal, log=""):
		self.progresses = [dict(
			step=0,
			total=0,
			suffix = '',
			prefix = ''
		) for _ in range(number_of_processes)]
		#self.log = []
		self.clear_screen()
		self.draw_screen()
		self.overallTotal = overallTotal
		self.total_progress = 0



	def draw_screen(self):
		self.clear_screen()
		width, height =  os.get_terminal_size()

		sys.stdout.write(u"\u001b[10000D\u001b[32;1m") # Move left
		sys.stdout.write(u"\u001b[" + str(height) + "A") # Move up
		s = int((width-len(" CROW "))/2)
		print("="*s + " CROW " + "="*s + "\u001b[0m\n")

		if self.overallTotal > 1:
			printProgressBar(min(self.total_progress , self.overallTotal), self.overallTotal, length=int(width/4), suffix=f"{self.total_progress}/{self.overallTotal}")
			print("\n" + "="*width + "\n")

		for index,i in enumerate(self.progresses):
			
			if not i["total"]:
				print(i["suffix"])
			else:
				printProgressBar(i["step"], i["total"], suffix=i["suffix"])


		#sys.stdout.write(u"\u001b[" + str(2) + "D") # Move up
		print()
		print()

		for l in self.log:
			print(l)

	def place_log(self, log):

		if len(self.log) > self.MAX_LOGS:
			self.log = self.log[1:]
		self.log.append(log)

		self.draw_screen()

	def update_overall(self, overall):
		self.total_progress += overall
		self.draw_screen()

	def update_process(self, index, step = None, total = None,  suffix = None, prefix = None):
		
		if step:
			self.progresses[index]["step"] = step
		if suffix:
			self.progresses[index]["suffix"] = suffix
		if prefix:
			self.progresses[index]["prefix"] = prefix
		if total:
			self.progresses[index]["total"] = total

		self.draw_screen()

	def clear_screen(self):
		width, height =  os.get_terminal_size()

		sys.stdout.write(u"\u001b[1000D") # Move left
		sys.stdout.write(u"\u001b[" + str(height) + "A") # Move up

		for i in range(height):
			print(" "*width)
	

SCREEN = None

if config["DEFAULT"].getboolean("use-ansi-console"):
	SCREEN = ANSISCreen()
	SCREEN.init_screen(0, 1)

