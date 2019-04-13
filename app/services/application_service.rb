class ApplicationService
  def initialize(domain_name)
    @domain_name = domain_name
  end

  def get_json(url)
    JSON.parse(get_response(url).body, symbolize_names: true)
  end

  def get_response(url)
    conn.get(url)
  end

  def conn
    Faraday.new(url: @domain_name) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
