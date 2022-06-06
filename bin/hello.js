const http = require('http');
 
const host = '0.0.0.0';
// var server = app.listen(PORT, function() {
//   var host = server.address().address;
//   var port = server.address().port;
//   console.log("server is listening at http://%s:%s", host, port);
// });
const port = process.env.PORT || 80
 
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Time App - Hello buuuu!!!');
});
 
server.listen(port, host, () => {
   console.log('Web server running at http://%s:%s',host,port );
});
