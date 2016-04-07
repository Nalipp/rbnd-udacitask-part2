class TodoItem
  include Listable
  attr_reader :type, :description, :due, :priority

  def initialize(type, description, options={})
    @type = type
    @description = description
    @due = Chronic.parse(options[:due])
    @priority = options[:priority]
  end
  def details
    format_description_type(@description, @type) + "due: " +
    format_date(due: @due).to_s +
    format_priority(@priority)
  end
end
