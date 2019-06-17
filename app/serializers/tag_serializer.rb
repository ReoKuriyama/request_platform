class TagSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :keyword
end
