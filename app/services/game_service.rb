class GameService
  def initialize(params)
    @invitation = Invitation.find(params[:invitation_id])
  end

  def create
    # TODO: Better to put it inside a transaction
  end
end
