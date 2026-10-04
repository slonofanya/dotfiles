# ansible

Installs Docker CE on the `test` host (defaults to localhost over ssh). Ubuntu only.

- Files: `playbook.yml`, `hosts` (`test ansible_host=localhost`), `ansible.cfg` (inventory path `~/install/dotfiles/modules/ansible/hosts`)
- Heads-up: the apt repo line is hard-coded to `bionic`; change it to your release (`$(lsb_release -cs)`) before running on newer Ubuntu.

## Setup
```bash
pip install ansible
ssh-copy-id -i ~/.ssh/id_rsa.pub $USER@localhost      # passwordless ssh to localhost
echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USER   # passwordless sudo
cd ~/install/dotfiles/modules/ansible
ansible-playbook -i hosts playbook.yml
```

## Verify
`docker --version`
