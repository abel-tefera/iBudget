class GroupsController < ApplicationController
  before_action :set_group, only: %i[destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @groups = Group.includes(:expenses).where(user: current_user).order('created_at ASC')
  end

  def show
    @group = Group.includes(:expenses).order('expenses.created_at DESC').find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.name = @group.name.capitalize
    @group.user = current_user

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
