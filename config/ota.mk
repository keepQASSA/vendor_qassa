ifneq ($(filter OFFICIAL CI,$(AOSQP_BUILD_TYPE)),)
PRODUCT_PACKAGES += \
    Updates
endif
