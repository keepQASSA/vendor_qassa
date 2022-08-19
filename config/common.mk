PRODUCT_BRAND ?= QASSA

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true \
    ro.setupwizard.rotation_locked=true

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY),true)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.recovery_update=true
endif

# Binaries for file-based incremental ota
PRODUCT_COPY_FILES += \
    vendor/qassa/prebuilt/common/bin/busybox:install/bin/busybox \
    vendor/qassa/prebuilt/common/bin/mount_all.sh:install/bin/mount_all.sh \
    vendor/qassa/prebuilt/common/bin/mount_functions.sh:install/bin/mount_functions.sh \
    vendor/qassa/prebuilt/common/bin/setup_busybox.sh:install/bin/setup_busybox.sh \
    vendor/qassa/prebuilt/common/bin/umount_all.sh:install/bin/umount_all.sh

# OTA
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true
endif

# Some permissions
PRODUCT_COPY_FILES += \
    vendor/qassa/config/permissions/backup.xml:system/etc/sysconfig/backup.xml \
    vendor/qassa/config/permissions/privapp-permissions-lineagehw.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-lineagehw.xml \
    vendor/qassa/config/permissions/privapp-permissions-livedisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-livedisplay.xml \
    vendor/qassa/config/permissions/privapp-permissions-qassa-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-qassa.xml \
    vendor/qassa/config/permissions/privapp-permissions-qassa-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qassa.xml

# Copy all qassa init rc files
$(foreach f,$(wildcard vendor/qassa/prebuilt/common/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/qassa/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable Android Beam on all targets
PRODUCT_COPY_FILES += \
    vendor/qassa/config/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.nfc.beam.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Enforce privapp-permissions whitelist
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=enforce

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/qassa/config/permissions/custom-power-whitelist.xml:system/etc/sysconfig/custom-power-whitelist.xml

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/qassa/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/qassa/overlay/common

# Cutout control overlay
PRODUCT_PACKAGES += \
    NoCutoutOverlay

# TouchGestures
PRODUCT_PACKAGES += \
    TouchGestures

# PixelSetupWizard overlay
PRODUCT_PACKAGES += \
    PixelSetupWizardOverlay \
    PixelSetupWizardAodOverlay

# Gestures overlay
PRODUCT_PACKAGES += \
    NavBarGesturalNoPillOverlay \
    NavBarGesturalNarrowBackNoPillOverlay \
    NavBarGesturalWideBackNoPillOverlay \
    NavBarGesturalExtraWideBackNoPillOverlay \

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    Settings

# Themed bootanimation
TARGET_MISC_BLOCK_OFFSET ?= 0
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.misc.block.offset=$(TARGET_MISC_BLOCK_OFFSET)
PRODUCT_PACKAGES += \
    misc_writer_system \
    themed_bootanimation

# Long Screenshot
PRODUCT_PACKAGES += \
    StitchImage

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED := false
ifeq ($(TARGET_GAPPS_ARCH),arm64)
ifneq ($(TARGET_DISABLE_ALTERNATIVE_FACE_UNLOCK), true)
PRODUCT_PACKAGES += \
    FaceUnlockService
TARGET_FACE_UNLOCK_SUPPORTED := true
endif
endif
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.moto_unlock_service=$(TARGET_FACE_UNLOCK_SUPPORTED)

# Branding
include vendor/qassa/config/branding.mk

# GApps
ifeq ($(WITH_GAPPS),true)
include vendor/gapps/config.mk

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    NexusLauncherRelease

else

# ShadyQuickStep
PRODUCT_PACKAGES += \
    ShadyQuickStep

# Launcher overlay
PRODUCT_PACKAGES += \
    ShadyQuickStepAppLockOverlay

endif

# keepQASSA
include vendor/keepQASSA/config.mk

# Customization
include vendor/google-customization/config.mk

# Packages
include vendor/qassa/config/packages.mk

# GamingMode
PRODUCT_PACKAGES += \
    GamingMode

-include $(WORKSPACE)/build_env/image-auto-bits.mk
