class Audit < Audited::Audit

  def output
    name =
      case auditable_type
      when 'Question' then auditable&.title
      when 'User'     then auditable&.email
      end
    [created_at, user&.login, action, auditable_type, 'with id =', auditable_id, name].join(' ')
  end

end
