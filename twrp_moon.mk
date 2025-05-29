#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
# Copyright (C) 2025 YOUR_NAME_OR_TEAM_NAME_HERE <--- ЗАМЕНИТЕ ЭТО ВАШИМ ИМЕНЕМ/НИКОМ
#
# SPDX-License-Identifier: Apache-2.0
#

# -----------------------------------------------------------------------------
# ВАЖНОЕ ЗАМЕЧАНИЕ:
# Убедитесь, что ваш файл device/xiaomi/moon/BoardConfig.mk
# корректен и специфичен для Xiaomi Redmi 13 (moon), особенно
# настройки архитектуры процессора (TARGET_CPU_VARIANT и т.д.).
# -----------------------------------------------------------------------------

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

# Наследование от конфигурации устройства moon
$(call inherit-product, device/xiaomi/moon/device.mk)

# Идентификация продукта
PRODUCT_DEVICE := moon
PRODUCT_NAME := twrp_moon # Это имя будет использовано для имени сборки, например, twrp_moon.zip
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi 13 # Это рыночное имя, которое будет отображаться
PRODUCT_MANUFACTURER := Xiaomi

# GMS client ID для устройств Xiaomi
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Переопределение свойств системы для TWRP.
# Цель - чтобы TWRP "представлялся" системе как можно ближе к стоковой прошивке moon_ru.
PRODUCT_PROPERTY_OVERRIDES += \
    # --- Идентификация сборки ---
    ro.build.fingerprint=Redmi/moon_ru/moon:15/AP3A.240905.015.A2/OS2.0.5.0.VNTRUXM:user/release-keys \
    ro.build.description=moon_ru-user 15 AP3A.240905.015.A2 OS2.0.5.0.VNTRUXM release-keys \
    # Явно переопределяем свойства продукта, чтобы избежать конфликтов с авто-генерируемыми
    ro.product.name=moon_ru \
    ro.product.device=$(PRODUCT_DEVICE) \
    ro.product.model=$(PRODUCT_MODEL) \
    ro.product.brand=$(PRODUCT_BRAND) \
    ro.product.manufacturer=$(PRODUCT_MANUFACTURER) \
    # Системные свойства продукта
    ro.product.system.name=moon_ru \
    ro.product.system.device=$(PRODUCT_DEVICE) \
    ro.product.system.model=$(PRODUCT_MODEL) \
    ro.product.system.brand=$(PRODUCT_BRAND) \
    ro.product.system.manufacturer=$(PRODUCT_MANUFACTURER) \
    # Вендорные свойства продукта
    ro.product.vendor.name=moon_ru \
    ro.product.vendor.device=$(PRODUCT_DEVICE) \
    ro.product.vendor.model=24040RN64Y \
    ro.product.vendor.brand=$(PRODUCT_BRAND) \
    ro.product.vendor.manufacturer=$(PRODUCT_MANUFACTURER) \
    # Рыночные имена
    ro.product.marketname=$(PRODUCT_MODEL) \
    ro.vendor.product.marketname=$(PRODUCT_MODEL)

# Если вам нужно, чтобы TWRP явно устанавливал аппаратный SKU (хотя обычно это не требуется,
# так как TWRP его читает из bootloader):
# PRODUCT_PROPERTY_OVERRIDES += \
#     ro.boot.product.hardware.sku=moon_gl

