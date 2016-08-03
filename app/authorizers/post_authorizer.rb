class PostAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user)
    user.is_admin?
  end

  def self.deletable_by?(user)
    user.is_admin?
  end

  def self.updatable_by?(user)
    user.is_admin?
  end
end
