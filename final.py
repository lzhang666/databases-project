from bottle import route, run, template, get, post, request, redirect
import psycopg2
import connection

'''
@route('/hello')
def hello():
    return "Hello World!"

@route('/hello')
@route('/hello/<name>')
def greet(name='Stranger'):
    return template('Hello {{name}}, how are you?', name=name)
'''


@route('/')
def home():
    conn = psycopg2.connect(host=connection.url, database=connection.database, user=connection.user,
                            password=connection.password)
    curdate = conn.cursor()
    querydate = "select date from weather"
    curdate.execute(querydate)
    res = {'date': curdate}
    return template('homepage.tpl', **res)


@post('/')
def list_res():
    psgname = request.forms.get('name')
    psgid = request.forms.get('id')
    date = request.forms.get('date')
    conn = psycopg2.connect(host=connection.url, database=connection.database, user=connection.user,
                            password=connection.password)
    cur = conn.cursor()

    if len(str.strip(psgname)) == 0 and len(str.strip(psgid)) == 0 and date == 'Unknown':
        return redirect('/invalid_input')
    # only enter passenger name
    elif len(str.strip(psgname)) != 0 and len(str.strip(psgid)) == 0 and date == 'Unknown':
        query = "select * from passenger where name ilike '%{}%'".format(psgname)
        cur.execute(query)
        res = {'passenger': cur}
        return template('passenger.tpl', **res)
    # only enter passenger ID
    elif len(str.strip(psgname)) == 0 and len(str.strip(psgid)) != 0 and date == 'Unknown':
        # length = len(str.strip(psgid))
        query = "select * from passenger where p_id = {}".format(psgid)
        cur.execute(query)
        res = {'passenger': cur}
        return template('passenger.tpl', **res)
    # only enter airline
    elif len(str.strip(psgname)) == 0 and len(str.strip(psgid)) == 0 and date != 'Unknown':
        query = "select * from passenger where flight_date = '{}'".format(date)
        cur.execute(query)
        res = {'passenger': cur}
        return template('passenger.tpl', **res)
    # only enter name and id
    elif len(str.strip(psgname)) != 0 and len(str.strip(psgid)) != 0 and date == 'Unknown':
        if len(str.strip(psgid)) == 3:
            query = "select * from passenger where name ilike '%{0}%' and p_id = {1}".format(psgname, psgid)
            cur.execute(query)
            res = {'passenger': cur}
            return template('passenger.tpl', **res)
    # only enter name and airline
    elif len(str.strip(psgname)) != 0 and len(str.strip(psgid)) == 0 and date != 'Unknown':
        query = "select * from passenger where name ilike '%{0}%' and flight_date = '{1}'".format(psgname,
                                                                                                     date)
        cur.execute(query)
        res = {'passenger': cur}
        return template('passenger.tpl', **res)
    # only enter id and airline
    elif len(str.strip(psgname)) == 0 and len(str.strip(psgid)) != 0 and date != 'Unknown':
        if len(str.strip(psgid)) == 3:
            query = "select * from passenger where p_id = {0} and flight_date = '{1}'".format(psgid,
                                                                                                     date)
            cur.execute(query)
            res = {'passenger': cur}
            return template('passenger.tpl', **res)
    # enter name, id and airline
    elif len(str.strip(psgname)) != 0 and len(str.strip(psgid)) != 0 and date != 'Unknown':

        query = "select * from passenger where name ilike '%{0}%' and p_id = {1} and flight_date = '{2}'".format(
            psgname, psgid, date)
        cur.execute(query)
        res = {'passenger': cur}
        return template('passenger.tpl', **res)


@get('/invalid_input')
def invalid_input():
    return 'invalid input...'


# view passenger info
@get('/view_edit/<p_id>')
def view_psg(p_id):
    conn = psycopg2.connect(host=connection.url, database=connection.database, user=connection.user,
                            password=connection.password)
    cur = conn.cursor()
    query = "select * from passenger where p_id ={}".format(p_id)
    cur.execute(query)

    curdate = conn.cursor()
    querydate = "select date from weather"
    curdate.execute(querydate)

    res = {'passenger': cur, 'date': curdate}
    return template('viewedit.tpl', **res)


