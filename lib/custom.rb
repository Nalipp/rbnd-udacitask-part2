class CustomItem
  include Listable
  attr_reader :type, :description, :due, :priority, :start_date, :end_date

  def initialize(type, description, options={})
    @type = type
    @description = description
    @due = Chronic.parse(options[:due])
    @priority = options[:priority]
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:start_date]
  end

  def details
    format_description_type(@description, @type) + "due: " +
    format_date(due: @due).to_s +
    format_priority(@priority) +
    "event dates: " + format_date(start_date: @start_date, end_date: @end_date).to_s
  end
end
