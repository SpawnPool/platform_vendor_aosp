# Copyright (C) 2014 Team-OctOS
#         Banana pancakes are tasty
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1 \
    dalvik.vm.dexopt-data-only=1
    
ifdef AOS_BUILD_EXTRA
    AOS_POSTFIX := $(AOS_BUILD_EXTRA)
endif
ifndef AOS_BUILD_TYPE
    AOS_BUILD_TYPE := OFFICIAL
    PLATFORM_VERSION_CODENAME := OFFICIAL
    AOS_POSTFIX := $(shell date +"%Y%m%d-%H%M")
endif

# Set all versions
## Don't TOUCH!  This controls the OTA update function.
##I touched it, whatcha gonna do about it you big crazy purple guy you? <pelvic thrust> <pelvic thrust two times>
AOS_VERSION := AOSP-$(AOS_POSTFIX)
AOS_MOD_VERSION := AOSP-$(AOS_POSTFIX)-$(AOS_BUILD)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    aos.ota.version=$(AOS_POSTFIX) \
    ro.aos.version=$(AOS_VERSION) \
    ro.modversion=$(AOS_MOD_VERSION)
    
