drop table if exists airline, airliner, airport, flight, passenger, pilot, price, review, weather, weatherforcast;

CREATE TABLE weather (
    location_id character varying(8) NOT NULL,
    date date NOT NULL,
    temperature integer,
    precipitation double precision,
    windspeed double precision,
    primary key (location_id, date)
);


CREATE TABLE weatherforcast (
    location_id character varying(8) NOT NULL,
    future_date date NOT NULL,
    temperatue integer,
    precipitation integer,
    windspeed double precision,
    primary key (future_date, location_id)
);


CREATE TABLE airliner (
    model_id character varying(24) NOT NULL,
    takeoffwindlimit double precision,
    capacity integer,
    primary key (model_id)
);

CREATE TABLE airline (
    airline_id character varying(8) NOT NULL,
    model_id character varying(24) NOT NULL,
    delay_rate double precision,
    cancelation_rate double precision,
    reimbursement boolean,
    primary key (airline_id, model_id),
    foreign key (model_id) references airliner (model_id)
);


CREATE TABLE airport (
    airport_id character varying(8) NOT NULL primary key,
    location_id character varying(8) NOT NULL,
    allow_windspeed integer
);

CREATE TABLE flight (
    flight_id character varying(8) NOT NULL unique,
    airline_id character varying(8) NOT NULL,
    model_id character varying(24) NOT NULL,
    departure character varying NOT NULL,
    destination character varying NOT NULL,
    foreign key (departure) references airport (airport_id),
    foreign key (destination) references airport (airport_id),
    foreign key (airline_id, model_id) references airline (airline_id, model_id),
    foreign key (model_id) references airliner (model_id)
);

CREATE TABLE passenger (
    p_id integer NOT NULL primary key,
    name text NOT NULL,
    flight_date date
);

CREATE TABLE pilot (
    pilot_id integer NOT NULL primary key,
    name text NOT NULL,
    flight_id character varying(24) NOT NULL,
    experience integer,
    foreign key(flight_id) references flight(flight_id)
);

CREATE TABLE price (
    flight_id character varying(8) NOT NULL,
    flight_date date,
    price double precision NOT NULL,
    primary key(flight_id, flight_date),
    foreign key(flight_id) references flight(flight_id)
);

CREATE TABLE review (
    p_id integer NOT NULL,
    flight_id character varying(8) NOT NULL,
    seat_comfort double precision,
    food_beverages double precision,
    entertainment double precision,
    recommended boolean,
    constraint fk_psg foreign key(p_id) references passenger(p_id) on delete cascade
);
