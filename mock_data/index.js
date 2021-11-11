const http = require('http');
const mockserver = require('mockserver');
const mocker = mockserver('./mocks');
const server = http.createServer(mocker);
const PORT = process.env.PORT | 9000;
server.listen(PORT, (req,res)=>{
  console.log(`Server listing on PORT: ${PORT}`);
})