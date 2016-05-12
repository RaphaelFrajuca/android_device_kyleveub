# Release name
PRODUCT_RELEASE_NAME := GT-S7392L

# Inherit device configuration
$(call inherit-product, device/samsung/kyleveub/device_kyleveub.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kyleveub
PRODUCT_NAME := aokp_kyleveub
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-S7392L
PRODUCT_CHARACTERISTICS := phone
