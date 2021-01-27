class MainController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    authorize :main, :index?
    @themes = Theme.order(:title)
  end

  def audit
    authorize :main, :audit?
    @pagy, @audits = pagy(Audit.includes(:user, :auditable).order(created_at: :desc))
  end
end
