class TagController < ApplicationController
  layout 'superuser'

  def p_all
    @all_tags= Tag.where(:disabled => false)
  end

  def p_add
  end

  def c_save
    name = params[:name]
    image = params[:image]

    if name.nil?||image.nil?

    else
      tag = Tag.new
      tag.name=name
      tag.image= image
      tag.save
      redirect_to :manage_tags
    end
  end

  def c_disable
  end

  def c_delete
  end

  def p_edit
  end

  def c_update

  end

  def c_activate

  end
end
