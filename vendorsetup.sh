for i in eng userdebug user; do
	add_lunch_combo carbon_kyleveub-${i}
done
function kyleveub
{
	lunch carbon_kyleveub-userdebug
	mka bacon -j10
}
