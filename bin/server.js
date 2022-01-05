var express = require('express')
const path = require('path')
var app = express()
const PORT = 8088

app.use(express.static(path.join(__dirname, '../build/')))

app.get('/config', function(req, res){
  res.send(`env:${process.env.front_env}`);
});

app.listen(PORT, function () {
  console.log('The app server is work at ' + PORT)
})
