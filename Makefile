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
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Wireless
  TITLE+= wfb_rx
  URL:=https://github.com/svpcom/wfb-ng
endef

define Package/wfb-gs/description
  $(Package/$(PKG_NAME)/description) RX
endef

define Package/wfb-tx
  $(call Package/$(PKG_NAME)/Default)
  DEPENDS:=+libpcap +libsodium +libstdcpp
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Wireless
  TITLE+= wfb_tx
  URL:=https://github.com/svpcom/wfb-ng
endef

define Package/wfb-tx/description
  $(Package/$(PKG_NAME)/description) TX
endef

define Package/wfb-keygen
  $(call Package/$(PKG_NAME)/Default)
  DEPENDS:=+libpcap +libsodium
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Wireless
  TITLE+= wfb_keygen
  URL:=https://github.com/svpcom/wfb-ng
endef

define Package/wfb-keygen/description
  $(Package/$(PKG_NAME)/description) KEYGEN
endef

define Package/wfb-key
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Wireless
  TITLE+= wfb key used by FPVue
  URL:=https://github.com/svpcom/wfb-ng
endef

define Package/wfb-key/description
  $(Package/$(PKG_NAME)/description) wfb key used by FPVue
endef

define Package/wfb-gs
  $(call Package/$(PKG_NAME)/Default)
  DEPENDS:=+libpcap +libsodium +libstdcpp +wfb-rx +wfb-key
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Wireless
  TITLE+= groundstations include wfb_rx and scripts
  URL:=https://github.com/svpcom/wfb-ng
endef

define Package/wfb-gs/description
  $(Package/$(PKG_NAME)/description) groundstations include wfb_rx scripts
endef

define Package/wfb-rx/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wfb_rx $(1)/usr/bin/
	$(LN) /usr/bin/wfb_rx $(1)/usr/bin/telemetry_rx
endef

define Package/wfb-tx/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wfb_tx $(1)/usr/bin/
	$(LN) /usr/bin/wfb_tx $(1)/usr/bin/telemetry_tx
endef

define Package/wfb-keygen/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wfb_keygen $(1)/usr/bin/
endef

define Package/wfb-key/install
	$(INSTALL_DIR) $(1)/etc/
	$(INSTALL_DATA) $(CURDIR)/files/FPVue.key $(1)/etc/
	$(LN) /etc/FPVue.key $(1)/etc/gs.key
endef

define Package/wfb-gs/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/wfb-gs.init $(1)/etc/init.d/wfb-gs
	$(INSTALL_DIR) $(1)/etc/hotplug.d/net/
	$(INSTALL_DATA) ./files/51-rndis $(1)/etc/hotplug.d/net/51-rndis
endef

$(eval $(call BuildPackage,wfb-rx))
$(eval $(call BuildPackage,wfb-tx))
$(eval $(call BuildPackage,wfb-keygen))
$(eval $(call BuildPackage,wfb-key))
$(eval $(call BuildPackage,wfb-gs))
