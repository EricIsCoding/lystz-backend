class BlockSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :creator

  has_many :items
  belongs_to :vendor
end
