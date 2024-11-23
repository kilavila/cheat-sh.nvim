local _http = {}

_http.get = function(url)
	local result = io.popen("curl -s " .. url)

	if result == nil then
		return ""
	end

	local data = result:read("*a")
	result:close()

	return data
end

return _http
