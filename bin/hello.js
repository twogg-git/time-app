const http = require('http');
 
const host = '';
const port = 8080;
 
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Time App - Hello buuuu!!!');
});
 
server.listen(port, host, () => {
   console.log('Web server running at http://%s:%s',host,port );
});
