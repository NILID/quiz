class MainController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  after_action :verify_authorized,   except: [:index]

  def index; end

  def audit
    authorize :main, :audit?
    @pagy, @audits = pagy(Audit.order(created_at: :desc))
  end
end
