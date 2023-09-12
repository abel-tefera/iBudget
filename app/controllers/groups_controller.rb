class GroupsController < ApplicationController
  before_action :set_group, only: %i[show destroy]
  # before_action :authenticate_user!

  def index
    # @groups = Group.where(author_id: current_user.id).includes(:expenses).order('created_at DESC')
    @groups = Group.where(author_id: current_user.id).order('created_at DESC')
  end

  def new
    @group = Group.new
  end

  def show
    # if current_user.id.to_i == Group.find(params[:id]).author_id.to_i
    # @group = Group.find(params[:id])
    # else
    # redirect_to '/'
    # end
  end

  def create
    @group = Group.new(group_params)
    @group.name = @group.name.capitalize
    @group.author_id = current_user.id

    if @group.save
      redirect_to groups_url, notice: 'Category was successfully created'
    else
      render :new, status: :unprocessable_entity, alert: 'An error has occurred while creating'
    end
  end

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
