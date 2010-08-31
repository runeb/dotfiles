// Proxy http://anything.l to localhost:3000
function FindProxyForURL(url, host) {
	if (shExpMatch(host, "*.l")) {
		return "PROXY localhost:3000";
	}
	return "DIRECT";
}