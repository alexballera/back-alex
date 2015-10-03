module PermissionsConcern
  extended ActiveSupport::Concern

  def is_user?
    self.permission_level >= 1
  end

  def is_asistant?
    self.permission_level >= 2
  end

  def is_admin?
    self.permission_level >= 1
  end
end