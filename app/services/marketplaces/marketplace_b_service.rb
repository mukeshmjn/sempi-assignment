module Marketplaces
  class MarketplaceBService
    def initialize
      @base_url = 'http://localhost:3002'
    end

    def create_item(params = {})
      retries = 3 # Number of retry attempts
      begin
        res = api_service.post(@base_url, 'inventory', params.to_json)
        puts "Response from Marketplace A while creating an item -->>> #{res.to_json}"
        return res
      rescue StandardError => e
        retries -= 1
        if retries >= 0
          puts "Error: #{e.message}. Retrying in 2 seconds... (#{retries} retries left)"
          sleep(2)
          retry
        else
          puts "Failed after multiple attempts: #{e.message}"
          raise
        end
      end
    end

    def publish_item(item_id)
      retries = 3 # Number of retry attempts
      begin
        res = api_service.post(@base_url, "inventory/#{item_id}/publish", {}.to_json)
        puts "Response from Marketplace A while publishing an item -->>> #{res.to_json}"
        return res
      rescue StandardError => e
        retries -= 1
        if retries >= 0
          puts "Error: #{e.message}. Retrying in 2 seconds... (#{retries} retries left)"
          sleep(2)
          retry
        else
          puts "Failed after multiple attempts: #{e.message}"
          raise
        end
      end
    end

    private

    def api_service
      @api ||= Api.new
    end
  end
end
