class Access::Provider
  def initialize
    @roles = {}
  end

  def get (name)
    @roles[name]
  end

  def << role
    @roles[role.name] = role
  end
end