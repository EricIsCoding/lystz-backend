class VendorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :website

  has_many :items
  has_many :blocks
end
