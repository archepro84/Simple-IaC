const express = require('express')
const ip = require('ip')
const app = express();
const port = 3000;

app.use(express.urlencoded({extended: false}));
app.use(express.json());

app.get('/', async (req, res) => {
  try {
    res.status(200).json({privateIp: ip.address()})
  } catch (error) {
    return res.status(400).json({error})
  }
})


app.listen(port, () => {
  console.log(`server Start ${port}`);
})