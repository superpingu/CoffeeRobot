# CoffeeRobot #

This library provides high-level control over a Raspberry Pi-controlled robot,
in javascript with nodeJS.

## Install ##

just add coffeerobot to your node project using :

```
npm install @superpingu/coffeerobot
```

## Usage ##

First create the robot with

```javascript
var robot = require("@superpingu/coffeerobot")();
```

### Sequence ###

To make complex action programming easier, it is possible to create sequences of
instruction, that will executed automatically.

Here is a simple example :

```javascript
// two AX12 are connected to the robot
robot.xAxis = robot.ax12(140);
robot.yAxis = robot.ax12(141);

var seq = robot.sequence()
     .xAxis.moveTo(-50)
     .yAxis.moveTo(90)
     .then() // wait until the actions are completed before going on
     .xAxis.moveTo(0)
     .then() // wait until the actions are completed before going on
     .yAxis.moveTo(-90);

// a callback can be called when the sequence has been fully executed
seq.done(function() { console.log("sequence finished !") });

// execute the sequence
seq.start();
```

#### robot.sequence() ####
Returns a new empty sequence. All functions in the robot object when this function
is called will be available in the returned sequence.

#### sequence.then() ####
Wait for all the previous actions to be completed before going on.
Returns the sequence (is chainable).

#### sequence.run() ####
Run a function in the sequence. If the function calls a callback after completing
its task, its only argument should be named exactly 'callback'.

For example :

```javascript
var seq = robot.sequence().run(function(callback) { /* ... */ })
    .then()
    /* ... */
    .start();
```

Returns the sequence (is chainable).

#### sequence.done(callback) ####
Set up a function called when the sequence is fully executed.  
Returns the sequence (is chainable).

#### sequence.start(callback) ####
Start a sequence from the beginning. A sequence can be executed several times.  
**callback** : a function to be called when the sequence is fully executed.
Returns the sequence (is chainable).

#### sequence.stop() ####
Stop sequence execution.

#### sequence.create() ####
Returns a new sequence starting with the sequence it is created from.
