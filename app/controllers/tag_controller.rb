class TagController < ApplicationController
  layout 'superuser'

  def p_all
    @all_tags= Tag.where(:disabled => false)
    @disabled= Tag.where(:disabled => true)
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
    if is_administrator
      id=params[:id]
      tag_find = Tag.find id
      unless  tag_find.nil?
        tag_find.update_attribute(:disabled, true)
        redirect_to :back
      end
    else
      redirect_to :fail_permissions
    end

  end


  def c_delete
    if is_administrator
      id=params[:id]
      tag_find = Tag.find id
      unless  tag_find.nil?
        tag_find.disabled=true
        tag_find.delete
        redirect_to :back
      end
    else
      redirect_to :fail_permissions
    end

  end

  def p_edit
  end

  def c_tag_update

  end

  def c_activate
    if is_administrator
      id=params[:id]
      tag_find = Tag.find id
      tag_find.disabled=false
      tag_find.save
      redirect_to :back
    else
      redirect_to :fail_permissions
    end

  end

end
