class User < ActiveRecord::Base
  has_many :quotes
  has_secure_password

  def slug
    self.username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|i| i.slug == slug}
  end
end
