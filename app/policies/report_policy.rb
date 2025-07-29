class ReportPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    record.match.bike.user == user
  end

  def create?
    record.match.bike.user == user
  end

  def show?
    Rails.logger.debug "=== Pundit DEBUG ==="
    Rails.logger.debug "User: #{user.id}"
    Rails.logger.debug "Report ID: #{record.id}"
    Rails.logger.debug "Match user ID: #{record.match.bike.user.id}"

    record.match.bike.user == user
  end

  def index?
    record.match.bike.user == user
  end

  def email?
    record.match.bike.user == user
  end
end
