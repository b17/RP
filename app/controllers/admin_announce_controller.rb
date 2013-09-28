class AdminAnnounceController < ApplicationController
  layout 'superuser'

  before_filter do
    user_has_role :admin
  end

  def view
    search = params[:search]
    id = search[:id]
    search_text = search[:text]

    unless  id.nil?
      @id_item=Announce.find id.to_i
    end

    unless search_text.nil?
      @text_items=Announce.where(:title => "%#{search_text}%")
    end
  end

  def search

  end
end
