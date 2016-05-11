for i in eng userdebug user; do
	add_lunch_combo cm_kyleveub-${i}
done

function kyleveub 
{
 mk_timer lunch cm_kyleveub-userdebug
 mk_timer mka bacon -j4
}

function patch_fix
{
echo "patching cm-11.0 sources"
time patch -p1 <device/samsung/kyleveub/patch/apps2sd/patch.diff
echo "done"
}

function extract 
{
cd device/samsung/kyleveub
echo "####################"
echo "Connect your device"
echo "####################"
adb  wait-for-device
mk_timer ./extract-files.sh
cd ../../../ 
}

function mk_timer()
{
    local start_time=$(date +"%s")
    $@
    local ret=$?
    local end_time=$(date +"%s")
    local tdiff=$(($end_time-$start_time))
    local hours=$(($tdiff / 3600 ))
    local mins=$((($tdiff % 3600) / 60))
    local secs=$(($tdiff % 60))
    echo
    if [ $ret -eq 0 ] ; then
        echo -n -e "${bldwhi}#### ${bldgrn}make completed successfully${rst} "
    else
        echo -n -e "${bldwhi}#### ${bldred}make failed to build some targets${rst} "
    fi
    if [ $hours -gt 0 ] ; then
        printf "${bldcya}(%02g:%02g:%02g (hh:mm:ss))${rst}" $hours $mins $secs
    elif [ $mins -gt 0 ] ; then
        printf "${bldcya}(%02g:%02g (mm:ss))${rst}" $mins $secs
    elif [ $secs -gt 0 ] ; then
        printf "${bldcya}(%s seconds)${rst}" $secs
    fi
    echo -e " ${bldwhi}####${rst}"
    echo
    if [ -z "$JENK_ENV" ] ; then
        if [ $ret -eq 0 ] ; then
            for i in "$@"; do
                case $i in
                    bacon|bootimage|otapackage|recoveryimage|systemimage|./extract-files.sh|lunch)
                        ;;
                    *)
                esac
            done
        fi
    fi
    return $ret
}

function clean
{
cd device/samsung/kyleveub
find=`find . -type f -name "*.*~"`
rm $find
cd ../../../
}

function apps2sd
{
rsync -r device/samsung/kyleveub/patch/apps2sd/App2SD/* App2SD
cp device/samsung/kyleveub/patch/apps2sd/App2SD.sh ../App2SD.sh
./../App2SD.sh
rm ../App2SD.sh
rm -rf App2SD
}
