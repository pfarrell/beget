class Image < Sequel::Model
  many_to_one :artist
end
