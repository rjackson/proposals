module Api
  class ProposalsController < ApplicationController
    respond_to :json

    def index
      respond_with current_round.proposals,
        each_serializer: ProposalSerializer,
        current_round: current_round
    end
  end
end
