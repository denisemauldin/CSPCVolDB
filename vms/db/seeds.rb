# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Position.create(name: 'Cashier',training:1,shadowing:3, desc:'Take the money. Be nice. That is all. ')
Position.create(name: 'Monitor',training: 1, shadowing:3,desc:'Watch people. Tell an EC. Still get yelled at.')
Position.create(name: 'Event Coordinator',training:1, shadowing:9,desc:'Shadow: Cashier, Ambassador and Monitor. Never get it \"right.\" Have everyone hate you then hate you again for not showing up early to stay late for a party you maybe don\'t care about.')
Position.create(name: 'Ambassador',training:1, shadowing:3,desc:'Be nice to people. Show them around. Don\'t hit on them or try to make dates. ')
Position.create(name: 'Food Prep',training:0, shadowing:0,desc:'Prep food. Don\'t make attendees sick.')
Position.create(name: 'Library-Host',training:1, shadowing:0,desc:'I think... I mean, I don\'t really know. ')
Position.create(name: 'Librarian',training:1, shadowing:0,desc:'Check out materials. ')
Position.create(name: 'Setup',training:0, shadowing:0,desc:'Move stuff into place. Then be told it needs to go back over there. Nope, it should have been where it just was. Fuck it, you move it.')
Position.create(name: 'Staff',training:1, shadowing:0,desc:'Seriously... I have not a clue but you get hours.')
Position.create(name: 'Strike',training:0, shadowing:0,desc:'Hahahaahah.... I hope you like sleep dep, dipshit.')
Position.create(name: 'Host',training:1, shadowing:0,desc:'Set the tone for the party. ')
Position.create(name: 'Passport Guide',training:1, shadowing:0,desc:'Go to Passport meeting then go to another party and passport things.')
Position.create(name: 'Non-Event: Duster',training:1, shadowing:0,desc:'Go in once a week and clean everything.')
Position.create(name: 'Stocking',training:1, shadowing:0,desc:'Stock soda, candy & peanut dispensers, etc.')
Position.create(name: 'Office Minion',training:1, shadowing:0,desc:'Do office things, in the office.')
Position.create(name: 'Laundry Team',training:1, shadowing:0,desc:'Take laundry from the bins and run it through the washing machine and dryer. Wear gloves. ')
Position.create(name: 'MONITOR-TRANSITION STAFF',training:1, shadowing:3,desc:'Probably a monitor who strikes the party, but we\'re not sure.')
Position.create(name: 'Intro-Teacher',training:1, shadowing:0,desc:'Tell people the rules of CSPC. Try to not talk past 6:30 on Tuesday evening.')
Position.create(name: 'Intro-Cashier',training:1, shadowing:0,desc:'Deal with the paperwork for newbies.')
Position.create(name: 'Intro-Ambassador',training:1, shadowing:0,desc:'Ambassador the newbies.')
Position.create(name: 'Greeter',training:1, shadowing:0,desc:'Sort of like Ambassador but probably closer to the door. ')
Position.create(name: 'Non-Event:Parking Lot',training:1, shadowing:0,desc:'Keep it cleaned up, as much as one can for a property that has about a dozen people telling you what to do. ')
Position.create(name: 'Non-Event: Costo Prep',training:1, shadowing:0,desc:'Go to Costco')
Position.create(name: 'Non-Event: Costco Intake',training:1, shadowing:0,desc:'put away groceries and sundries from Costco.')
Position.create(name: 'Kitchen Assistant',training:1, shadowing:0,desc:'Assist with food prep')
Position.create(name: 'Kitchen Cleanup',training:1, shadowing:0,desc:'throw away the ranch dip that no one ate. wash the dishes and put them away.')
Position.create(name: 'DJ',training:1, shadowing:0,desc:'Plug in your iPod, load Pandora, go.')
Position.create(name: 'Door Staff',training:1, shadowing:0,desc:'Stand by the door')
Position.create(name: 'Grind Staff',training:1, shadowing:0,desc:'Who even knows')
Position.create(name: 'Transition',training:1, shadowing:0,desc:'Basically you\'re strike. ')
Position.create(name: 'Workshop-Cashier',training:1, shadowing:0,desc:'Most people pay in advance.')
Position.create(name: 'Workshop-EC',training:1, shadowing:0,desc:'check the checklists, hand out surveys afterward')
Position.create(name: 'Chef',training:1, shadowing:0,desc:'cook your ass off')
Position.create(name: 'Facilitator',training:1, shadowing:0,desc:'combo of ambassador and monitor')
Position.create(name: 'Service Facilitator',training:1, shadowing:0,desc:'keep the servers in line')

Role.create(name: "vcd", desc: "Volunteer Core Director")
Role.create(name: "dir", desc: "Director")
Role.create(name: "dir_asst", desc: "Director Assistant")
Role.create(name: "team_lead", desc: "Team Lead")
Role.create(name: "champion", desc: "Champion")
Role.create(name: "ec", desc: "Event Coordinator")

User.create!(id: 1, username: "Admin", email: "admin@example.com", member_number: "1", password: "password")
User.create!(id: 2, username: "DeeLiz", email: "gcdenise@yahoo.com", member_number: "14074", password: "testing1")

u = User.find(1)
u.add_role(:dir)

u = User.find(2)
u.add_role(:champion)
u.add_role(:ec)

ec = Position.find_by_name("Event Coordinator")
Qualification.create(user_id: 2, position_id: ec.id, status: "Good", count: 392)

Calendar.create(id: 1, name: "CSPC", description: "Calendar for the Center for Sex Positive Culture in Seattle, WA.", color: "#8911d9")
Calendar.create(id: 2, name: "FSPC", description: "Calendar for the Foundation for Sex Positive Culture in Seattle, WA.", color: "#940a3b")

Event.create(
  name: "Rough and Tumble Dojo",
  abbv: "RnT",
  open_time: "18:00:00",
  duration: 360,
  default_location: 1,
  calendar_id: 1,
  schedule_yaml: "---
:start_time: 2015-09-05 18:00:00.000000000 -07:00
:start_date: 2015-09-05 18:00:00.000000000 -07:00
:rrules:
- :validations:
    :day_of_week:
      1:
      - 2
  :rule_type: IceCube::MonthlyRule
  :interval: 1
:rtimes: []
:extimes: []
")

Location.create(name: "Main Space", description: "The main space of the Center for Sex Positive Culture.")

Shift.create(start: "18:00", duration: "360") # starts at 6pm, 6 hours long, ends at midnight
Shift.create(start: "18:00", duration: "180") # starts at 6pm, 3 hours long, ends at 9pm
Shift.create(start: "21:00", duration: "180") # starts at 9pm, 3 hours long, ends at midnight

Staff.create(event_id: 1, position_id: ec.id, shift_id: 1, permanent_user: 2) # all shift EC
Staff.create(event_id: 1, position_id: 1, shift_id: 2, permanent_user: "")  # first shift cashier
Staff.create(event_id: 1, position_id: 1, shift_id: 3, permanent_user: "")  # second shift cashier

rnt = Event.find(1)
Schedule.create(date: rnt.recurring_schedule.next_occurrence(), location_id: 1, staff_id: 1)  

Offer.create(user_id: 2, schedule_id: 1, accepted: 1, accepted_timestamp: "2015-09-20 18:02:00 -07:00", accepted_user_id: 1)
s = Schedule.find(1)
s.offer_id = 1
s.save
