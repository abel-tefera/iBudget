class ExpensesController < ApplicationController
  before_action :set_group, only: %i[new create destroy]
  before_action :set_expense, only: %i[destroy]
  before_action :authenticate_user!

  def new
    @expense = Expense.new(group_ids: [params[:group_id]])
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.author_id = current_user.id

    @expense.name = @expense.name.capitalize

    if @expense.save
      redirect_to "/groups/#{params[:group_id]}", notice: 'Transaction was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to "/groups/#{params[:group_id]}", notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, group_ids: [])
  end
end
