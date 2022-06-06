const http = require('http');
 
const host = '0.0.0.0';
const port = process.env.PORT || 80
 
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Testing and app!!!');
});
 
server.listen(port, host, () => {
   console.log('Web server running at http://%s:%s',host,port );
});
