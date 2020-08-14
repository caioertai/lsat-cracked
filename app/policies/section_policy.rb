class SectionPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end