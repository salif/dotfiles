function my-location
  curl -sL http://www.geoplugin.net/json.gp | jq '.geoplugin_continentCode+", "+.geoplugin_countryName+", "+.geoplugin_request' -r
end
