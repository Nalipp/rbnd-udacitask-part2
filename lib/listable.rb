module Listable
  def format_description_type(description, type)
    "#{description}".ljust(25) + "#{type}".ljust(8)
  end
  def format_date(options={})
    due = options[:due]
    start_date = options[:start_date]
    end_date = options[:end_date]

    if options[:due]
      due_date = due ? due.strftime("%Y-%m-%d") : "No due date"
      return due_date
    end

    dates = start_date.strftime("%D") if start_date
    dates << " -- " + end_date.strftime("%D") if end_date
    dates = "N/A" if !dates
    return dates
  end
  def format_priority(priority)
    return " ⇧".blue.blink if priority == "high"
    return " ⇨".blue.blink if priority == "medium"
    return " ⇩".blue.blink if priority == "low"
    return "" if !priority
    raise UdaciListErrors::InvalidPriorityValue, "'#{priority}' is not a valid priority"
  end
  def format_name(site_name)
    site_name ? site_name : ""
  end
end
