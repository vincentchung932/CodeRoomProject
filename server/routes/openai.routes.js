const OpenAIController = require("../controller/openai.controller")

module.exports = function(app){
    app.get("/api/openai/test",OpenAIController.test)
    app.post("/api/openai/gettimecomplx",OpenAIController.getTimeComplx)
    app.post("/api/openai/largecall",OpenAIController.largecall)
    app.post("/api/openai/anything",OpenAIController.anything)
}