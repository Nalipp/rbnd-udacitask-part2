class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = Chronic.parse(options[:due])
    @priority = options[:priority]
  end
  def details
    format_description(@description) + "due: " +
    format_date(due: @due).to_s +
    format_priority(@priority)
  end
end
