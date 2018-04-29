README.md:
	touch README.md
	@echo "# Guessing Game" >> README.md
	@echo "### The date and time at which make was run." >> README.md
	date >> README.md
	@echo "### The number of lines of code contained in guessinggame.sh." >> README.md
	egrep "^[^#]" guessinggame.sh | wc -l >> README.md


clean:
	rm README.md
