class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def my_bookings?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def delete?
    record.user == user
  end
end
