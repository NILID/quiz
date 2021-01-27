class Audit < Audited::Audit

  def output
    name =
      case auditable_type
      when 'Question' then auditable&.title
      when 'User'     then auditable&.email
      end
    [I18n.t("activerecord.models.#{auditable_type.downcase}"), 'with id =', auditable_id, name].join(' ')
  end

end
