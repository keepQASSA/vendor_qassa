# Set all versions
QASSA_BUILD_CODENAME := Sisu
QASSA_VERSION_NUMBER := v2.4.s

# byNgantu (official)
QASSA_BUILD_TYPE ?= COMMUNITY

QASSA_DATE_YEAR := $(shell date -u +%Y)
QASSA_DATE_MONTH := $(shell date -u +%m)
QASSA_DATE_DAY := $(shell date -u +%d)
QASSA_DATE_HOUR := $(shell date -u +%H)
QASSA_DATE_MINUTE := $(shell date -u +%M)
QASSA_BUILD_DATE_UTC := $(shell date -d '$(QASSA_DATE_YEAR)-$(QASSA_DATE_MONTH)-$(QASSA_DATE_DAY) $(QASSA_DATE_HOUR):$(QASSA_DATE_MINUTE) UTC' +%s)
QASSA_BUILD_DATE := $(QASSA_DATE_YEAR)$(QASSA_DATE_MONTH)$(QASSA_DATE_DAY)-$(QASSA_DATE_HOUR)$(QASSA_DATE_MINUTE)

TARGET_PRODUCT_SHORT := $(subst qassa_,,$(QASSA_BUILD))

ifeq ($(WITH_GAPPS), true)
QASSA_VERSION := qassa_$(QASSA_BUILD_CODENAME)-$(QASSA_VERSION_NUMBER)-$(QASSA_BUILD_TYPE)-$(QASSA_BUILD)-$(QASSA_BUILD_DATE)-GApps-signed
else
QASSA_VERSION := qassa_$(QASSA_BUILD_CODENAME)-$(QASSA_VERSION_NUMBER)-$(QASSA_BUILD_TYPE)-$(QASSA_BUILD)-$(QASSA_BUILD_DATE)-Vanilla-signed
endif
QASSA_VERSION_PROP := Q

QASSA_PROPERTIES := \
    ro.qassa.version=$(QASSA_VERSION_PROP) \
    ro.qassa.version.display=$(QASSA_VERSION) \
    ro.qassa.build.codename=$(QASSA_BUILD_CODENAME) \
    ro.qassa.build.type=$(QASSA_BUILD_TYPE) \
    ro.qassa.version.number=$(QASSA_VERSION_NUMBER) \
    ro.qassa.build_date=$(QASSA_BUILD_DATE) \
    ro.qassa.build_date_utc=$(QASSA_BUILD_DATE_UTC)
