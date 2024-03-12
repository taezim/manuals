function addToCart(action)
{
	console.log("연결되었다!");
	document.addForm.action = action;
	document.addForm.submit();
	alert("도서가 장바구니에 추가되었습니다!");
}

function removeFromCart(action)
{
	console.log("삭제연결되었다!");
	document.removeForm.action = action;
	document.removeForm.submit();
	setTimeout(function () {window.location.reload();}, 500);
}

function clearCart()
{
	console.log("clear연결되었다!");
	document.clearForm.submit();
	setTimeout(function () {window.location.reload();}, 500);
}

function deleteConfirm(id)
{	
	console.log("delete연결되었다!");
	if(confirm("삭제합니다!!")==true) location.href = "./delete?id=" + id;
	else return;
}

function loginForCart(action)
{
	console.log("로그인 요구 카트 연결되었다!");
	document.removeForm.action = action;
	document.removeForm.submit();
	setTimeout(function () {window.location.reload();}, 500);
}

function deleteMember(id)
{	
	console.log("멤버 삭제 연결되었다!");
	if(confirm("삭제합니다!!")==true) location.href = "./delete?id=" + id;
	else return;
}