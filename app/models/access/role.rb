class Access::Role

  attr_reader :name

  def initialize(name)
    @child = []
    @name = name
  end

  def extends role
    @child.push role
  end

  def has_role(name)
    if @name == name
      true
    else
      found = false
      @child.each do |child|
        if child.has_role name
          found = true
          break
        end
      end
      found
    end
  end
end