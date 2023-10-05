#
# Copyright (C) 2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifneq ($(TARGET_SONY_EXTRA_PATH),)
EXTRA_PATH := $(TARGET_SONY_EXTRA_PATH)
else
EXTRA_PATH := vendor/sony/extra
endif

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    $(EXTRA_PATH)

# Dolby Sound
    $(call inherit-product, vendor/sony/extra-yodo/extra/dolby/dolby.mk)

# ThreeSixtyRA Upmix Lite
    $(call inherit-product, vendor/sony/extra-yodo/extra/threesixtyra/upmix.mk)

# Sony Framework
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/extra/framework/system/,$(TARGET_COPY_OUT_SYSTEM)/) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/extra/framework/system_ext/,$(TARGET_COPY_OUT_SYSTEM_EXT)/) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/extra/framework/product/,$(TARGET_COPY_OUT_PRODUCT)/)

# Sony Camera
    $(call inherit-product, vendor/sony/extra-yodo/extra/camera/camera.mk)

# Sony Apps
    $(call inherit-product, vendor/sony/extra-yodo/extra/apps/apps.mk)

# Game Controllers
 PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/extra/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/)
