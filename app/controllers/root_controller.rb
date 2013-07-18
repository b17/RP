class RootController < ApplicationController
  def feed

  end

  def tag
    @tag_name= get_tag_name request.params[:id]
  end

  def all_tags
    #@tags=nil
  end

  def rand
    #@random_list=get_rand
  end

  def get_tag_name id
    #feetch from the base
    'fruits'
  end
end

