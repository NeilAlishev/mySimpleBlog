class ApplicationPolicy
  attr_reader :user, :record
  private :user, :record

  def initialize(user, record)
    @user = user
    @record = record.to_model
  end
end
