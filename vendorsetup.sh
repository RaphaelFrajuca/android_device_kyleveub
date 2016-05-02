for i in eng userdebug user; do
	add_lunch_combo cm_kyleveub-${i}
done
function kyleveub
{
	lunch cm_kyleveub-userdebug
	mka bacon -j10
}
