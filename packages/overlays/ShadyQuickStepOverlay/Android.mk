LOCAL_PATH:= $(call my-dir)

# ShadyQuickStepAppLock
include $(CLEAR_VARS)
LOCAL_RRO_THEME := ShadyQuickStepAppLock
LOCAL_PRODUCT_MODULE := true
LOCAL_SRC_FILES := $(call all-subdir-java-files)
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res
LOCAL_PACKAGE_NAME := ShadyQuickStepAppLockOverlay
LOCAL_SDK_VERSION := current
include $(BUILD_RRO_PACKAGE)
