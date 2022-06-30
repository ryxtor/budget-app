class GroupsController < ApplicationController
  load_and_authorize_resource
  # GET /groups or /groups.json
  def index
    @groups = current_user.groups
    @title = 'Categories'
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find(params[:id])
    @fees = @group.group_fees.map(&:fee_id)
    @fees = Fee.where(id: @fees).sort_by(&:created_at).reverse
    @total = @fees.inject(0) { |sum, fee| sum + fee.amount }
    @title = @group.name
  end

  # GET /groups/new
  def new
    @title = 'New Category'
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to '/', notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        redirect_to '/groups/new', notice: 'Group was not created.'
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
