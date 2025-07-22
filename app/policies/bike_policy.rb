class BikePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    user.present?
  end

  def show?
    record.user == user
  end

  def index?
    record.user == user
  end

  def update?
    record.user == user
  end
end
