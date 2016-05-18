android_device_kyleve
======================

Device tree for Galaxy Trend Duos GT-S7392 (2 SIM)

<b>HOW TO COMPILE ?</b>

<b>TYPE THIS COMMANDS :- </b>

`cd cm-10.0`

`mkdir .repo/local_manifests`

`gedit .repo/local_manifests/kyleve.xml `

<b>PASTE THIS INSIDE THAT FILE :- </b>


```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<project path="device/samsung/kyleve" name="SiniTurk/android_device_kyleve" revision="cm-10.0" />
<project path="kernel/samsung/kyleve" name="SiniTurk/android_kernel_samsung_kylevexx" revision="stock" />
<project path="vendor/samsung/kyleve" name="SiniTurk/android_vendor_samsung_kyleve" revision="cm-10.0" />
</manifest>
```

`. build/envsetup.sh `

`patch_fix`

`kyleve `

<b>FLASH THE ROM AND ENJOY!</b>
