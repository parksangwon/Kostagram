$(function(){
	var joinForm = $("#joinForm");
	
	$('#joinbutton').click(function(){
		
		var idInput = $('input:text[name=id]');
		var idValue = trim(idInput.val());
		
		if(idValue === "")
		{
			window.alert("E-mail ID를 입력하세요.");
			idInput.select();
			return false;
		}
		else if(idValue !== "")
		{
			if(isEmailChar(idValue))
			{
				window.alert("E-mail ID 에는 영문 소문자와 숫자, '@', '.' 만이 입력가능합니다.");
				idInput.select();
				return false;
			}
			else if(idValue.indexOf("@") == -1 || idValue.indexOf(".") == -1 || idValue.indexOf(".")<idValue.indexOf("@") || isNum(idValue.charAt(0)))
			{
				window.alert("E-mail ID를 확인 하세요.");
				idInput.select();
				return false;
			}
			else
			{
				joinForm.submit();
				//$.mobile.changePage("./usercheck");
			}
		}
	});
});