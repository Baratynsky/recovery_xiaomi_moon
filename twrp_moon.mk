#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
# Copyright (C) 2025 YOUR_NAME_OR_TEAM_NAME_HERE <--- ЗАМЕНИТЕ ЭТО ВАШИМ ИМЕНЕМ/НИКОМ
#
# SPDX-License-Identifier: Apache-2.0
#

# Наследование от базовых продуктов. Наиболее специфичные первыми.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Устанавливает ключи GSI в ramdisk для загрузки GSI разработчика с verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Включает квоты проекта и casefolding для эмулируемого хранилища без sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Включение Virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Убедитесь, что файл device/xiaomi/moon/device.mk существует и корректно настроен.
$(call inherit-product, device/xiaomi/moon/device.mk)

# Идентификация продукта
PRODUCT_DEVICE := moon
PRODUCT_NAME := twrp_moon
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi 13
PRODUCT_MANUFACTURER := Xiaomi

# GMS client ID для устройств Xiaomi
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=Redmi/moon_ru/moon:15/AP3A.240905.015.A2/OS2.0.5.0.VNTRUXM:user/release-keys \
    ro.build.description=moon_ru-user 15 AP3A.240905.015.A2 OS2.0.5.0.VNTRUXM release-keys \
    ro.product.system.brand=$(PRODUCT_BRAND) \
    ro.product.vendor.brand=$(PRODUCT_BRAND) \
    ro.product.system.device=$(PRODUCT_DEVICE) \
    ro.product.vendor.device=$(PRODUCT_DEVICE) \
    ro.product.system.manufacturer=$(PRODUCT_MANUFACTURER) \
    ro.product.vendor.manufacturer=$(PRODUCT_MANUFACTURER) \
    ro.product.system.model=$(PRODUCT_MODEL) \
    ro.product.vendor.model=24040RN64Y \
    ro.product.system.name=moon_ru \
    ro.product.vendor.name=moon_ru \
    ro.product.marketname=$(PRODUCT_MODEL) \
    ro.vendor.product.marketname=$(PRODUCT_MODEL)
