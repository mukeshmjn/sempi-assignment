module Marketplaces
    class MarketplaceAService
      def initialize
        @base_url = 'http://localhost:3001'
      end
  
      def create_product(params = {})
        res = api_service.post(@base_url, 'api/products', params.to_json)
        puts "Response from Marketplace A while creating a product -->>> #{res.to_json}"
        res
      end
  
      private
  
      def api_service
        @api ||= Api.new
      end
    end
  end
  