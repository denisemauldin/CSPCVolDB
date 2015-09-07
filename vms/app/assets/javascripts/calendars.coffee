# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class App
  reload_calendar: ->
    source = new Array
    viewable_calendars = $('input:checkbox:checked.visable_calendars').map(->
      @value
    ).get().join(',')
    #calendar_url = '/event_instances.json?calendar_ids=' + viewable_calendars
    calendar_url = '/events.json'
    new_event_link = '#{new_event_path}'
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
      eventSources: [ {
        url: calendar_url
        data:
          custom_param1: 'something'
          custom_param2: 'somethingelse'
        error: ->
          alert 'there was an error while fetching events!'
          return
      } ]
      eventResize: @eventDropOrResize
      timeFormat: 'h:mmtt{ - h:mmtt} '
    return

app = new App
$(document).ready ->
  app.reload_calendar()
  $('#calendar-color').minicolors()