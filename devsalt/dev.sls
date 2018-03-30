curl:
  pkg.installed

wget:
  pkg.installed

install-oblong-repo:
  cmd.script:
  - name: install-oblong-repo
  - source: http://buildhost4.oblong.com/oblong-repo/install-oblong-repo

bats:
  pkg.installed

docker-ce:
  pkg.installed

docker-compose:
  pkg.installed

emacs:
  pkg.installed

git:
  pkg.installed

golang-go:
  pkg.installed

htop:
  pkg.installed

jq:
  pkg.installed

links:
  pkg.installed

linux-generic-hwe-16.04:
  pkg.installed

oblong-vagrant:
  pkg.installed

shellcheck:
  pkg.installed

sysdig:
  pkg.installed

vnc4server:
  pkg.installed

wasosa:
  user.present:
    - groups:
      - docker
      - sudo
