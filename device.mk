#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
TARGET_IS_VAB := true

# Inherit from sm8250-common
$(call inherit-product, device/xiaomi/sm8250-common/kona.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_PACKAGES += \
    MunchSystemUI

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Call the MiuiCamera setup
$(call inherit-product-if-exists, vendor/xiaomi/miuicamera/miuicamera.mk)

# Camera
PRODUCT_PACKAGES += \
    libpiex_shim
    
# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-aosp

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Shims
PRODUCT_PACKAGES += \
    lib-watermarkshim

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# NFC
PRODUCT_SYSTEM_PROPERTIES += \
    ro.boot.hardware.sku=munch

PRODUCT_PACKAGES += \
    MunchNfcOverlay

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/munch/munch-vendor.mk)
