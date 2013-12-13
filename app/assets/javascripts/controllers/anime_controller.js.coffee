Hummingbird.AnimeController = Ember.ObjectController.extend
  activeTab: "Genres"
  language: null

  showGenres: (-> @get('activeTab') == "Genres").property('activeTab')
  showFranchise: (-> @get('activeTab') == "Franchise").property('activeTab')
  showQuotes: (-> @get('activeTab') == "Quotes").property('activeTab')
  showStudios: (-> @get('activeTab') == "Studios").property('activeTab')
  showCast: (-> @get('activeTab') == "Cast").property('activeTab')

  coverImageStyle: (->
    "background: url('" + @get('model.coverImage') + "'); background-position: 50% -" + @get('model.coverImageTopOffset') + "px;"
  ).property('model.coverImage', 'model.coverImageTopOffset')

  roundedBayesianRating: (->
    if @get('model.bayesianRating')
      @get('model.bayesianRating').toFixed(2)
    else
      null
  ).property('model.bayesianRating')

  filteredCast: (->
    @get('model.featuredCastings').filterBy 'language', @get('language')
  ).property('model.featuredCastings', 'language')

  trailerPreviewImage: (->
    "http://img.youtube.com/vi/" + @get('model.youtubeVideoId') + "/hqdefault.jpg"
  ).property('model.youtubeVideoId')

  # Legacy -- remove after Ember transition is complete.
  fullQuotesURL: (-> "/anime/" + @get('model.id') + "/quotes").property('model.id')
  fullReviewsURL: (-> "/anime/" + @get('model.id') + "/reviews").property('model.id')
  newReviewURL: (-> "/anime/" + @get('model.id') + "/reviews/new").property('model.id')
  # End Legacy
