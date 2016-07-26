class UserAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user)
    user.is_admin?
  end

  def self.deletable_by?(user)
    user.is_admin?
  end

  def self.updatable_by?(user)
    user.is_admin?
  end

  def updatable_by?(user)
    resource == user || user.is_admin?
  end
end
