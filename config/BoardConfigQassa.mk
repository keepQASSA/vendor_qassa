include vendor/qassa/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/qassa/config/BoardConfigQcom.mk
endif

include vendor/qassa/config/BoardConfigSoong.mk

# Namespace for fwk-detect
TARGET_FWK_DETECT_PATH ?= hardware/qcom-caf/common
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_FWK_DETECT_PATH)/fwk-detect
