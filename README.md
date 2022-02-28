###install inception:###
	sudo apt install libnss3-tools -y
	make build && sudo make host && sudo make volumes

###run inception:###
	make run

###stop inception:###
	make stop

###clean inception:###
	make clean && sudo make cleanhost && sudo make cleanvolumes


###WARNING:###
	mkcert does not work with sudo privileges, so do not try "sudo make build" or "sudo make run"

###PS:###
	- "make run" calls "make build" and "make clean" calls "make stop"
	- "make host" adds "127.0.0.1 mlefevre.42.fr" in /etc/hosts
and "make cleanhost" removes that line from the file.
	- "sudo make volume" creates the directories for
volumes "sudo make cleanvolumes" deletes those directories
WARNING: all data will be lost and you will have to call "sudo make volumes" again
