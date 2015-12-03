<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="m/js/common.js"></script>
<STYLE type="text/css">
	.mouseOut
	{
		background: #FFFAFA;
		color: #000000;
	}

	.mouseOver
	{
		background: #708090;
		color: #FFFAFA;
	}
</STYLE>
<script type="text/javascript">
	var wordDiv;
	var wordField;
	var wordTable;
	var wordTableBody;
	function wordComplete()
	{
		wordField = $('#searchWord'); //검색어 TEXT
		wordTable = $('#wordTable');  //검색어 자동으로 보여주는 테이블
		wordDiv = $('#wordDiv');      //테이블을 감싸고 있는 DIV
		wordTableBody = $('#wordTableBody'); //테이블 안의 BODY
	
		if (trim(wordField.val()).length > 0)
		{
			$.ajax({
				type: "GET",
				url: "searchWordAutoComplete/?message=" + trim(wordField.val()),
				dataType: "xml",
				success: function(response, status, request){
					clearList();
					if (request.status == 200)
					{
						setOffsets();
	
						$(response).find('WORD').each(function(){
							/*
							<WORDLIST>
								<WORD>
									<NAME>???</NAME>
									<COUNT>???</COUNT>
								</WORD>
							</WORDLIST>
							*/
								var nextNode = $(this).find('NAME').text();
								var row = $('<TR>');
								var cell = $("<TD class='mouseOut'>").text(nextNode);
								
								/*
									<TR>
										<TD class='mouseOut'>
											nextNode
										</TD>
									</TR>
								*/
								cell.hover(function(){
												cell.removeClass('mouseOut');
												cell.addClass('mouseOver');
											},
											function(){
												cell.removeClass('mouseOver');
												cell.addClass('mouseOut');
											});
								
								cell.click(function(){
									wordField.val($(this).text());
									clearList();
								});
	
	
								cell.attr('bgcolor', '#FFFAFA');
								cell.attr('border', '0');
	
								row.append(cell);
								wordTableBody.append(row);
							}
						);
					}
				}
			});
		}
		else
		{
			clearList();
		}
	}
	
	function setOffsets()
	{
		var end = wordField.prop('offsetWidth');  //가로의 폭설정
		var left = calculateOffsetLeft(document.searchForm.word); //왼쪽끝 시작점 설정
		var top = calculateOffsetTop(document.searchForm.word) + wordField.prop('offsetHeight');//TEXT창의 맨위 좌표에 + 폭을 더해서 바로아래에 설정
	
		wordDiv.css('border', 'black 1px solid');
		wordDiv.css('left', left + 'px');
		wordDiv.css('top', top + 'px');
		wordTable.css('width', end + 'px');
	}
	
	function calculateOffsetLeft(field)
	{
		return calculateOffset(field, "offsetLeft");
	}
	
	function calculateOffsetTop(field)
	{
		return calculateOffset(field, "offsetTop");
	}
	
	function calculateOffset(field, attr)
	{
		var offset = 0;
		while(field)
		{
			offset = offset + field[attr];
			field = field.offsetParent;		//자식엘리먼트 위치에 영향을 미치는 상위 엘리먼트를 치칭 하는것
		}
		return offset;
	}
	
	function clearList()
	{
		wordTableBody.empty();
		wordDiv.css('border', 'none');
	}
</script>
</head>
<body>
	<nav class="TOP_BORDER" role="navigation">
		<DIV class="TOP_MAXSIZE" style="max-width: 600px;">
			<A class="TOP_LEFT_LINK"></A>
			<FORM name="searchForm">
			<DIV class="TOP_SEARCH">
				<DIV class="TOP_SEARCH_ITEMS" style="max-width: 600px;">
					<SPAN class="SEARCH_LEFT_IMG"><A href="/"><img src="img/web/searchicon.png"></A></SPAN>
					<INPUT type="text" name="word" id="searchWord" placeholder="검색" onkeyup="wordComplete();" onclick="wordComplete();">
				</DIV>
				<DIV style="position:absolute;" id="wordDiv">
						<TABLE id="wordTable" bgcolor="#FFFAFA" border="0" cellspacing="0" cellpadding="0">
							<TBODY id="wordTableBody"></TBODY>
						</TABLE>
				</DIV>
			<A class="TOP_RIGHT_LINK"></A>
			</DIV>
			</FORM>
		</DIV>
	</nav>
</body>
</html>