class MasterOrdersController < ApplicationController
  def new
  	@master_order=MasterOrder.new
  end
  def create
  	@master_order=MasterOrder
  end
  def index
  end

  def edit
  end

  def show
  end
end
