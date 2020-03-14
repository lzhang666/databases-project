<html>
    <head>
        <title>flight data</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    </head>
    <body>
        <!-- Nav Bar-->
        <div id="navbar" class="collapse navbar-collapse navbar-inverse">
        <ul class="nav navbar-nav">
                <!-- <li class="active"><a href="">Home</a></li> -->
                <li><a href="/">Home</a></li>
                <li><a href="/add_passenger">New Passenger</a></li>
        </ul>
        </div><!--/.nav-collapse -->
       

        <div class="container">
            <div class="starter-template">
                <!-- Main content should go here-->
                <h1>Passenger View/Edit</h1>

                % for element in passenger:
                <form action="/view_edit/{{element[0]}}" method="post">
                    Name:<br> <input type="text" name="name" value="{{element[1]}}"> <Br>
                    ID:<br> <input type="text" name="id" value="{{element[0]}}" readonly><Br>
                    Flight Date:<br> <input type="text" value="{{element[2]}}" readonly><Br>
                    Select Flight Date:<br>
                        <td><select name="date"> 
                            % for value in date:
                                <option>{{value[0]}}</option>
                            % end
                            </select></td> <Br>
                    <br>
                    <input type="submit">
                </form>
                % end
            </div>
        </div>
    </body>
</html>