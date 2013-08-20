module Catapult
  class Campaign
    extend CatapultMethods

    def self.list_campaigns(account_list=nil, status_filter=nil, type_filter=nil)
      req_str = "/api/campaigns.xml?"
      arr = {}
      arr[:accounts] = account_list if account_list
      arr[:status] = status_filter if status_filter
      arr[:type] = type_filter if type_filter
      http, request = build_request(req_str + arr.to_query)
      response = http.request(request)
      Hash.from_xml(response.body)
    end

  end
end