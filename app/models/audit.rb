class Audit < Audited::Audit
  MODELS = %w[Answer Question Round Result Theme User].freeze

  def output
    name =
      case auditable_type
      when 'Result', 'Round' then nil
      when 'Question'        then auditable&.title
      when 'User'            then auditable&.email
      else
        auditable&.title
      end
    [I18n.t("activerecord.models.#{auditable_type.downcase}"), 'ID #', auditable_id, name].join(' ')
  end

end
