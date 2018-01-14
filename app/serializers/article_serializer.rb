class ArticleSerializer < ActiveModel::Serializer
  attributes :owner_name, :id, :name, :price, :description

  def owner_name
    object.user.name
  end

  def price
    "#{object.price}$"
  end
end
