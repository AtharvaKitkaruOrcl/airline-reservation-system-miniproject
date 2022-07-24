

create table Admin(
    admin_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) constraint  ad_pk  primary key,
    username varchar(100) not null,
    email varchar(100),
    passwd varchar(100) not null,
    last_login timestamp
);

create table Passenger(
    passenger_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1)  constraint  pa_pk  primary key,
    username varchar(100) not null,
    email varchar(100),
    passwd varchar(100) not null,
    age integer,
    gender varchar(10) constraint gender_check check (gender in ('male', 'female', 'other'))
);

create table Flight(
    flight_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1)  constraint  fl_pk  primary key,
    departure_city varchar(100) not null,
    arrival_city varchar(100) not null,
    departure_time timestamp,
    arrival_time timestamp,
    total_seats number
);

create table Booking(
    booking_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1)  constraint  bk_pk  primary key,
    time timestamp,
    seat_num varchar(10),
    passenger_id integer, constraint bk_pa_fk foreign key(passenger_id) references Passenger(passenger_id),
    flight_id integer , constraint bk_fl_pk foreign key(flight_id) references Flight(flight_id)
);

create table Payment(
    payment_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1)  constraint  py_pk  primary key,
    amount number,
    time timestamp,
    booking_id integer , constraint py_bk_pk foreign key(booking_id) references Booking(booking_id)
);