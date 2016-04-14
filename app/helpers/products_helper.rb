module ProductsHelper

  def cache_key_for_products
    count = Product.count
    max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"
  end

  def fetch_comments
    comments = $redis.get("comments")
    if comments.nil?
      comments = @product.comments.all.to_json
      $redis.set("comments", comments)
      # Expire the cache, every 5 hours
      $redis.expire("comments",5.hour.to_i)
    end
    @comments = JSON.load comments
  end

end