<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/dashboard.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script src="/codemirror/lib/codemirror.js"></script>
    <link href="/codemirror/lib/codemirror.css" rel="stylesheet"/>
    <script src="/codemirror/mode/xml/xml.js"></script>
    <script src="/codemirror/mode/javascript/javascript.js"></script>
    <script src="/codemirror/mode/python/python.js"></script>
    <link href="/codemirror/theme/dracula.css" rel="stylesheet"/>
    <script src="/codemirror/addon/edit/closetag.js"></script>
    <script  src="/codemirror/addon/lint/javascript-lint.js"></script> 
    	<script src="/codemirror/addon/mode/lint/lint.js"></script>
	<link rel="stylesheet" href="/codemirror/addon/lint/lint.css"/> 
<meta charset="UTF-8">
<title>CodeRoom</title>
</head>
<body>
<nav class="navbar navbar-expand-xl navbar-dark" style="background-color: #333333;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/dashboard"> <img  class="coderoom_icon"  src="/img/coderoom.png"/>  </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarDark" aria-controls="navbarDark" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
		<a class="navbar-brand" href="/"><button type="button" class="btn btn-outline-secondary">Logout</button> </a>
  </div>
</nav>

<div class="mycontainer flex ">
	<div class="block col1">
	
		<div class="list-group" id="list-tab" role="tablist">
			<h5 class="workspace-title">Workspace</h5>
			<c:forEach var="snp" items="${snps}">
				<a class="list-group-item list-group-item-action mylist text-truncate" href="/code/${snp.id}"  data-bs-toggle="tooltip" data-bs-placement="right" title="${snp.title}" data-bs-original-title="${snp.title}"> - ${snp.title} </a>
			</c:forEach>
			  
		</div>
	</div>
	
	<div class="block col2">
		<h2 class="new-title">New Code</h2>
	   <form:form action="/adding/snippet" method="post" modelAttribute="snippet">
		  
		   	<form:input path="title" class="form-control myinput" placeholder="Title"/>
		   	<form:errors path="title"/>
			<div class="form-group">
				<label for="language" class="lang_label">Select language:</label>
				<form:select class="form-control form-select myinput"  id="language" onchange="myFunction()" path="lang">
		             <form:option value="javascript">javascript</form:option>
		             <form:option value="python">python</form:option>
		             <form:option value="xml">html</form:option>
		        </form:select>
				
			</div>
			<form:errors path="code"/>
			<form:textarea id="editor" path="code"></form:textarea>
			<br/>
			<div class="flex flex_end">
				
				<input type="submit" value="Save" class="btn btn-secondary"/>
			</div>
		</form:form>
	</div>
	<div class="col3 block ">
		<h6 class="workspace-title">Create your code by AI:</h6>
		<textarea id="ai-text" placeholder="Type some text to generate code..."></textarea>
		<button  type="button" class="btn btn-outline-secondary btn-sm right" onclick="postfunction()">Generate</button>
		<button  id="copy" class="btn btn-outline-secondary btn-sm right" onclick="copy()">copy</button>
		<textarea id="ai-generate" ></textarea>
	
	</div>
	
</div>
	
	
	<script src="/codemirror/addon/mode/loadmode.js"></script>

	<script src="/codemirror/mode/meta.js"></script>
	<script>
		var editor = CodeMirror.fromTextArea
		(document.getElementById('editor'),{
			theme:"dracula",
			lineNumbers:true,
			lint:true,
			autoCloseTags : true,
			mode:"javascript"
		});
		editor.setSize("100%","300");
		
	</script>
	<script>
	function myFunction() {
		  var mime = document.getElementById("language").value;
		  console.log(mime)
		  editor.setOption("mode", mime);
		}
	
	
	</script>
	
	<script>
		function postfunction(){
			let url = "http://localhost:8000/api/openai/anything"
			var code = document.getElementById("ai-text").value;
			let prompt = code			
			let data2 = {prompt:prompt}
			document.getElementById("ai-generate").value= "loading..."
			console.log(data2)
			fetch(url,{
				body:JSON.stringify(data2),
				method:"POST",
				headers:{'Content-Type': 'application/json'},
			})
				.then((res)=>{
					return res.json();
				})
				.then(data=>{
					console.log(data)
					let test_text = data.choices[0].text;
					document.getElementById("ai-generate").value = test_text;
				})
				.catch((error)=>console.error("Fetch Error:",error))
		}

	</script>
	<script>
		function test(){
			console.log("123")
			document.getElementById("ai-generate").value = "13221354";
		}
	</script>
	
	<script>
function copy() {
  /* Get the text field */
  var copyText = document.getElementById("ai-generate");

  /* Select the text field */
  copyText.select();
  copyText.setSelectionRange(0, 99999); /* For mobile devices */

  /* Copy the text inside the text field */
  navigator.clipboard.writeText(copyText.value);
  
  /* Alert the copied text */

}
</script>
	
</body>
</html>