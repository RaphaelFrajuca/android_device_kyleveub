android_device_kyleveub
======================

Device tree for Galaxy Trend Lite GT-S7392L (2 SIM)

<b>HOW TO COMPILE ?</b>

<b>TYPE THIS COMMANDS :- </b>

`cd cm-10.0`

`mkdir .repo/local_manifests`

`gedit .repo/local_manifests/kyleveub.xml `

<b>PASTE THIS INSIDE THAT FILE :- </b>


```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<project path="device/samsung/kyleveub" name="RaphaelFrajuca/android_device_kyleve" revision="cm-10.0" />
<project path="kernel/samsung/kyleveub" name="SiniTurk/android_kernel_samsung_kylevexx" revision="stock" />
<project path="vendor/samsung/kyleveub" name="SiniTurk/android_vendor_samsung_kyleve" revision="cm-10.0" />
</manifest>
```

`. build/envsetup.sh `

`patch_fix`

`kyleveub `

<b>FLASH THE ROM AND ENJOY!</b>
