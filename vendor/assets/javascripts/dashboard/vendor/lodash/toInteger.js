var toFinite=require("./toFinite");function toInteger(t){var e=toFinite(t),r=e%1;return e==e?r?e-r:e:0}module.exports=toInteger;