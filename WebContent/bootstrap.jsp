<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- BEGIN Bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<link href="https://bootswatch.com/darkly/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- END Bootstrap -->
<c:if test="${user==null}">
<link href="https://bootswatch.com/sandstone/bootstrap.min.css" rel="stylesheet" type="text/css">
</c:if>