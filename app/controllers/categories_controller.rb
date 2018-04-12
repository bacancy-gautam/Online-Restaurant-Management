# Controller for Categories of Food and Restaurant  
class CategoriesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_category, only: %i[show edit update destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # after_action :verify_authorized, except: :index
  # after_action :verify_policy_scoped, only: :index

  def new
    @category = Category.new
    authorize Category, :new?
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      @categories = Category.all
      respond_to do |format|
        format.html do
          render(partial: 'categorylist')
        end
        format.js
      end
    else
      render 'new'
    end
  end

  def show; end

  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.js
    end
    # @categories = policy_scope(Category)
    # authorize Category
  end

  def edit
    @category = Category.find(params[:id])
    authorize Category, :edit?

  end

  def update
    if @category.update(category_params)
      @categories = Category.all
      respond_to do |format|
        format.html do
          render(partial: 'categorylist')
        end
        format.js
      end
      # redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    authorize Category, :destroy?
    @categories = Category.all
    respond_to do |format|
      format.html do
        render(partial: 'categorylist')
      end
      format.js
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
