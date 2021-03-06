# Getting started

Project was tested on ruby 1.9.3 and rails 3.2.14.

For Ubuntu-based systems you need to install <code>libmagickwand-dev</code> for rmagick to work.

# Search Provider

## Search Layer

The main purposes of Search Layer are performing search queries and building filters.

The flow is:
1) Translate request into search params.
2) Apply search options to collection.
3) Build filters related to search options.

### Translate request into search params

```ruby
params[:distance] ||= 1000 # distance in meters (THIS IS AN EXAMPLE)
params[:latitude] = session[:latitude] # current coords for GeoDistanceProvider
params[:longitude] = session[:longitude] # current coords for GeoDistanceProvider
search_criteria = layer_news.bind params
```

<code>search_criteria</code> - hash of internal search params.

This hash can be stored in database for RSS, bookmarks or others.

### Apply search options to collection

ThinkingSphinx uses hash as query options. So SearchLayer translates <code>search_criteria</code> into ThinkingSphinx query options.

```ruby
sphinx_criteria = layer_news.apply search_criteria
```

<code>sphinx_criteria</code> will look like:

```
{:geo=>[0.0, 0.0], :with=>{:geodist=>0.0..1000.0}}
```

After you get sphinx criteria, you can apply custom orders and limits, for example:

```ruby
sphinx_criteria[:order] = 'geodist ASC'
```

And then fetch matched items from database:

```ruby
@items = Announce.search '', sphinx_criteria
```

### Build filters related to search options.

Todo

### Writing custom provider

The interface for SearchProvider is:

```ruby
class Search::Provider

  def bind(params, search_criteria)
  end

  def apply(query, search_criteria)

  end

  def filters(where, search_criteria, filters_collection)

  end

  def unbind(params, search_criteria)
  end
end
```

#### <code>def bind(params, search_criteria)</code>

fetches requested filter value from <code>params</code> and stores it into <code>search_criteria</code>.

#### <code>def apply(query, search_criteria)</code>

tests if required param is in <code>search_criteria</code> and then applies it on <code>query</code>.

#### <code>def filters(where, search_criteria, filters_collection)</code>

Adds filter.

<code>where</code> - current sphinx query
<code>search_criteria</code> - active search params.
<code>filters_collection</code> - filters collection, new filter should be added to collection.

