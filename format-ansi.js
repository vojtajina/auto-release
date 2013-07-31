#!/usr/bin/env node

var fs = require('fs');

var colors = {
  '4': 'text-decoration: underline',
  '31': 'color: red',
  '32': 'color: green',
  '33': 'color: orange'
};

// TODO(vojta): stream it
fs.readFile(process.argv[2], function(err, content) {
  var result = content.toString().replace(/\[(\d+)m/g, function(match, code) {
    if (code === '24' || code === '39') {
      return '</span>';
    }
    return '<span style="' + colors[code] + '">';
  }).replace(/\#+\n([^\n]+)\n\#+/g, function(match, title) {
    return '<hr style="margin-top:10px"><strong>' + title + '</strong>';
  }).replace(/\n/g, '<br>\n');

  console.log(result);
});
