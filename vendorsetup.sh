for i in eng userdebug user; do
    add_lunch_combo cm_kyleveub-${i}

function patch_fix
{
echo "patching cm-12.1 sources"
time patch -p1 <device/samsung/kyleveub/PATCH_CM-12.1.diff
echo "done"
}

done
