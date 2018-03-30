wget:
  pkg.installed

curl:
  pkg.installed

install-oblong-repo:
  cmd.script:
  - name: install-oblong-repo
  - source: http://buildhost4.oblong.com/oblong-repo/install-oblong-repo

linux-generic-hwe-16.04:
  pkg.installed

bats:
  pkg.installed

links:
  pkg.installed

emacs:
  pkg.installed

git:
  pkg.installed

oblong-vagrant:
  pkg.installed

docker-ce:
  pkg.installed

docker-compose:
  pkg.installed

wasosa:
  user.present:
    - groups:
      - docker
      - sudo
