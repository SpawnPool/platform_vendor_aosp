# Check for target product
ifeq (aos_jflte,$(TARGET_PRODUCT))

$(call inherit-product, vendor/aosp/config/common.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/jflte/full_jflte.mk)

# Override AOSP build properties
# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := aos_jflte
PRODUCT_DEVICE := jflte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SCH-I545
endif
