class Search::Announce::Paginate::LinkRenderer < BootstrapPagination::Rails
  def url(page)

    params = @template.controller.request.parameters.clone
    params.delete :controller
    params.delete :action

    add_current_page_param(params, page)

    Rails.application.routes.url_helpers.announce_search_path params
  end
end