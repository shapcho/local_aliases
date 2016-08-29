curr_p_fastboot_tool="sudo fastboot -i 0x05e0"
curr_p_root_folder="/home/users/kdyakov/sources/MSI/LINUX/android/"
curr_p_adb_tool="/home/users/kdyakov/.ktools/adb"
curr_p_java_path="/usr/lib/jvm/java-6-oracle/bin/java"
curr_p_javac_path="/usr/lib/jvm/java-6-oracle/bin/javac"
curr_p_set_env="build/envsetup.sh"
curr_p_lunch_cmd="lunch TC8000-eng"
curr_p_build_specific="Yes"
curr_p_flashimgs_folder="/home/users/kdyakov/sources/MSI/out/TC8000_eng_ev1"
#curr_p_flashimgs_folder="/home/users/kdyakov/sources/MSI/out/TC8000_eng_"
curr_p_flash_specific="Yes"
curr_p_jpeg_folder="/home/users/kdyakov/sources/MSI/images"

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
    cd "/home/users/kdyakov/sources/MSI";
    ./build_for_dev.sh
    cd $curr_dir
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
