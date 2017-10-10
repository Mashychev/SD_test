require 'httparty'

class ReviewsService

  def initialize(id)
    get_all_reviews(id)
  end

  def get_all_reviews(id)
    total_pages = get_page_reviews(id, 1).parsed_response['payload']['pagination']['pages'][7]['num']
    1.upto(total_pages) do |i|
      get_page_reviews(id, i).parsed_response['payload']['customerReviews'].each do |item_review|
        Review.find_or_create_by(id: item_review['reviewId']) do |review|
          review.rating = item_review['rating']
          review.text = item_review['reviewText']
          review.title = item_review['reviewTitle']
          review.nickname = item_review['userNickname']
          review.item_id = id
        end
      end
    end
  end

  def get_page_reviews(id, page)
    reviews_url = "https://www.walmart.com/terra-firma/item/#{id}/reviews?showProduct=false&sort=relevancy&filters=&page=#{page}&limit="
    HTTParty.get(reviews_url)
  end
end
