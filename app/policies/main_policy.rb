class MainPolicy < Struct.new(:user, :main)
  def audit?
    user && user.admin?
  end
end
