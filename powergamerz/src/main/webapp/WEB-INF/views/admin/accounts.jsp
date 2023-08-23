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
              <select class="custom-select" onchange="typeFn();">
                <option value="0">Select account</option>
                <option value="1">Admin</option>
                <option value="2">Member</option>
              </select>
            </div>
          </div>
        </div>
        <!-- Select Account Author Start -->
        <!-- User List Start -->
        <div class="col-12 tm-block-col" >
			<div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
				<h2 class="tm-block-title">Member List</h2>
				<table class="table">
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
					<tbody>
						<c:forEach items="${members}" var="m">
						<tr>
							<th scope="row"><b>${m.memberId}</b></th>
							<td><b>${m.memberName}</b></td>
							<td><b>${m.memberBirth}</b></td>
							<td><b>${m.memberPhone}</b></td>
							<td><b>${m.memberAddress}</b></td>
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
        <div class="row tm-content-row" style="display:none">
          <div class="tm-block-col tm-col-avatar">
            <div class="tm-bg-primary-dark tm-block tm-block-avatar">
              <h2 class="tm-block-title">Change Avatar</h2>
              <div class="tm-avatar-container">
                <img
                  src="adminmaster/img/avatar.png"
                  alt="Avatar"
                  class="tm-avatar img-fluid mb-4"
                />
                <a href="#" class="tm-avatar-delete-link">
                  <i class="far fa-trash-alt tm-product-delete-icon"></i>
                </a>
              </div>
              <button class="btn btn-primary btn-block text-uppercase">
                Upload New Photo
              </button>
            </div>
          </div>
          <div class="tm-block-col tm-col-account-settings">
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
              <h2 class="tm-block-title">Account Settings</h2>
              <form action="" class="tm-signup-form row">
                <div class="form-group col-lg-6">
                  <label for="name">Account Name</label>
                  <input
                    id="name"
                    name="name"
                    type="text"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="email">Account Email</label>
                  <input
                    id="email"
                    name="email"
                    type="email"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="password">Password</label>
                  <input
                    id="password"
                    name="password"
                    type="password"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="password2">Re-enter Password</label>
                  <input
                    id="password2"
                    name="password2"
                    type="password"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="phone">Phone</label>
                  <input
                    id="phone"
                    name="phone"
                    type="tel"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label class="tm-hide-sm">&nbsp;</label>
                  <button
                    type="submit"
                    class="btn btn-primary btn-block text-uppercase"
                  >
                    Update Your Profile
                  </button>
                </div>
                <div class="col-12">
                  <button
                    type="submit"
                    class="btn btn-primary btn-block text-uppercase"
                  >
                    Delete Your Account
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- row End -->
      </div>
      
      <script>
     
      </script>
</body>
</html>