module Listable
  def format_description(description)
    "#{description}".ljust(25)
  end

  def format_date(options={})
    due = options[:due]
    start_date = options[:start_date]
    end_date = options[:end_date]

    if options[:due]
      due ? due.strftime("%D") : "No due date"
      return due
    end

    dates = start_date.strftime("%D") if start_date
    dates << " -- " + end_date.strftime("%D") if end_date
    dates = "N/A" if !dates
    return dates
  end

  def format_priority(priority)
    return value = " ⇧" if priority == "high"
    return value = " ⇨" if priority == "medium"
    return value = " ⇩" if priority == "low"
    return value = "" if !priority
    raise UdaciListErrors::InvalidPriorityValue, "'#{priority}' is not a valid priority"
    return value
  end
end
