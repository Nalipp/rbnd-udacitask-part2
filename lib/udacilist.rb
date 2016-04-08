class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? options[:title] : "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    return @items.push TodoItem.new(type, description, options) if type == "todo"
    return @items.push EventItem.new(type, description, options) if type == "event"
    return @items.push LinkItem.new(type, description, options) if type == "link"
    return @items.push CustomItem.new(type, description, options)
  end
  def delete(index)
    return @items.delete_at(index - 1) if @items.length > index - 1
    raise UdaciListErrors::IndexExceedsListSize, "'#{index},' is not on the list'"
  end
  def filter(filter_type)
    filtered_items = items.map { |item| item if item.type == filter_type }.compact
    raise UdaciListErrors::ItemNotAvailable, "'#{filter_type}' category not created" if filtered_items.length == 0
    all(filtered_items: filtered_items, filter_type: filter_type)
  end
  def all(options={})
    puts "-" * @title.length
    puts options[:filter_type] ? @title + " (filtered : #{options[:filter_type]})" : @title
    puts "-" * @title.length
    progress_bar(50)
    mutable_loop = @items
    mutable_loop = options[:filtered_items] if options[:filtered_items]
    mutable_loop.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
