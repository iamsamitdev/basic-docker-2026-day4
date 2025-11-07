const express = require('express')
const app = express()

// ทำ url ให้สามารถเข้าถึงได้
app.get('/', (req, res) => {
  res.send('Hello World! 888')
})


// run the server
app.listen(3000, () => {
  console.log('Server is running on http://localhost:3000')
})