<html>
    <head>
        <title>flight data</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    </head>
    <body>
        <!-- Nav Bar-->
        <div id="navbar" class="collapse navbar-collapse navbar-inverse">
        <ul class="nav navbar-nav">
            <li><a href="/">Home</a></li>
            <li><a href="/add_passenger">New Passenger</a></li>
        </ul>
        </div><!--/.nav-collapse -->


        <div class="container">
            <div class="starter-template">
                <!-- Main content should go here-->
                % for element in passenger:
                    <h1>Reviews of {{element[1]}}</h1>
                % end

                <table class="table table-striped">
                    <tr> <th>flight</th> <th>Seat Comfort</th> <th>Food/Beverage</th> <th>Entertainment</th><th>Recommended</th></Tr>
                        % for element in review:
                        <tr> <td>{{element[1]}}</td> <td>{{element[2]}}</td> <td>{{element[3]}}</td> <td>{{element[4]}}</td> <td>{{element[5]}}</td> </tr>

                        % end
                </table>
            </div>
        </div>
    </body>
</html>