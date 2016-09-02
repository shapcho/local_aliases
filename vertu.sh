curr_p_root_folder="/home/users/kdyakov/sources/vertu-titan/LINUX/android"
curr_p_fastboot_tool="$curr_p_root_folder/out/host/linux-x86/obj32/EXECUTABLES/fastboot_intermediates/fastboot -i 0x27f1"
curr_p_adb_tool="$curr_p_root_folder/out/host/linux-x86/obj32/EXECUTABLES/adb_intermediates/adb"
curr_p_java_path="/usr/lib/jvm/jdk1.7.0_51/jre"
curr_p_javac_path="/usr/lib/jvm/jdk1.7.0_51"
curr_p_set_env="build/envsetup.sh"
curr_p_lunch_cmd="choosecombo 1 v06 userdebug row"
curr_p_build_specific="No"
curr_p_flashimgs_folder="/home/users/kdyakov/sources/vertu-titan/LINUX/android/out/target/product/v06"
curr_p_flash_specific="No"
curr_p_jpeg_folder="/home/users/kdyakov/sources/vertu-titan/images"

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
        echo "No Build Project Specific"
elif [ $1 == flashimgs_folder ]; then
	echo $curr_p_flashimgs_folder
elif [ $1 == flash_specific ]; then
	echo $curr_p_flash_specific
elif [ $1 == fb_project_specific ]; then
	$curr_p_fastboot_tool oem unlock moto_rogue
elif [ $1 == jpeg_folder ]; then
	echo $curr_p_jpeg_folder
else
	echo "unrecognized command"
fi
