class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? options[:title] : "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    return @items.push TodoItem.new(description, options) if type == "todo"
    return @items.push EventItem.new(description, options) if type == "event"
    return @items.push LinkItem.new(description, options) if type == "link"
    raise UdaciListErrors::InvalidItemType, "'#{type}' is not a valid category"
  end
  def delete(index)
    return @items.delete_at(index - 1) if @items.length > index
    raise UdaciListErrors::IndexExceedsListSize, "'#{index},' is not on the list'"
  end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
