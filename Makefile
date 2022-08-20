
SOURCE:=/home/user/iso-lernstick/lernstick_debian11_latest.iso
PATCH:="patch"

all: copy patch

copy:
	@find patch/basis/debs.d/ -type f  -exec rm \{\} \;
	@cp ~/git/ltsp-org-updater/ltsp-org-updater_*_amd64.deb patch/basis/debs.d/.
	@cp ~/git/lernstick-ltsp/lernstick-ltsp_*_amd64.deb patch/basis/debs.d/.
script:
	@./bin/make-chroot-script $(PATCH) > install-patch-script.sh
	@chmod +x install-patch-script.sh

patch: patched-filesystem.squashfs
	@mv patched-filesystem.squashfs iso-extract/live/filesystem.squashfs
	@sudo chmod -R -w iso-extract/live/
	@sudo remaster-compose

patched-filesystem.squashfs : filesystem.squashfs 
	@sudo /home/user/bin/squashfs-extend $(PATCH) filesystem.squashfs


filesystem.squashfs: iso-extract/live/filesystem.packages
	@sudo remaster-extract -i $(SOURCE) 
	@sudo chmod -R +w iso-extract/live/
	@sudo mv iso-extract/live/filesystem.squashfs filesystem.squashfs


