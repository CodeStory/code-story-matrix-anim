express = require('express')
app = express()
port = 4000

app.use(express.static(__dirname))
app.listen(port)
console.log("listening on port #{port}")