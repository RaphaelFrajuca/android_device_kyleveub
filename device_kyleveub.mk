$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/samsung/kyleveub/kyleveub-common-vendor.mk)

PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

DEVICE_PACKAGE_OVERLAYS += device/samsung/kyleveub/overlay

# Init files
PRODUCT_COPY_FILES += \
    device/samsung/kyleveub/rootdir/fstab.hawaii_ss_kyleve:root/fstab.hawaii_ss_kyleve \
    system/core/rootdir/init.rc:root/init.rc \
    device/samsung/kyleveub/rootdir/init.hawaii_ss_kyleve.rc:root/init.hawaii_ss_kyleve.rc \
    device/samsung/kyleveub/rootdir/init.bcm2166x.usb.rc:root/init.bcm2166x.usb.rc \
    device/samsung/kyleveub/rootdir/init.log.rc:root/init.log.rc \
    device/samsung/kyleveub/rootdir/ueventd.hawaii_ss_kyleve.rc:root/ueventd.hawaii_ss_kyleve.rc

# Google's Software Decoder.
PRODUCT_COPY_FILES += \
	device/samsung/kyleveub/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/kyleveub/configs/audio_policy.conf:system/etc/audio_policy.conf \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
 	device/samsung/kyleveub/configs/media_codecs.xml:system/etc/media_codecs.xml 

# Insecure ADB
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# USB accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Misc other modules
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.default \
    libaudio-resampler \
    lights.hawaii \
    power.hawaii \
    libstagefrighthw

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# KSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ksm.default=1

# Disable sending usage data
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.nocheckin=1

# Wi-Fi
PRODUCT_PACKAGES += \
    macloader \
    dhcpcd.conf \
    hostapd \
    libnetcmdiface \
    wpa_supplicant \
    wpa_supplicant.conf

# Samsung Doze
PRODUCT_PACKAGES += \
	SamsungDoze
	
# Broadcom stuff
ADDITIONAL_DEFAULT_PROPERTIES += \
	persist.brcm.log=none \
	persist.brcm.cp_crash=none \
	persist.brcm.ap_crash=none \
	persist.brcm.force_ramdump=0 \
	persist.sys.usb.sport=1

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
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
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    mobiledata.interfaces=rmnet0 \
    ro.telephony.ril_class=SamsungBCMRIL \
    persist.radio.multisim.config=dsds \
    ro.multisim.simslotcount=2 \
    cm.updater.uri=http://ota.sandpox.org/api \
    ro.telephony.call_ring.multiple=0 \
    camera2.portability.force_api=1 \
    ro.telephony.call_ring=0

# Enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks:
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.kernel.checkjni=0 \
    dalvik.vm.checkjni=false

# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog

# Use Awesomeplayer
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.use-awesome=true

# Default USB mode
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# Texture config.
include frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_kyleveub
PRODUCT_DEVICE := kyleveub
PRODUCT_MODEL := GT-S7392L
