
#checking for active project
	if [ ! -d "$ANDROID_PRODUCT_OUT" ] || [ ! -d "$ANDROID_BUILD_TOP" ]
	  then
	       >&2 echo "     can't find Android environments"
	       >&2 echo "     please flash after sourcing the toolchanin and lunching the desired chipset"
	       exit 1
	fi

#using adb from project if available 
	if [ -f $ANDROID_BUILD_TOP/out/host/linux-x86/bin/adb ]
	    then 
		adb_tool=$ANDROID_BUILD_TOP/out/host/linux-x86/bin/adb
	else 
            >&2 echo "adb tool is not found in the project, the default one will be used instead"
	    adb_tool=adb    
	fi

#using fastboot from project if available
	if [ -f $ANDROID_BUILD_TOP/out/host/linux-x86/bin/fastboot ]
	    then
 		fastboot_tool=$ANDROID_BUILD_TOP/out/host/linux-x86/bin/fastboot
	else
	    >&2 echo "fastboot tool is not found in the project, the default one will be used instead"
	    fastboot_tool=fastboot
	fi

#going to fastboot mode 
	if [ "$(sudo $adb_tool get-state)" == "device" ]
	   then  
		 sudo $adb_tool root && sudo adb wait-for-devices && sudo adb remount
		 sudo $adb_tool reboot bootloader
	elif [ "$(sudo fastboot devices)" == "" ]
	   then 
		>&2 echo "no fastboot devices or adb_tool devices found"
		exit 1;
	fi

#flashing android 
	echo Flashing from $ANDROID_PRODUCT_OUT

	echo 
	echo flashing boot.img
	sudo $fastboot_tool flash boot $ANDROID_PRODUCT_OUT/boot.img

	echo
	echo flashing persist
	sudo $fastboot_tool flash persist $ANDROID_PRODUCT_OUT/persist.img

	echo
	echo flashing emmc_appsboot.mbn
	sudo $fastboot_tool flash aboot $ANDROID_PRODUCT_OUT/emmc_appsboot.mbn

	echo
	echo flashing system.img
	sudo $fastboot_tool flash system $ANDROID_PRODUCT_OUT/system.img

	echo 
	echo flashing cache.img
	sudo $fastboot_tool flash cache $ANDROID_PRODUCT_OUT/cache.img

	echo
	echo flashing recovery.img
	sudo $fastboot_tool flash recovery $ANDROID_PRODUCT_OUT/recovery.img

	echo
	echo flashing userdata.img
	sudo $fastboot_tool flash userdata $ANDROID_PRODUCT_OUT/userdata.img

	echo
	sudo $fastboot_tool reboot 

#flashing images
	function flash_image(){
            fastboot_tool=$1
            andr_image=$2
             echo
             echo flashing $andr_image
	     sudo $fastboot_tool flash boot $andr_image
        }

