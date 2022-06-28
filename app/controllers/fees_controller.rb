class FeesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @title = 'New Transaction'
  end

  def create
    @fee = Fee.new(fee_params)
    @group = Group.find(params[:fee][:group_id])
    if @fee.save
      @group.group_fees.create(fee_id: @fee.id)
      redirect_to group_url(@group)
    else
      render :new
    end
  end

  private

  def fee_params
    params.require(:fee).permit(:name, :amount, :user_id)
  end
end