# edit passenger info
@post('/view_edit/<p_id>')
def edit_psg(p_id):
    newname = request.forms.get('name')
    newdate = request.forms.get('date')
    conn = psycopg2.connect(host=connection.url, database=connection.database, user=connection.user,
                            password=connection.password)
    cur = conn.cursor()
    query = "update passenger set name = '{0}', flight_date = '{1}' where p_id = '{2}'".format(
        newname, newdate, p_id)
    cur.execute(query)
    conn.commit()
    conn.close()
    redirect('/view_edit/%s' % p_id)


# delete passenger info
@get('/delete/<p_id>')
def delete_psg(p_id):
    conn = psycopg2.connect(host=connection.url, database=connection.database, user=connection.user,
                            password=connection.password)
    cur = conn.cursor()
    query = "delete from passenger where p_id = '{}' ".format(p_id)
    cur.execute(query)
    conn.commit()
    conn.close()
    return template('Passenger ID: {{id}} deleted, press back button to go back', id=p_id)


# view flight reviews
@get('/reviews/<p_id>')
def reviews_psg(p_id):
    conn = psycopg2.connect(host=connection.url, database=connection.database, user=connection.user,
                            password=connection.password)
    curpsg = conn.cursor()
    curreview = conn.cursor()
    queryrpsg = "select * from passenger where p_id ={}".format(p_id)
    queryreview = "select * from review where p_id ={}".format(p_id)
    curpsg.execute(queryrpsg)
    curreview.execute(queryreview)
    res = {'passenger': curpsg, 'review': curreview}
    return template('reviews.tpl', **res)


@get('/add_review/<p_id>')
def add_review_form(p_id):
    conn = psycopg2.connect(host=connection.url, database=connection.database, user=connection.user,
                            password=connection.password)
    curpsg = conn.cursor()
    curflight = conn.cursor()
    queryrpsg = "select * from passenger where p_id ={}".format(p_id)
    queryflight = "select * from flight"
    curpsg.execute(queryrpsg)
    curflight.execute(queryflight)
    res = {'passenger': curpsg, 'flight': curflight}
    return template('addreview.tpl', **res)


@post('/add_review/<p_id>')
def add_review(p_id):
    flightid = request.forms.get('flight_id')
    seat = request.forms.get('seat')
    food = request.forms.get('food')
    ent = request.forms.get('ent')
    rcmd = request.forms.get('rcmd')

    conn = psycopg2.connect(host=connection.url, database=connection.database, user=connection.user,
                            password=connection.password)
    cur = conn.cursor()
    query = "insert into review values ('{0}','{1}','{2}','{3}','{4}','{5}')".format(
        p_id, flightid, seat, food, ent, rcmd)
    cur.execute(query)
    conn.commit()
    conn.close()
    redirect('/reviews/%s' % p_id)


@get('/add_passenger')
def add_passenger():
    conn = psycopg2.connect(host=connection.url, database=connection.database, user=connection.user,
                            password=connection.password)
    curmaxid = conn.cursor()
    querymaxid = "select max(p_id) from passenger"
    curmaxid.execute(querymaxid)

    curdate = conn.cursor()
    querydate = "select date from weather"
    curdate.execute(querydate)

    res = {'maxid': curmaxid, 'date': curdate}
    return template('addpassenger.tpl', **res)


@post('/add_passenger')
def insert_passenger():
    name = request.forms.get('name')
    id = request.forms.get('id')
    date = request.forms.get('date')
    conn = psycopg2.connect(host=connection.url, database=connection.database, user=connection.user,
                            password=connection.password)
    cur = conn.cursor()
    query = "insert into passenger values ('{}','{}','{}')".format(id, name, date)
    cur.execute(query)
    conn.commit()
    conn.close()
    redirect('/view_edit/%s' % id)


run(host='localhost', port=8080, debug=True)
