class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_role_allowed? || user.role = 'admin'
  end

  def new?
    true
  end

  def create?
    true
  end

  private

  def user_role_allowed?
    record.user == user
  end
end
