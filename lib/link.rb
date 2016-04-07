class LinkItem
  include Listable
  attr_reader :type, :description, :site_name

  def initialize(type, url, options={})
    @type = type
    @description = url
    @site_name = options[:site_name]
  end
  def details
    format_description_type(@description, @type) + "site name: " + format_name(@site_name)
  end
end
