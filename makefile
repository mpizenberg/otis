# default run web app
run : webapp


# INSTALL ##############################

CONFIG_FILE = .env

install_webapp :
	cd webclient && $(MAKE) install
	cd api && $(MAKE) install
	npm install
	echo "SERVER_PORT=8000" > $(CONFIG_FILE)

install_analysis :
	cd analysis && $(MAKE) install

install : install_analysis install_webapp


# WEB APP ##############################

webapp :
	cd webclient && $(MAKE)
	node webapp.js


# CLEAN ################################

clean :
	cd webclient && $(MAKE) clean


# ANALYSE ##############################

analyse :
	cd analysis && $(MAKE) analyse
