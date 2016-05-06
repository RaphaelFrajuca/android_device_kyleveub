android_device_kyleveub
======================

Device tree for Galaxy Trend Lite Duos GT-S7392L (2 SIM)

<b>HOW TO COMPILE ?</b>

<b>TYPE THIS COMMANDS :- </b>

`cd <your-cm12.1>`

`mkdir .repo/local_manifests`

`gedit .repo/local_manifests/kyleveub.xml `

<b>PASTE THIS INSIDE THAT FILE :- </b>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<project path="kernel/samsung/kyleveub" name="RaphaelFrajuca/android_kernel_kyleveub" revision="stock" />
<project path="hardware/samsung" name="CyanogenMod/android_hardware_samsung" remote="github" revision="cm-12.1"/>
<project path="device/samsung/kyleveub" name="RaphaelFrajuca/android_device_kyleveub" remote="github" revision="cm-12.1" />
<project path="vendor/samsung/kyleveub" name="RaphaelFrajuca/android_vendor_kyleveub" revision="carbon-kk" />
</manifest>
``` 

Then 

`repo sync -f --force-sync`

`. build/envsetup.sh`

`patch_fix`  // TO MAKE ROM STABLE


`kyleve`
