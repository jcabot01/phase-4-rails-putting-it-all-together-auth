class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :instructions, :minutes_to_complete

  belongs_to :user  #also returning user object.  (It is rendered based on its serializer)
end
