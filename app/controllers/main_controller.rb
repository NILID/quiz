class MainController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def audit
    authorize :main, :audit?
    @pagy, @audits = pagy(Audit.order(created_at: :desc))
  end
end
