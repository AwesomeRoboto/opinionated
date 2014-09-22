class Review
  include Mongoid::Document 
  field :name, type: String
  field :email, type: String
  field :rating, type: Float
  field :restaurant, type: String
  field :comment, type: String
end

