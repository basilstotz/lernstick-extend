
PATCH:="./patch"


script:
	@find patch/basis/debs.d/ -type f  -exec rm \{\} \;
	@cp ~/git/ltsp-org-updater/ltsp-org-updater_*_amd64.deb patch/basis/debs.d/.
	@cp ~/git/lernstick-ltsp/lernstick-ltsp_*_amd64.deb patch/basis/debs.d/.
	@./bin/make-chroot-script $(PATCH) > install-patch-script.sh
	@chmod +x install-patch-script.sh
