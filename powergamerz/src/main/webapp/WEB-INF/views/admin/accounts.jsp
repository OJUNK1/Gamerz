<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
      <!-- Select Account Author Start -->
      <div class="container mt-5">
        <div class="row tm-content-row">
          <div class="col-12 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
              <h2 class="tm-block-title">List of Accounts</h2>
              <p class="text-white">Accounts</p>
              <select class="custom-select" name="selectauthor" id="selectauthor" onchange="searchList()">
                <option>Select account</option>
                <option value="All">All</option>
                <option value="ADMIN">Admin</option>
                <option value="USER">User</option>
              </select>
            </div>
          </div>
        </div>
        <!-- Select Account Author Start -->
        <!-- User List Start -->
        <div class="col-13 tm-block-col" id="userlist" name="userlist" style="display:none">
			<div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
				<h2 class="tm-block-title">Member List</h2>
				<table class="table" id="table11">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Name</th>
							<th scope="col">Birth</th>
							<th scope="col">Phone</th>
							<th scope="col">Address</th>
							<th scope="col">Email</th>
							<th scope="col">Author</th>
							<th scope="col">Edate</th>
						</tr>
					</thead>
					<tbody id="tablebody">
						<c:forEach items="${members}" var="m">
						<tr id="selectuser" name="selectuser" onclick="selectUser()">
							<th scope="row">${m.memberId}</th>
							<td>${m.memberName}</td>
							<td>${m.memberBirth}</td>
							<td>${m.memberPhone}</td>
							<td>${m.memberAddress}</td>
							<td>${m.memberEmail}</td>
							<td>${m.memberAuthor}</td>
							<td>${m.memberEdate}</td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
		</div>
		<!-- User List End -->
		<!-- row -->
        <div class="row tm-content-row" name="singleuser" id="singleuser">
          <div class="tm-block-col tm-col-avatar">
            <div class="tm-bg-primary-dark tm-block tm-block-avatar">
              <h2 class="tm-block-title">Change Avatar</h2>
              <div class="tm-avatar-container">
                <img id="avatarimg" name="avatarimg" src="adminmaster/img/avatar.png" alt="Avatar" class="tm-avatar img-fluid mb-4"/>
                <a href="#" class="tm-avatar-delete-link">
                  <i class="far fa-trash-alt tm-product-delete-icon"></i>
                </a>
              </div>
              <input class="btn btn-primary btn-block text-uppercase" type="file" value="Upload New Photo">
                
            </div>
          </div>
          <div class="tm-block-col tm-col-account-settings">
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
              <h2 class="tm-block-title">Account Settings</h2>
              <form action="" class="tm-signup-form row">
                <div class="form-group col-lg-6">
                  <label for="name">Account Name</label>
                  <input id="name" name="name" type="text"
                    class="form-control validate"
                    placeholder="${s.memberName}"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="birth">Account Birth</label>
                  <input id="birth" name="birth" type="text" class="form-control validate" value="${s.memberBirth}"/>
                </div>
                <div class="form-group col-lg-6">
                  <label for="phone">Account Phone</label>
                  <input id="phone" name="phone" type="text" class="form-control validate" value="${s.memberPhone}"/>
                </div>
                <div class="form-group col-lg-6">
                  <label for="address">Account Address</label>
                  <input id="address" name="address" type="text" class="form-control validate" value="${s.memberAddress}"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="email">Account Email</label>
                  <input id="email" name="email" type="text" class="form-control validate" value="${s.memberEmail}"/>
                </div>
                <div class="form-group col-lg-6">
                  <label for="author">Account Author</label>
                  <input id="author" name="author" type="tel" class="form-control validate" value="${s.memberAuthor}"/>
                </div>
                
                <div class="form-group col-lg-6">
                <label class="tm-hide-sm">&nbsp;</label>
                  <button type="submit" class="btn btn-primary btn-block text-uppercase">
                    Update Your Profile
                  </button>
                </div>
                <div class="form-group col-lg-6">
                <label class="tm-hide-sm">&nbsp;</label>
                  <button type="submit" class="btn btn-primary btn-block text-uppercase">
                    Delete Your Account
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- row End -->
      </div>
      
   
      <script type="text/javascript">
   	       	     	
     	function searchList(){
			
			//ajax를 이용해 검색결과 가져와 화면을 재구성
			
			let val = document.getElementById("selectauthor").value;
			let payload = "val="+val;
			let url = "ajaxmembersearch.do"
				if(val != null){
	     			document.getElementById("userlist").style.display = "block";
	     		} 
			fetch(url, {method:"POST", headers:{"content-Type":"application/x-www-form-urlencoded",}, body: payload})
				.then(response => response.json())
				.then(json => htmlConvert(json));
		}
		
		function htmlConvert(datas){
			document.querySelector('tbody').remove();
			
			const tbody = document.createElement('tbody');
			
			// tbody data 추가
			tbody.innerHTML = datas.map(data => htmlView(data)).join(''); 
			// table tbody 추가
			
			document.querySelector('table').appendChild(tbody);
			
		}
		
		function htmlView(data){
			
			return `
			<tr >
			<th scope="row">\${data.memberId}</th>
			<td>\${data.memberName}</td>
			<td>\${data.memberBirth}</td>
			<td>\${data.memberPhone}</td>
			<td>\${data.memberAddress}</td>
			<td>\${data.memberEmail}</td>
			<td>\${data.memberAuthor}</td>
			<td>\${data.memberEdate}</td>
		</tr>
				`
		}
		
		function selectUser(){
			let val = document.getElementById("selectuser");
			
		}
     	
      </script>
</body>
</html>