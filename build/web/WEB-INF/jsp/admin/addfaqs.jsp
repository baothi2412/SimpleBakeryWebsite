<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Add Faqs</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
  <script>

    function readURL(input, thumbimage) {
      if (input.files && input.files[0]) { //S? d?ng  cho Firefox - chrome
        var reader = new FileReader();
        reader.onload = function (e) {
          $("#thumbimage").attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
      else { // S? d?ng cho IE
        $("#thumbimage").attr('src', input.value);

      }
      $("#thumbimage").show();
      $('.filename').text($("#uploadfile").val());
      $('.Choicefile').css('background', '#14142B');
      $('.Choicefile').css('cursor', 'default');
      $(".removeimg").show();
      $(".Choicefile").unbind('click');

    }
    $(document).ready(function () {
      $(".Choicefile").bind('click', function () {
        $("#uploadfile").click();

      });
      $(".removeimg").click(function () {
        $("#thumbimage").attr('src', '').hide();
        $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
        $(".removeimg").hide();
        $(".Choicefile").bind('click', function () {
          $("#uploadfile").click();
        });
        $('.Choicefile').css('background', '#14142B');
        $('.Choicefile').css('cursor', 'pointer');
        $(".filename").text("");
      });
    }),
  </script>
</head>

    <body class="app sidebar-mini rtl">
  <style>
    .Choicefile {
      display: block;
      background: #14142B;
      border: 1px solid #fff;
      color: #fff;
      width: 150px;
      text-align: center;
      text-decoration: none;
      cursor: pointer;
      padding: 5px 0px;
      border-radius: 5px;
      font-weight: 500;
      align-items: center;
      justify-content: center;
    }

    .Choicefile:hover {
      text-decoration: none;
      color: white;
    }

    #uploadfile,
    .removeimg {
      display: none;
    }

    #thumbbox {
      position: relative;
      width: 100%;
      margin-bottom: 20px;
    }

    .removeimg {
      height: 25px;
      position: absolute;
      background-repeat: no-repeat;
      top: 5px;
      left: 5px;
      background-size: 25px;
      width: 25px;
      /* border: 3px solid red; */
      border-radius: 50%;

    }

    .removeimg::before {
      -webkit-box-sizing: border-box;
      box-sizing: border-box;
      content: '';
      border: 1px solid red;
      background: red;
      text-align: center;
      display: block;
      margin-top: 11px;
      transform: rotate(45deg);
    }

    .removeimg::after {
      /* color: #FFF; */
      /* background-color: #DC403B; */
      content: '';
      background: red;
      border: 1px solid red;
      text-align: center;
      display: block;
      transform: rotate(-45deg);
      margin-top: -2px;
    }
  </style>
  <!-- Navbar-->
  <header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
      aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


      <!-- User Menu-->
      <li><a class="app-nav__item" href="/index.htm"><i class='bx bx-log-out bx-rotate-180'></i> </a>

      </li>
    </ul>
  </header>
        <jsp:include page="siderbarmenu.jsp"></jsp:include>
    <main class="app-content">
    <div class="app-title">
      <ul class="app-breadcrumb breadcrumb">
        <li class="breadcrumb-item">Manage FAQs</li>
        <li class="breadcrumb-item"><a href="#">Add FAQs</a></li>
      </ul>
    </div>
    <div class="row">
      <div class="col-md-12">

        <div class="tile">

            <h3 class="tile-title">Add FAQs</h3>
          <div class="tile-body">
            <div class="row element-button">
              <div class="col-sm-2">
                <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#exampleModalCenter"><b><i
                      class="fas fa-folder-plus"></i>Add FAQs</b></a>
              </div>

            </div>
              <form:form action="addfaqs.htm" modelAttribute="faqForm" method="POST">
    <table border="0">
        <thead>
            <tr>
                <th colspan="3">Your Form Title</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><label class="control-label" > FAQ ID</label>
                <td><form:input class="form-control" type="text" path="faqID"/></td>

            </tr>
            <tr>
                 <td><label class="control-label" path="emailUser"> Email User</label>
                <td><form:input class="form-control" type="text" path="emailUser" /></td>

            </tr>
            <tr>
                 <td><label class="control-label" path="username"> User name</label>
                <td><form:input class="form-control" type="text" path="username" /></td>

            </tr>
            <tr>
                 <td><label class="control-label" path="content"> Content</label>
                <td><form:input class="form-control" type="text" path="content" /></td>
            </tr>
            <tr>
                 <td><label class="control-label" path="reply"> Reply</label>
                <td><form:input class="form-control" type="text" path="reply" /></td>
               
            </tr>
            <tr>
                 <td><label class="control-label" path="status"> Status</label>
                <td><form:input class="form-control" type="text" path="status" /></td>
            </tr>
            <tr>
                <td>
                    <form:button class="btn btn-save" type="submit">Submit</form:button>
                    <a class="btn btn-cancel" href="formfaqs.htm">Cancel</a>
                </td>
            </tr>
        </tbody>
    </table>
</form:form>

              
          </div>
<!--          <button class="btn btn-save" type="button">Save</button>
          <a class="btn btn-cancel" href="/doc/table-data-table.html">Delete</a>-->
        </div>

  </main>
  <!-- Essential javascripts for application to work-->
  <script src="./assets/js/jquery-3.2.1.min.js"></script>
  <script src="./assets/js/popper.min.js"></script>
  <script src="./assets/js/bootstrap.min.js"></script>
  <script src="./assets/js/main.js"></script>
  <!-- The javascript plugin to display page loading on top-->
  <script src="./assets/js/plugins/pace.min.js"></script>

</body>
</html>
