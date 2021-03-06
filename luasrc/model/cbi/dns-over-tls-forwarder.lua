-- Copyright (C) 2021 luci-app-dns-over-tls-forwarder
-- Copyright (C) 2021 Nagase Kouichi
-- Licensed to the public under the GNU General Public License v3.

local m, s, o


m = Map("dns-over-tls-forwarder", translate("dns-over-tls-forwarder"), translate("A simple, fast DNS-over-TLS forwarding server with hybrid LRU/MFA caching written in Go."))

m:section(SimpleSection).template  = "dns-over-tls-forwarder/status"

s = m:section(TypedSection, "dns-over-tls-forwarder", translate("General Setting"))
s.anonymous   = true

o = s:option(Flag, "enable", translate("Enable"))
o.rmempty     = false

o = s:option(Value, "listen_addr", translate("Listen Address"))
o.placeholder = ":8153"
o.default     = ":8153"
o.rmempty     = false

o = s:option(Value, "dns_servers", translate("Upstream DNS Servers"), translate("comma-separated list of upstream servers"))
o.placeholder = "one.one.one.one:853@1.1.1.1,dns.google:853@8.8.8.8"
o.default     = "one.one.one.one:853@1.1.1.1,dns.google:853@8.8.8.8"
o.rmempty     = false

return m
