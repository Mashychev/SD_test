require 'httparty'

class ItemsService
  API_KEY = 'Your_API_KEY'

  def initialize(id)
    walmart_item = get_walmart_item_data(id)
    Item.find_or_create_by(id: id) do |item|
      item.name = walmart_item['name']
      item.price = walmart_item['salePrice']
    end
    ReviewsService.new(id)
  end

  private

  def get_walmart_item_data(walmart_id)
    item_url = "http://api.walmartlabs.com/v1/items/#{walmart_id}?apiKey=#{API_KEY}"
    HTTParty.get(item_url)
  end
end
