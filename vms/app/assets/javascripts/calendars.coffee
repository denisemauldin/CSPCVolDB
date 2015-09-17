# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class App
  reload_calendar: ->
    new_event_link = '/events/new'
    $('#calendar').fullCalendar
      dayClick: (date, allDay, jsEvent, view) ->
        document.location.href = new_event_link + '?start_date=' + date
        return
      header:
        left: 'prev,today,next'
        center: 'title'
        right: 'month,agendaWeek,agendaDay'
      selectable: true
      selectHelper: true
      editable: false
      ignoreTimezone: false
      select: @select
      eventClick: @eventClick
      eventDrop: @eventDropOrResize
      eventResize: @eventDropOrResize
      timeFormat: 'h:mmt'
      displayEventEnd: {
                        month: true,
                        basicWeek: true,
                        "default": true
                        }
    calendar_url = '/calendar_events.json?calendar_ids='
    $('input:checkbox:checked.visible_calendars').map(->
      console.log("adding calendar to eventSource "+calendar_url+@value)
      $('#calendar').fullCalendar('addEventSource',calendar_url+@value)
    )
    return

window.toggleCalendar = (cb, calendar_id) ->
  if cb.checked == true
    $('#calendar').fullCalendar('addEventSource','/calendar_events.json?calendar_ids='+calendar_id)
  else
    $('#calendar').fullCalendar('removeEventSource','/calendar_events.json?calendar_ids='+calendar_id)   
  return
    
window.app = new App

$(document).ready ->
  app.reload_calendar()
  $('#calendar-color').minicolors()