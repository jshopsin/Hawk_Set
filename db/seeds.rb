u = User.create!(username: "jen", email: "jen@jen.com", password: "password")

Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)
Card.create!(shape: "oval", color: "red", shade: "solid", number: 1)

g = u.games.create!


# g.assignments.where(card_status: "in_play").each do |assignment|
#   assignment.card
# end
