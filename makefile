# RUN ##################################

run :
	cd webclient && $(MAKE)
	node webapp.js

# CLEAN ################################

clean :
	cd webclient && $(MAKE) clean

# INSTALL ##############################

CONFIG_FILE = .env

install :
	cd webclient && $(MAKE) install
	cd api && $(MAKE) install
	npm install
	echo "SERVER_PORT=8000" > $(CONFIG_FILE)

# ANALYSE ##############################


analyse :
	cd analysis && $(MAKE)
