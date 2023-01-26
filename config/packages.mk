# Packages
PRODUCT_PACKAGES += \
    Calendar \
    Contacts \
    Dialer \
    DeskClock \
    Gallery2 \
    LatinIME \
    messaging \
    WallpaperPicker2 \
    ExactCalculator

# Matlog
ifneq ($(TARGET_EXCLUDE_MATLOG),true)
PRODUCT_PACKAGES += \
    MatLog
endif

# GApps
ifneq ($(WITH_GAPPS),true)
# Packages
PRODUCT_PACKAGES += \
    Launcher3
endif

# QASSA Ad-block
PRODUCT_PACKAGES += \
    hosts.qassa_adblock

# Common GMS properties
PRODUCT_PRODUCT_PROPERTIES += \
    persist.rcs.supported=1 \
    ro.opa.eligible_device=true \
    ro.com.google.ime.theme_id=5 \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms \
    ro.product.locale=en-US \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.product.needs_model_edit=false \
    ro.support_one_handed_mode=true \
    persist.sys.storage_picker_enabled=true \
    debug.photos.p_editr.eraser=1 \
    debug.photos.force_pixel_eol=1 \
    debug.photos.eraser_camo=1 \
    debug.photos.eraser_suggestion=1 \
    ro.support_hide_display_cutout=true
