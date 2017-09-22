class CardSetsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])

    respond_to do |format|
      format.html { redirect_to game_path(@game) }
      format.json {
        card1 = Card.find_by(image_url: (params["cards"]["c1"].downcase.split(" ").join("_") + ".png"))
        card2 = Card.find_by(image_url: (params["cards"]["c2"].downcase.split(" ").join("_") + ".png"))
        card3 = Card.find_by(image_url: (params["cards"]["c3"].downcase.split(" ").join("_") + ".png"))

        cards = [card1, card2, card3]

        if @game.match(cards)

          new_card_set = CardSet.create!()

          cards_in_new_set = []

          cards.each do |card|
            Assignment.find_by_card_id_and_game_id(card.id, @game.id).update(card_status: "in_set", card_set_id: new_card_set.id)
          end

          deck = @game.assignments.remaining

          new_cards = deck.sample(3)

          new_cards.each do |assignment|
            assignment.update(card_status: "in_play")
          end

          new_cards_json = {
            "1": "<img src='../assets/#{new_cards[0].card.image_url}' alt='#{new_cards[0].card.image_url.split(".").first.split("_").join(" ")}'>",
            "2": "<img src='../assets/#{new_cards[1].card.image_url}' alt='#{new_cards[1].card.image_url.split(".").first.split("_").join(" ")}'>",
            "3": "<img src='../assets/#{new_cards[2].card.image_url}' alt='#{new_cards[2].card.image_url.split(".").first.split("_").join(" ")}'>",
            "set_1": "<img src='../assets/#{params['cards']['c1'].downcase.split(' ').join('_')}' alt='#{params["cards"]["c1"]}'>",
            "set_2": "<img src='../assets/#{params['cards']['c2'].downcase.split(' ').join('_')}' alt='#{params["cards"]["c2"]}'>",
            "set_3": "<img src='../assets/#{params['cards']['c3'].downcase.split(' ').join('_')}' alt='#{params["cards"]["c3"]}'>"
          }

          @response = new_cards_json.to_json

          render json: @response
        else
          redirect_to game_path(@game.id)
          flash.notice = 'Not a valid set'
        end
      }
    end
  end

end
