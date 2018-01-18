
	
	function PageChange(){//}(select
		forwardPageNo=document.getElementById("forwardPageNo").value;
		pageSize=document.getElementById("pageSize").value
		var f = document.createElement("form");
		var action ="article!enterProsePage?pageNo="+forwardPageNo+"&pageSize="+pageSize;
		
		f.action=action;
		f.method = "post";
		document.body.appendChild(f);
		f.submit();
	}
	