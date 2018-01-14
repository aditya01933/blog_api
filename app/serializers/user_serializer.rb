class UserSerializer < ActiveModel::Serializer
  attribute :owner_name, if: -> { @instance_options[:custom_key] }
  attribute :name, if: -> { !@instance_options[:custom_key] }
  has_many :articles

  def owner_name
    object.name
  end
end
