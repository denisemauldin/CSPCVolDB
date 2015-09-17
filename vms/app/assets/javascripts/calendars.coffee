# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class App
  reload_calendar: ->
    viewable_calendars = $('input:checkbox:checked.visible_calendars').map(->
      @value
    ).get().join(',')
    console.log("viewable_calendars",viewable_calendars)
    unless viewable_calendars
      viewable_calendars = 'empty'                              
    calendar_url = '/calendar_events.json?calendar_ids='+ viewable_calendars
    console.log("calendar_url",calendar_url)
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
      eventSources: [ {
        url: calendar_url
        data:
          custom_param1: viewable_calendars
        error: ->
          alert 'there was an error while fetching events!'
          return
      } ]
      eventResize: @eventDropOrResize
      timeFormat: 'h:mmt'
      displayEventEnd: {
                        month: true,
                        basicWeek: true,
                        "default": true
                        }
    return

window.app = new App
$(document).ready ->
  app.reload_calendar()
  $('#calendar-color').minicolors()