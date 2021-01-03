# solution for the future sufferers which come across this page.
#
# see link: https://github.com/varvet/pundit/issues/339#issuecomment-449454629

module PunditSpecHelper
  def enable_pundit(view, user)
    without_partial_double_verification do
      allow(view).to receive(:policy) do |record|
        Pundit.policy(user, record)
      end
    end
  end
end