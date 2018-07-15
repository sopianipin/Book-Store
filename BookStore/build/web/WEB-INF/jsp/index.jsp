<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>Test Spring Web MVC project</title>
    </head>

    <body>
        <form>
            <table>
                <tr>
                    <td> <label>Search Title  </label></td>
                    <td>:</td>
                    <td><input type="text" name="query" placeholder="Judul Buku"></td>
                </tr>
                <tr>
                    <td>
                        <label>Sorting By </label></td>
                    <td>:</td>
                    <td><select name="sort">
                            <option value="id">
                                Id
                            </option>
                            <option value="title">
                                Title
                            </option>
                            <option value="title">
                                Price
                            </option>
                            <option value="title">
                                Status
                            </option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Filter By  </label></td>
                    <td>:</td>
                    <td>
                        <select name="filter">
                            <option value="aktif">
                                Active
                            </option>
                            <option value="inaktif">
                                Inactive
                            </option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Page </label></td>
                    <td>:</td>
                    <td><input type="number" name="pageNumber" placeholder="Halaman" /></td>
                </tr>   
                <tr>
                    <td><label>Size Record </label></td>
                    <td>:</td>
                    <td><input type="number" name="pageSize" placeholder="Jumlah Data" /></td>
                </tr>
        </form>
    <tr>
        <td></td>
        <td>
            
        </td>
        <td>
            <button id="button">
                Get Data
            </button>
        </td>
    </tr>

    <br>
</table>
<table border="1px">
    <thead>
    <td>Id</td>
    <td>Title</td>
    <td>Price</td>
    <td>Status</td>
</thead>
<tbody id="tableBody">

</tbody>  
</table>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $('#button').click(function () {
            reloadData();
        });
        function reloadData() {
            var pageNumber = $('input[name=pageNumber]').val();
            var pageSize = $('input[name=pageSize]').val();
            var sort = $('select[name=sort]').val();
            var query = $('input[name=query]').val();
            var filter = $('select[name=filter]').val();
            $.ajax({
                url: "book.htm",
                data: {pageNumber: pageNumber, pageSize: pageSize, sort: sort, query: query, filter: filter},
                type: 'GET',
                success: function (response) {
                    var data = JSON.parse(response);
                    console.log(data);
                    var len = data.data.length;
                    var content = '';
                    for (var i = 0; i < len; i++) {
                        content += '<tr>\n\
                                        <td> ' + data.data[i].id + '</td>\n\
                                        <td> ' + data.data[i].title + '</td>\n\
                                        <td> ' + data.data[i].price + '</td>\n\
                                        <td> ' + data.data[i].status + '</td>\n\
                                    </tr>';
                    }
                    $("#tableBody").html(content);
                }
            });
        }
    });
</script>
</html>
