require 'uri'

class Link < ActiveRecord::Base
  validates :url, :format => URI::regexp(%w(http https))

end
