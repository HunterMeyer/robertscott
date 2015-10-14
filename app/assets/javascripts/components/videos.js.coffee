@Videos = React.createClass
  getInitialState: ->
    videos: @props.data
  getDefaultProps: ->
    videos = []
  render: ->
    React.DOM.div
      className: 'row'
      for video in @state.videos
        React.createElement Video, key: video.id, video: video
