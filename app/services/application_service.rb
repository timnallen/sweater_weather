class ApplicationService
  attr_reader :domain_name

  def initialize(domain_name)
    @domain_name = domain_name
  end

  def get_json(url, header_key = false)
    JSON.parse(get_response(url, header_key).body, symbolize_names: true)
  end

  def get_response(url, header_key = false)
    conn(header_key).get(url)
  end

  def conn(header_key = false)
    if header_key
      Faraday.new(url: @domain_name) do |faraday|
        faraday.headers[:api_key] = header_key
        faraday.adapter Faraday.default_adapter
      end
    else
      Faraday.new(url: @domain_name) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
