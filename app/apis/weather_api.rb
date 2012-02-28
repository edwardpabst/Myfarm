require 'net/http'
 
class Weatherapi < ApplicationController
  attr_accessor :url
  attr_accessor :uri
 
  def initialize
    @url = "http://graphical.weather.gov/xml/SOAP_server/ndfdXMLclient.php"
    @uri = URI.parse @url
  end
 

  def read(postalcode)
    request = Net::HTTP.new(@uri.host, @uri.port)
    parms = "?zipCodeList=#{postalcode}&product=time-series&begin=2004-01-01T00:00:00&end=2013-04-20T00:00:00&maxt=maxt&mint=mint&wspd=wspd&wdir=wdir&sky=sky&ph=ph&pop12=pop12&qpf=qpf&wx=wx"
    
    response = request.get("#{@uri.path}#{parms}")      

    response.body
  end
 
 
 
end

