### AnyKernel3 Ramdisk Mod Script
## Madara273 minimal installer for OnePlus 15.

properties() { '
kernel.string=Nezuko
kernel.compiler=Clang 20.0.0
kernel.made=Madara273
message.word=Madara273 Kernel for OP15
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
do.check_boot_version=0
supported.versions=15 - 16
keycheck.timeout=10
'; }

### AnyKernel install
## boot shell variables
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
no_magisk_check=1

# Load AnyKernel3 core functions
. tools/ak3-core.sh

# Split the current boot image
split_boot

# Repack boot if ramdisk exists, otherwise flash kernel directly
[ -f "$SPLITIMG/ramdisk.cpio" ] && { unpack_ramdisk; write_boot; } || flash_boot
