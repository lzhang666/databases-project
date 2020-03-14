<html>
    <head>
        <title>flight data</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    </head>
    <body>
        <!-- Nav Bar-->
        <div id="navbar" class="collapse navbar-collapse navbar-inverse">
        <ul class="nav navbar-nav">
            <li class="active"><a href="">Home</a></li>
            <li><a href="/add_passenger">New Passenger</a></li>
        </ul>
        </div><!--/.nav-collapse -->
       

        <div class="container">
            <div class="starter-template">
                <!-- Main content should go here-->
                <h1>Passenger Search</h1>

                <form action="/" method="post">
                    Name: <input type="text" name="name">
                    Passenger_ID: <input type="text" name="id">
                    Date: <select name="date"> 
                        <option>Unknown</option>
                        % for element in date:
                        <option>{{element[0]}}</option>
                        % end
                    </select>



                    <input type="submit">
                </form>
            </div>
        </div>
    </body>
</html>