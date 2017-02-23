class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by(id: params[:id])
  end

  def new
   @categories = Category.all
   @group = Group.new
  end

  def create
    group = Group.new(name: params[:group_name])
    if group.save
      if params[:group_categories]
        params[:group_categories][:category_ids].each do |cat_id|
        GroupCategory.create(group_id: group.id, category_id: cat_id)
        end
        admin = UserGroup.create(group_id: group.id,
                          user_id: current_user.id,
                          admin: true)
        redirect_to "/groups/#{group.id}"
      end
    else
      flash[:error] = "#{group.errors.full_messages.first}"
      redirect_to "/groups/new"
    end
  end

  def edit
    @group = Group.find_by(id: params[:id])
    @categories = Category.all
  end

  def update
    group = Group.find_by(id: params[:id])
    group.update(name: params[:name])

    # delete all categories
    categories = GroupCategory.where(group_id: group.id)
    categories.each do |category|
      category.delete
    end

    # create new categories
    params[:group_categories][:category_ids].each do |cat_id|
      GroupCategory.create(group_id: group.id, category_id: cat_id)
    end
    redirect_to "/groups/#{group.id}"
  end

  def destroy
    
  end
end
