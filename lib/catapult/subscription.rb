module Catapult
  class Subscription
    extend CatapultMethods

    def self.list_subscribers(campaign)
      http, request = build_request("/api/subscription_campaigns/#{campaign}/subscriptions.xml")
      response = http.request(request)
      Hash.from_xml(response.body)
    end

    # returns:
    #  true on success
    #  hash on false
    #
    def self.create_subscription(campaign, phone)
      http, request = build_request("/api/subscription_campaigns/#{campaign}/subscriptions.xml", "POST")
      xml = Nokogiri::XML::Builder.new do |x|
        x.subscription{
         x.user{
          x.send(:'mobile-phone', phone)
         }
        }
      end
      request.body = xml.to_xml(:save_with => Nokogiri::XML::Node::SaveOptions::AS_XML | Nokogiri::XML::Node::SaveOptions::NO_DECLARATION).strip
      response = http.request(request)
      handle_response(response)
    end

    # returns:
    #  true on success
    #  hash on false
    #
    def self.read_subscription(campaign, phone)
      http, request = build_request("/api/subscription_campaigns/#{campaign}/subscriptions/#{phone}.xml", "GET")
      response = http.request(request)
      handle_response(response)
    end

    # returns:
    #  true on success
    #  hash on false
    #
    def self.delete_subscriber(campaign, phone, suppress_message = false)
      http, request = build_request("/api/subscription_campaigns/#{campaign}/subscriptions/#{phone}.xml?suppress_message=#{suppress_message}", "DELETE")
      response = http.request(request)
      handle_response(response)
    end

    # options = {
    #   'birthday-on' => '02/18/1978',
    #   'email' => 'fake@fake.co',
    #   'gender' => "M"
    # }
    def self.update_subscriber(campaign, phone, options = {})
      http, request = build_request("/api/subscription_campaigns/#{campaign}/subscriptions/#{phone}.xml", "PUT")
      xml = Nokogiri::XML::Builder.new do |x|
        x.subscription{
         x.user{
          x.send(:'mobile-phone', phone)
          x.send(:'carrier_id', options['carrier_id']) if options['carrier_id']
          x.send(:'first-name', options['first-name']) if options['first-name']
          x.send(:'last-name', options['last-name']) if options['last-name']
          x.send(:'birthday-on', options['birthday-on']) if options['birthday-on']
          x.send(:'email', options['email']) if options['email']
          x.send(:'gender', options['gender']) if options['gender']
          x.send(:'postal-code', options['postal-code']) if options['postal-code']
          x.send(:'timezone-id', options['timezone-id']) if options['timezone-id']
         }
        }
      end
      request.body = xml.to_xml(:save_with => Nokogiri::XML::Node::SaveOptions::AS_XML | Nokogiri::XML::Node::SaveOptions::NO_DECLARATION).strip
      response = http.request(request)
      handle_response(response)
    end
  end
end