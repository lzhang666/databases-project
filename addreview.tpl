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
                    <h1>Add a Review for {{element[1]}}</h1>
                % end

                <table class="table table-striped">
                    <tr> <th>flight</th> <th>Seat Comfort</th> <th>Food/Beverage</th> <th>Entertainment</th><th>Recommended</th><th></th></Tr>
                    <form action="/add_review/{{element[0]}}" method="post">
                        <tr>
                            <td><select name="flight_id"> 
                            % for element in flight:
                                <option>{{element[0]}}</option>
                            % end
                            </select></td> 

                            <td><input type="text" name="seat" value=""></td> <td><input type="text" name="food" value=""></td> <td><input type="text" name="ent" value=""></td> 
                                <td>
                                <select name="rcmd"> 
                                <option>true</option>
                                <option>false</option>
                                </select></td>
                                <td><input type="submit"></td></tr>
                        
                    </form>

                </table>
            </div>
        </div>
    </body>
</html>