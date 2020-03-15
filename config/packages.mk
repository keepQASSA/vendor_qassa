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
    MatLog

# GApps
ifneq ($(WITH_GAPPS),true)
# Packages
PRODUCT_PACKAGES += \
    Launcher3
endif
