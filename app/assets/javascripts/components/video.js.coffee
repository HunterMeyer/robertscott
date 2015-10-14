@Video = React.createClass
  render: ->
    React.DOM.div
      className: 'col l4 m8 offset-m2 s12'
      React.DOM.div
        className: 'card'
        React.DOM.div
          className: 'card-image waves-effect waves-block waves-light'
          React.DOM.img
            src: @props.video.thumb_url
            className: 'activator'
        React.DOM.div
          className: 'card-content'
          React.DOM.span
            className: 'card-title activator grey-text text-darken-4'
            React.DOM.span
              className: 'truncate inline-block',
              @props.video.title
            React.DOM.i
              className: 'mdi-navigation-more-vert right'
        React.DOM.div
          className: 'card-reveal'
          React.DOM.div
            className: 'card-title grey-text text-darken-4'
            React.DOM.span
              className: 'truncate inline-block',
              @props.video.title
            React.DOM.i
              className: 'mdi-navigation-close right'
          React.DOM.a
            href: '#video-modal',
            className: 'waves-effect waves-light btn red white-text modal-trigger',
            'data-video-id': @props.video.video_id,
            'data-video-title': @props.video.title,
            React.DOM.i
              className: 'fa fa-youtube-play',
            ' Play'
          React.DOM.p null, @props.video.description
