date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
json.events @events

json.id "event_#{event.id}"
json.title event.title
json.start event.start.strftime(date_format)
json.end event.end.strftime(date_format)

json.color event.color unless event.color.blank?
json.allDay event.all_day_event? ? true : false

