class Audit < Audited::Audit

  def output
    case auditable_type
    when 'Question'
      if auditable
        [created_at, user.email, action, auditable_type, 'with id =', auditable_id, auditable.title].join(' ')
      else
        [created_at, user.email, action, auditable_type, 'with id =', auditable_id].join(' ')
      end
    when 'User'
      [created_at, user, action, auditable_type, 'with id =', auditable_id, auditable.email].join(' ')
    end
  end

end
