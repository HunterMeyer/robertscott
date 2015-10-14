@Player = React.createClass
  render: ->
    React.DOM.div
      className: 'modal bottom-sheet'
      id: 'video-modal'
      React.DOM.div
        className: 'right-align modal-links'
        React.DOM.a
          className: 'waves-effect waves-red btn-flat red-text modal-yt-link play-lg',
          href: '',
          'Play on YouTube'
        React.DOM.a
          className: 'modal-action modal-close waves-effect waves-grey btn-flat',
          href: '#!',
          'Close'
        React.DOM.a
          className: 'waves-effect waves-red btn-flat red-text modal-yt-link play-sm',
          href: '',
          'Play on YouTube'
      React.DOM.div
        className: 'modal-content'
        React.DOM.div
          className: 'video-container'
          React.DOM.iframe
            width: '100%',
            height: '480',
            src: '',
            id: 'video-player'
            frameBorder: '0'
            allowFullScreen: 'true'
