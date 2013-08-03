module Catapult
  module CatapultMethods

    def build_request(url, method = "GET")
      uri = URI.parse(BaseUrl+ url)
      http = Net::HTTP.new(uri.host, uri.port)
      c_type = {'Content-Type' =>'application/xml'}

      request = case method
        when "GET"
          Net::HTTP::Get.new(uri.request_uri, c_type)
        when "POST"
          Net::HTTP::Post.new(uri.request_uri, c_type)
        when "DELETE"
          Net::HTTP::Delete.new(uri.request_uri, c_type)
        when "PUT"
          Net::HTTP::Put.new(uri.request_uri, c_type)
      end
      request.basic_auth(Catapult.username, Catapult.password)
      return http, request
    end

    def handle_response(response)
      if response.code.to_i == 200
        return true
      else
        return Hash.from_xml(response.body)
      end
    end

  end
end