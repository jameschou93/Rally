class GroupsController < ApplicationController
  
  before_action :authenticate!, except: [:index, :show]
  
  def mygroups
    @groups = Group.all
    render "ang_index.html"
  end

  def index
    @groups = Group.all
  end
 
  def show
    @group = Group.find_by(id: params[:id])

    if UserGroup.where(user_id: current_user.id, group_id: @group.id, admin: true) != []
      @admin = true
    else
      @admin = false
    end

    if @group.private? && @group.users.include?(current_user) == false
      redirect_to "/groups"
    end
  end

  def new
   @categories = Category.all
   @group = Group.new
  end

  def create
    group = Group.new(name: params[:group_name], bio: params[:bio], private?: params[:private?])
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
    group.update(name: params[:name], bio: params[:bio])

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
    group = Group.find_by(id: params[:id])
    group.delete
  end

  def add_member
    group = Group.find_by(id: params[:id])
    UserGroup.create(group_id: params[:id], user_id: current_user.id)
    redirect_to "/groups/#{group.id}"
  end
end
