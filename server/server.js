const express = require("express")
const cors = require("cors")
const app = express()
const port = 8000

app.use(cors())
app.use(express.json(),express.urlencoded({extended:true}))
require('./routes/openai.routes')(app)

app.listen(port,()=>console.log(`Server is running on port ${port}`))