<html>
    <head>
        <title>flight data</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    </head>
    <body>
        <!-- Nav Bar-->
        <div id="navbar" class="collapse navbar-collapse navbar-inverse">
        <ul class="nav navbar-nav">
            <li><a href="">Home</a></li>
            <li><a href="/add_passenger">New Passenger</a></li>
        </ul>
        </div><!--/.nav-collapse -->
       

        <div class="container">
            <div class="starter-template">
                <!-- Main content should go here-->
                <h1>Passenger</h1>

                <table class="table table-striped">
                    <tbody><tr> <th>Name</th> <th>ID </th>  <th>  </th><th>  </th><th>  </th><th>  </th></tr>
                    <!-- <tr> <th colspan=5>Name</th> <th colspan=5>ID </th> </Tr> -->

                    % for element in passenger:

                    <tr><td>{{element[1]}}</td> <td>{{element[0]}}</td> <td> <a href="view_edit/{{element[0]}}">View / Edit</a> </td> <td> <a href="delete/{{element[0]}}">Delete</a></td> <td> <a href="reviews/{{element[0]}}">Flight Review</a></td> <td> <a href="add_review/{{element[0]}}">Add Review</a> </td></tr></tr>
                    
                    % end
                </table>
            </div>
        </div>
    </body>
</html>