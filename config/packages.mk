# Packages
PRODUCT_PACKAGES += \
    Calendar \
    Contacts \
    Dialer \
    DeskClock \
    Gallery2 \
    LatinIME \
    messaging \
    WallpaperPicker2

# GApps
ifneq ($(WITH_GAPPS),true)
# Packages
PRODUCT_PACKAGES += \
    Launcher3
endif
