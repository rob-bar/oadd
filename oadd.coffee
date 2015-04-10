if Meteor.isClient
  Template.tabs.onRendered ->
    @.$('.accordion-tabs').each (i, el) ->
      $(el)
        .children('li')
        .first()
        .children('a')
        .addClass('is-active')
        .next()
        .addClass('is-open')
        .show()

  Template.tabs.events
    'click .accordion-tabs li > a': (e) ->
      unless $(e.currentTarget).hasClass 'is-active'
        e.preventDefault()
        accordionTabs = $(e.currentTarget).closest('.accordion-tabs')
        accordionTabs.find('.is-open').removeClass('is-open').hide()
        $(e.currentTarget).next().toggleClass('is-open').toggle()
        accordionTabs.find('.is-active').removeClass 'is-active'
        $(e.currentTarget).addClass 'is-active'
      else
        e.preventDefault()

  Template.header.onRendered ->
    @.$('#js-mobile-menu').unbind();
    @.$('#js-navigation-menu').removeClass("show");

  Template.header.events
    'click #js-mobile-menu': (e) ->
      do e.preventDefault
      $('#js-navigation-menu').slideToggle ()->
        if $('#js-navigation-menu').is ':hidden'
          $('#js-navigation-menu').removeAttr 'style'



if Meteor.isServer
  Meteor.startup ->
