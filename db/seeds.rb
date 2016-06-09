# 
#
#

catA = Category.create( name: "Kategorie A", code: "A" )
catB = Category.create( name: "Kategorie B", code: "B" )
catC = Category.create( name: "Kategorie C", code: "C" )
catD = Category.create( name: "Kategorie D", code: "D" )


(1..100).each do |number|
  code = 'A%03d' % number
  Contestant.create( name: "Teilnehmer #{code}", number: "#{code}", category: catA )
end

(1..100).each do |number|
  code = 'B%03d' % number
  Contestant.create( name: "Teilnehmer #{code}", number: "#{code}", category: catB )
end

(1..100).each do |number|
  code = 'C%03d' % number
  Contestant.create( name: "Teilnehmer #{code}", number: "#{code}", category: catC )
end

(1..100).each do |number|
  code = 'D%03d' % number
  Contestant.create( name: "Teilnehmer #{code}", number: "#{code}", category: catD )
end


judge1 = Judge.create( name: "Wertungsrichter 1" )
judge2 = Judge.create( name: "Wertungsrichter 2" )
judge3 = Judge.create( name: "Wertungsrichter 3" )
judge4 = Judge.create( name: "Wertungsrichter 4" )
judge5 = Judge.create( name: "Wertungsrichter 5" )
