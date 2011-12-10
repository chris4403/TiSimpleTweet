// open a single window
var window = Ti.UI.createWindow({
    backgroundColor:'white'
});
window.open();

// TODO: write your module tests here
var simpletweet = require('com.chrisryu.simpletweet');
Ti.API.info("module is => " + simpletweet);

simpletweet.showTweetWindow('hoge');

