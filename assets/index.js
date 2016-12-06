'use strict';

require('ace-css/css/ace.css');
require('font-awesome/css/fomt-awesome.css');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

var app = Elm.Main.embed(mountNode);
