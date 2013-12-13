#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require handlebars
#= require ember
#= require ember-data
#= require vendor
#= require_self
#= require_tree ./lib
#= require hummingbird

# Initialize fastclick.
$ ->
  new FastClick(document.body)

# Plural of anime is anime.
Ember.Inflector.inflector.rules.uncountable['anime'] = true

# Used for redirecting after log in.
window.lastVisitedURL = '/'
unless window.location.href.match('/sign-in')
  window.lastVisitedURL = window.location.href

$("#ember-root").html("")

@Hummingbird = Ember.Application.create
  rootElement: "#ember-root"

  TitleManager: Ember.Object.extend(
    title: null

    setTitle: (title) ->
      @set 'title', title

    setPageTitle: (->
      if @get("title")
        document.title = @get("title") + " | Hummingbird"
      else
        document.title = "Hummingbird"
    ).observes('title').on('init')
  ).create()
