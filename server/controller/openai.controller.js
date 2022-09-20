const OpenAI = require('openai-api');

// Load your key from an environment variable or secret management service
// (do not include your key directly in your code)
const OPENAI_API_KEY = "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";

const openai = new OpenAI(OPENAI_API_KEY);


module.exports.test=(req,res)=>{
    (async () => {
        const gptResponse = await openai.complete({
            engine: 'davinci',
            prompt: 'this is a test',
            maxTokens: 5,
            temperature: 0.9,
            topP: 1,
            presencePenalty: 0,
            frequencyPenalty: 0,
            bestOf: 1,
            n: 1,
            stream: false,
            stop: ['\n', "testing"]
        });
    
        console.log(gptResponse.data);
        return gptResponse.data;
    })().then(result=>res.json(result));
}


module.exports.getTimeComplx=(req,res)=>{
    // const {prompt} = req.body
    // console.log(req.body)
    (async() =>{
        console.log(req.body.prompt)
        const gptResponse = await openai.complete({
            engine: 'text-davinci-002',
            prompt: req.body.prompt,
            temperature: 0.1,
            max_tokens: 80,
            bestOf: 1,
            top_p: 1.0,
            frequency_penalty: 0.0,
            presence_penalty: 0.0,
            stop: ["\n"],
          });
          console.log(gptResponse.data)
          return gptResponse.data;
    })().then(result=>res.json(result));

}


module.exports.largecall=(req,res)=>{
    // const {prompt} = req.body
    // console.log(req.body)
    (async() =>{
        console.log(req.body.prompt)
        const gptResponse = await openai.complete({
            engine: 'text-davinci-002',
            prompt: req.body.prompt,
            temperature: 0.1,
            max_tokens: 1000,
            bestOf: 1,
            top_p: 1.0,
            frequency_penalty: 0.0,
            presence_penalty: 0.0,
            stop: ["\n"],
          });
          console.log(gptResponse.data)
          return gptResponse.data;
    })().then(result=>res.json(result));

}



module.exports.anything=(req,res)=>{
    // const {prompt} = req.body
    // console.log(req.body)
    (async() =>{
        console.log(req.body.prompt)
        const gptResponse = await openai.complete({
            engine: 'text-davinci-002',
            prompt: req.body.prompt,
            temperature: 0.1,
            max_tokens: 1500,
            bestOf: 1,
            top_p: 1.0,
            frequency_penalty: 0.0,
            presence_penalty: 0.0,
          });
          console.log(gptResponse.data)
          return gptResponse.data;
    })().then(result=>res.json(result));

}
