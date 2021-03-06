-- Copyright (C) 2021 luci-app-dns-over-tls-forwarder
-- Copyright (C) 2021 Nagase Kouichi
-- Licensed to the public under the GNU General Public License v3.

module("luci.controller.dns-over-tls-forwarder", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/dns-over-tls-forwarder") then
		return
	end

	entry({"admin", "services", "dns-over-tls-forwarder"}, cbi("dns-over-tls-forwarder"), _("DNS TLS Forwarder"), 60).dependent = true
	entry({"admin", "services", "dns-over-tls-forwarder", "status"}, call("act_status")).leaf = true
end

function act_status()
	local e={}
	e.running=luci.sys.call("pidof dns-over-tls-forwarder >/dev/null")==0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end