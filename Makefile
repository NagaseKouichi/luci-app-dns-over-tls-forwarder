#
# Copyright (C) 2021 luci-app-dns-over-tls-forwarder
# Copyright (C) 2021 Nagase Kouichi
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-dns-over-tls-forwarder
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Nagase Kouichi

LUCI_TITLE:=LuCI support for dns-over-tls-forwarder
LUCI_DESCRIPTION:=LuCI Support for dns-over-tls-forwarder.
LUCI_DEPENDS:=+dns-over-tls-forwarder
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
