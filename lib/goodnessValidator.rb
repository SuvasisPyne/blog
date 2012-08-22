class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.name == "evil"
      record.errors.add(:name, "is evil? Are you necessary Evil")
    end
  end
end
