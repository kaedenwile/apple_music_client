module AppleMusicClient

  class PaginatedResponse
    include Enumerable

    def initialize(client, response)
      @client = client
      @response = response
    end

    def each(&block)
      return to_enum(:each) unless block_given?
      return if @response.nil? or @response["data"].nil?

      @response["data"].each(&block)
      return if @response["next"].nil?
      PaginatedResponse.new(@client, @client.get(@response["next"])).each(&block)
    end

  end

end