CREATE TABLE Trips (
    Trip_ID INT PRIMARY KEY,
    Start_date DATE NOT NULL,
    End_date DATE NOT NULL,
    Duration_day INT NOT NULL
);

CREATE TABLE Travelers (
    Traveler_ID INT PRIMARY KEY,
    Traveler_name VARCHAR(255) NOT NULL,
    Traveler_age INT NOT NULL,
    Traveler_gender VARCHAR(50) NOT NULL,
    Traveler_nationality VARCHAR(255) NOT NULL
);

CREATE TABLE Accommodations (
    Accommodations_ID INT PRIMARY KEY,
    Accommodation_Type VARCHAR(50) NOT NULL,
    Cost DECIMAL
);

CREATE TABLE Transportations (
    Transportation_ID INT PRIMARY KEY,
    Transportation_Type VARCHAR(50),
    Cost DECIMAL
);

CREATE TABLE Destinations (
    Destination_ID INT PRIMARY KEY,
    City VARCHAR(255),
    Country VARCHAR(255) NOT NULL
);

CREATE TABLE Hotels (
    Hotel_ID INT PRIMARY KEY,
	Accommodation_ID INT REFERENCES Accommodations(Accommodations_ID),
	Hotel_name VARCHAR(255) NOT NULL,
    Destination_ID INT REFERENCES Destinations(Destination_ID),
    Review TEXT
);

CREATE TABLE Airbnbs (
    Airbnb_ID INT PRIMARY KEY,
    Accommodation_ID INT REFERENCES Accommodations(Accommodations_ID),
    Airbnb_name VARCHAR(255),
    Price DECIMAL,
    Offer_price DECIMAL,
    Review VARCHAR(255),
    Number_of_bed VARCHAR(255),
    Extracted_Title TEXT,
    Destination_ID INT REFERENCES Destinations(Destination_ID)
);

CREATE TABLE Flights (
    Flight_ID INT PRIMARY KEY,
    Transportation_ID INT REFERENCES Transportations(Transportation_ID),
    Airline VARCHAR(255),
    IATA_code VARCHAR(10),
    Destination_ID INT REFERENCES Destinations(Destination_ID),
    Terminal VARCHAR(255),
    Boarding_Area VARCHAR(10)
);

CREATE TABLE Rental_Cars (
    Car_ID INT PRIMARY KEY,
    Transportation_ID INT REFERENCES Transportations(Transportation_ID),
    Destination_ID INT REFERENCES Destinations(Destination_ID),
    Make VARCHAR(255),
    Model VARCHAR(255),
    Type VARCHAR(255),
    Year INT,
    Fuel_type VARCHAR(255),
    Rating DECIMAL
);

CREATE TABLE Traveler_Trips (
    Traveler_ID INT REFERENCES Travelers(Traveler_ID),
    Trip_ID INT REFERENCES Trips(Trip_ID),
    Destination_ID INT REFERENCES Destinations(Destination_ID),
    PRIMARY KEY (Traveler_ID, Trip_ID, Destination_ID)
);

CREATE TABLE Destination_Trips (
    Trip_ID INT REFERENCES Trips(Trip_ID),
    Destination_ID INT REFERENCES Destinations(Destination_ID),
    PRIMARY KEY (Trip_ID, Destination_ID)
);

CREATE TABLE Accommodation_Trips (
    Trip_ID INT REFERENCES Trips(Trip_ID),
    Accommodation_ID INT REFERENCES Accommodations(Accommodations_ID),
    PRIMARY KEY (Trip_ID, Accommodation_ID)
);

CREATE TABLE Transportation_Trips (
    Trip_ID INT REFERENCES Trips(Trip_ID),
    Transportation_ID INT REFERENCES Transportations(Transportation_ID),
    PRIMARY KEY (Trip_ID, Transportation_ID)
);

CREATE TABLE Hotel_Bookings (
    Trip_ID INT REFERENCES Trips(Trip_ID),
    Hotel_ID INT REFERENCES Hotels(Hotel_ID),
    PRIMARY KEY (Trip_ID, Hotel_ID)
);

CREATE TABLE Airbnb_Bookings (
    Airbnb_ID INT REFERENCES Airbnbs(Airbnb_ID),
    Trip_ID INT REFERENCES Trips(Trip_ID),
    PRIMARY KEY (Airbnb_ID, Trip_ID)
);

CREATE TABLE Flight_Bookings (
    Flight_ID INT REFERENCES Flights(Flight_ID),
    Trip_ID INT REFERENCES Trips(Trip_ID),
    PRIMARY KEY (Flight_ID, Trip_ID)
);

CREATE TABLE Car_Bookings (
    Car_ID INT REFERENCES Rental_Cars(Car_ID),
    Trip_ID INT REFERENCES Trips(Trip_ID),
    PRIMARY KEY (Car_ID, Trip_ID)
);







