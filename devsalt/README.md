See https://docs.saltstack.com/en/latest/topics/tutorials/walkthrough.html

Use salt to setup new dev machine.

0. Add saltstack package repository (see link above)
1. Install salt-minion on new machine (... && apt-get install -y salt-minion)
2. Configure the minion to serve its master (/etc/salt/minion)
3. Accept key for minion on the master (salt-key -A ...)
4. On the master, run:

    sudo mkdir -p /srv/salt
    sudo cp dev.sls /srv/salt/
    sudo salt '<new-machine-name>' state.apply dev

Once that's done you should reboot; it installs docker-ce and a new kernel.
