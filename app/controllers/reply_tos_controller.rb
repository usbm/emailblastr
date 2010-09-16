class ReplyTosController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!
  
  def create
    create! { reply_tos_path }
  end
  def update
    update! { reply_tos_path }
  end
  
  protected
  
  def begin_of_association_chain
    current_user
  end
end