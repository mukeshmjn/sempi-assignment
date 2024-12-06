class Api
    def post(base_url, endpoint, params)
      response = Faraday.post(final_url(base_url, endpoint), params, headers)
      handle_response(response)
    end
  
    def put(base_url, endpoint, params)
      response = Faraday.put(final_url(base_url, endpoint), params, headers)
      handle_response(response)
    end
  
    def get(base_url, endpoint, params = {})
      response = Faraday.get(final_url(base_url, endpoint), params, headers)
      handle_response(response)
    end
  
    private
  
    def handle_response(response)
      raise if response.status == 500
      response_body = JSON.parse(response.body)
      status = response.status
      { body: response_body, status: status }
    end
  
    def final_url(base_url, endpoint)
      "#{base_url}/#{endpoint}"
    end
  
    def headers
      {
        "Content-Type": "application/json"
      }
    end
  end
  