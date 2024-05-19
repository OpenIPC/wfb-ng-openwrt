#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wfb-ng
PKG_VERSION:=23.08.1
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_CPE_ID:=cpe:/w:wfb-ng:wfb-ng

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/svpcom/wfb-ng/tar.gz/$(PKG_NAME)-$(PKG_VERSION)?
PKG_HASH:=a24c425ad0963ced57c24ae8535692340aab39ff09897ecf5d11eb698f24356c
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Ruixi Zhou <zhouruixi@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/wfb-ng/default
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +libsodium +libstdcpp
  TITLE:=Next generation of long-range packet radio link based on raw WiFi radio
  URL:=https://github.com/svpcom/wfb-ng
  SUBMENU:=Wireless
endef

define Package/wfb-ng/description
  Next generation of long-range packet radio link based on raw WiFi radio
endef

define Package/wfb-rx
  $(call Package/$(PKG_NAME)/Default)
  DEPENDS:=+libpcap +libsodium +libstdcpp
  TITLE:=Next generation of long-range packet radio link based on raw WiFi radio RX
  URL:=https://github.com/svpcom/wfb-ng
endef

define Package/wfb-rx/description
  Next generation of long-range packet radio link based on raw WiFi radio RX
endef

define Package/wfb-tx
  $(call Package/$(PKG_NAME)/Default)
  DEPENDS:=+libpcap +libsodium +libstdcpp
  TITLE:=Next generation of long-range packet radio link based on raw WiFi radio TX
  URL:=https://github.com/svpcom/wfb-ng
endef

define Package/wfb-tx/description
  Next generation of long-range packet radio link based on raw WiFi radio TX
endef

define Package/wfb-keygen
  $(call Package/$(PKG_NAME)/Default)
  DEPENDS:=+libpcap +libsodium
  TITLE:=Next generation of long-range packet radio link based on raw WiFi radio KEYGEN
  URL:=https://github.com/svpcom/wfb-ng
endef

define Package/wfb-keygen/description
  Next generation of long-range packet radio link based on raw WiFi radio KEYGEN
endef


define Package/wfb-rx/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wfb_rx $(1)/usr/bin/
endef

define Package/wfb-tx/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wfb_tx $(1)/usr/bin/
endef

define Package/wfb-keygen/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wfb_keygen $(1)/usr/bin/
endef

$(eval $(call BuildPackage,wfb-rx))
$(eval $(call BuildPackage,wfb-tx))
$(eval $(call BuildPackage,wfb-keygen))
