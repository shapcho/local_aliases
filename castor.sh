curr_p_fastboot_tool=""
curr_p_root_folder="/home/users/kdyakov/sources/omap4/Zebra_Castor"
curr_p_adb_tool="/home/users/kdyakov/.ktools/adb"
curr_p_java_path="/usr/lib/jvm/java-6-oracle/bin/java"
curr_p_javac_path="/usr/lib/jvm/java-6-oracle/bin/javac"
curr_p_set_env=""
curr_p_lunch_cmd=""
curr_p_build_specific="Yes"
curr_p_flashimgs_folder="/home/users/kdyakov/sources/omap4/Zebra_Castor/ducati/WTSD_DucatiMMSW/platform/base_image/out/app_m3/release"
curr_p_flash_specific="Yes"
curr_p_jpeg_folder="/home/users/kdyakov/sources/omap4/Zebra_Castor/images"

if [ $1 == fastboot_tool ]; then
	echo $curr_p_fastboot_tool
elif [ $1 == root_folder ]; then
	echo $curr_p_root_folder
elif [ $1 == adb_tool ]; then
	echo $curr_p_adb_tool
elif [ $1 == java_path ]; then
	echo $curr_p_java_path
elif [ $1 == javac_path ]; then
	echo $curr_p_javac_path
elif [ $1 == set_env ]; then
	echo $curr_p_set_env
elif [ $1 == lunch_cmd ]; then
	echo $curr_p_lunch_cmd
elif [ $1 == build_specific ]; then
	echo $curr_p_build_specific
elif [ $1 == build_project_specific ]; then
	curr_dir=`pwd`;
    cd "/home/users/kdyakov/sources/omap4/leica/ducati/WTSD_DucatiMMSW/platform/base_image";
	if ! [ "$(ls -A )" ]; then
	   sudo sshfs -o allow_other kdyakov@172.20.0.8://opt/linux_tools_for_1.22_P7/ /opt/linux_tools_for_1.22_P7/
	fi
    ./build_LeicaAc.sh

    cd $curr_dir
elif [ $1 == flashimgs_folder ]; then
	echo $curr_p_flashimgs_folder
elif [ $1 == flash_specific ]; then
	echo $curr_p_flash_specific
elif [ $1 == fb_project_specific ]; then
	 rsync -auv "$curr_p_flashimgs_folder/base_image_app_m3_striped.xem3" "/media/kdyakov/3436-6636/base_image_app_m3.xem3" 
         sync
elif [ $1 == jpeg_folder ]; then
	echo $curr_p_jpeg_folder
else
	echo "unrecognized command"
fi
