$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/kyleveub/kyleveub-common-vendor.mk)

# Use high-density artwork where available
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

DEVICE_PACKAGE_OVERLAYS += device/samsung/kyleveub/overlay

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/kyleveub/ramdisk/fstab.hawaii_ss_kyleve:root/fstab.hawaii_ss_kyleve \
	device/samsung/kyleveub/ramdisk/init.rc:root/init.rc \
	device/samsung/kyleveub/ramdisk/init.hawaii_ss_kyleve.rc:root/init.hawaii_ss_kyleve.rc \
	device/samsung/kyleveub/ramdisk/init.bcm2166x.usb.rc:root/init.bcm2166x.usb.rc \
	device/samsung/kyleveub/ramdisk/init.log.rc:root/init.log.rc \
	device/samsung/kyleveub/ramdisk/lpm.rc:root/lpm.rc \
	device/samsung/kyleveub/ramdisk/charger:root/charger \
	device/samsung/kyleveub/ramdisk/ueventd.hawaii_ss_kyleve.rc:root/ueventd.hawaii_ss_kyleve.rc
	
PRODUCT_COPY_FILES += \
	device/samsung/kyleveub/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/kyleveub/configs/audio_policy.conf:system/etc/audio_policy.conf \
	device/samsung/kyleveub/configs/media_codecs.xml:system/etc/media_codecs.xml 

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/kyleveub/keylayouts/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	device/samsung/kyleveub/keylayouts/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
	device/samsung/kyleveub/keylayouts/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/samsung/kyleveub/keylayouts/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl

# Insecure ADBD
# (ro.adb.secure=3)
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	persist.service.adb.enable=1

# KSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ksm.default=0	

# Filesystem management tools
PRODUCT_PACKAGES += \
	setup_fs \
	e2fsck \
	f2fstat \
	fsck.f2fs \
	fibmap.f2fs \
	mkfs.f2fs
		
# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory
	
# Use 3 threads for Dex2Oat.
PRODUCT_PROPERTY_OVERRIDES += \
        ro.sys.fw.dex2oat_thread_count=3

# ART
PRODUCT_PROPERTY_OVERRIDES += \
        dalvik.vm.dex2oat-flags=--no-watch-dog	

# Misc other modules
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler \
	audio_policy.hawaii \
	audio.primary.default

# Device-specific packages
PRODUCT_PACKAGES += \
	FmRadio \
	SamsungServiceMode 
#	Torch

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
	
# Support for Browser's saved page feature. This allows
# for pages saved on previous versions of the OS to be
# viewed on the current OS.
PRODUCT_PACKAGES += \
    libskia_legacy

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    mobiledata.interfaces=rmnet0 \
    ro.telephony.ril_class=SamsungBCMRIL \
    ro.zygote.disable_gl_preload=true \
    persist.radio.multisim.config=dsds \
#	cm.updater.uri=http://updates.cm-ota.pp.ua \
	ro.telephony.call_ring.multiple=0 \
	ro.telephony.call_ring=0
    
# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp
	
# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

ifeq ($(TARGET_BUILD_VARIANT),user)      
else      
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_kyleveub
PRODUCT_DEVICE := kyleveub
PRODUCT_MODEL := GT-S7392L
PRODUCT_MANUFACTURER := Samsung
