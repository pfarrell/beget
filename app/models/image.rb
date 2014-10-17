require 'fileutils'
class Image < Sequel::Model
  many_to_one :page

  def self.mv(from, to)
    FileUtils.mv(from, to)
  end
end
