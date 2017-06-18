sequencer = require './sequence'

module.exports = =>
    # prevent node from exiting
    setInterval((->), 10000)

    result =
        sequence: -> sequencer(result)

    return result
