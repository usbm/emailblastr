class AutorespondersController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!
  belongs_to :list

  protected

  def begin_of_association_chain
    current_user
  end
end