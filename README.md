# Module

##  This project module is an easy way to take your VPS or live-USB to use.
These are the to commands you need to run the script which installs the states.



	wget https://raw.githubusercontent.com/Vipa94/Module/master/test.sh
	bash test.sh

The script installs git and salt minion, and clones this directory.
This state installs Apache2 and enables users homepages, installs ssh and removes comment lines from sshd_config.
It also installs sysstat and enables it, and installs multitail.

Finally, this state creates public_html directory with index.html file in it into /etc/skel for future users.
