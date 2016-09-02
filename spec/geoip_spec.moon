
import lookup_addr from require "geoip"

describe "geoip", ->
  it "looks up address", ->
    assert.same {
      asnum: "AS15169 Google Inc."
      country_code: "US"
      country_name: "United States"
    }, lookup_addr "8.8.8.8"

  it "looks up address without asnum", ->
    assert.same {
      country_name: "Australia"
      country_code: "AU"
    }, lookup_addr "1.1.1.1"

  it "looks up bad address", ->
    assert.same nil, (lookup_addr "helloo.world")