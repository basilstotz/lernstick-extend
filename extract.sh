xorriso -as mkisofs -r -D -V "${_ISOTargetTitle} ${_VER}" \
-cache-inodes -J -l -iso-level 3 -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
-c isolinux/boot.cat -b isolinux/isolinux.bin  -no-emul-boot -boot-load-size 4 \
-boot-info-table -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot \
-isohybrid-gpt-basdat -o "${_BASEDIR}/${_BUILDDATE}-${_ISOTargetName}.iso" .
