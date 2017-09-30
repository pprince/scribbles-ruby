#!/usr/bin/ruby

require 'nokogiri'
require 'open-uri'

URL = 'http://w1.weather.gov/xml/current_obs/KBKW.xml'

@doc = Nokogiri::XML(open(URL))

def E(elem)
    @doc.at_css(elem).text
end

puts <<EOF
    Weather from #{ URL } ...

    #{ E('location') } (#{ E('station_id') })
        Temp: #{ E('temperature_string') }
        Wind: #{ E('wind_string') }
EOF
