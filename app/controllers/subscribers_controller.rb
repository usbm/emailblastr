class SubscribersController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!
  belongs_to :list
  
  def create
    create! { list_subscribers_path(@list) }
  end
  def update
    update! { list_subscribers_path(@list) }
  end
  
  protected
  
  def begin_of_association_chain
    current_user
  end
end
