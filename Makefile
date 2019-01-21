.PHONY: install
install: all

all:
	@ansible-playbook playbooks/inventory_gen.yml
	@ansible-playbook playbooks/deploy.yml
	@echo "Done!"