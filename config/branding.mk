# Set all versions
AOSQP_DATE_YEAR := $(shell date -u +%Y)
AOSQP_DATE_MONTH := $(shell date -u +%m)
AOSQP_DATE_DAY := $(shell date -u +%d)
AOSQP_DATE_HOUR := $(shell date -u +%H)
AOSQP_DATE_MINUTE := $(shell date -u +%M)
AOSQP_BUILD_DATE_UTC := $(shell date -d '$(AOSQP_DATE_YEAR)-$(AOSQP_DATE_MONTH)-$(AOSQP_DATE_DAY) $(AOSQP_DATE_HOUR):$(AOSQP_DATE_MINUTE) UTC' +%s)
AOSQP_BUILD_DATE := $(AOSQP_DATE_YEAR)$(AOSQP_DATE_MONTH)$(AOSQP_DATE_DAY)-$(AOSQP_DATE_HOUR)$(AOSQP_DATE_MINUTE)

TARGET_PRODUCT_SHORT := $(subst aosqp_,,$(AOSQP_BUILD))

AOSQP_VERSION := AOSQP_v1.0_$(AOSQP_BUILD)-$(AOSQP_BUILD_DATE)-QASSA
AOSQP_VERSION_PROP := Q

AOSQP_PROPERTIES := \
    ro.aosqp.version=$(AOSQP_VERSION_PROP) \
    ro.aosqp.version.display=$(AOSQP_VERSION) \
    ro.aosqp.build_date=$(AOSQP_BUILD_DATE) \
    ro.aosqp.build_date_utc=$(AOSQP_BUILD_DATE_UTC) \
    ro.aosqp.build_type=QASSA
