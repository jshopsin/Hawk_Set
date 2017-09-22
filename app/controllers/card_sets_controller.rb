class CardSetsController < ApplicationController
  def create
    game = Game.find(params[:game_id])

    respond_to do |format|
      format.html { redirect_to game_path(game) }
      format.json {
        card1 = Card.find_by(image_url: (params["cards"]["c1"].downcase.split(" ").join("_") + ".png"))
        card2 = Card.find_by(image_url: (params["cards"]["c2"].downcase.split(" ").join("_") + ".png"))
        card3 = Card.find_by(image_url: (params["cards"]["c3"].downcase.split(" ").join("_") + ".png"))

        cards = [card1, card2, card3]

        # if is_set?(cards)
        if cards.length == 3
          new_card_set = CardSet.create!()

          cards.each do |card|
            Assignment.find_by_card_id_and_game_id(card.id, game.id).update(card_status: "in_set", card_set_id: new_card_set.id)
          end

          deck = game.assignments.remaining

          new_cards = deck.sample(3)

          new_cards.each do |assignment|
            assignment.update(card_status: "in_play")
          end

          new_cards_json = {
            "0": "<%= image_tag #{new_cards[0].card.image_url} %>",
            "1": "<%= image_tag #{new_cards[1].card.image_url} %>",
            "2": "<%= image_tag #{new_cards[2].card.image_url} %>"
          }

          @response = new_cards_json.to_json

          render json: @response
        else
          redirect_to game_path(game.id)
          flash.now[:alert] = 'Not a valid set'
        end
      }
    end
  end

end
