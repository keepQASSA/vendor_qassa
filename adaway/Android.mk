TARGET_GENERATED_HOSTS_BLOCKER := $(TARGET_OUT_INTERMEDIATES)/ADBLOCK/hosts.qassa_adblock
$(TARGET_GENERATED_HOSTS_BLOCKER): INTERMEDIATES := $(TARGET_OUT_INTERMEDIATES)/ADBLOCK
$(TARGET_GENERATED_HOSTS_BLOCKER): vendor/qassa/adaway/generate.sh vendor/qassa/adaway/generate.py external/hosts/hosts
	vendor/qassa/adaway/generate.sh $@

include $(CLEAR_VARS)
LOCAL_MODULE := hosts.qassa_adblock
LOCAL_MODULE_CLASS := ETC

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(TARGET_GENERATED_HOSTS_BLOCKER)
	@cp $< $@
