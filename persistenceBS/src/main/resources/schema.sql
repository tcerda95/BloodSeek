CREATE TABLE IF NOT EXISTS hospitals (
	hospitalId SERIAL PRIMARY KEY,
	hospitalName VARCHAR(64) NOT NULL,
	hospitalAddress VARCHAR(64) NOT NULL UNIQUE,
	latitude FLOAT NOT NULL,
	longitude FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS grantees (
	granteeId SERIAL PRIMARY KEY NOT NULL,
	granteeName VARCHAR(64),
	description VARCHAR(10000),
	password VARCHAR(64) NOT NULL,
	bloodType VARCHAR(16) NOT NULL,
	hospitalAddress VARCHAR(64) REFERENCES hospitals(hospitalAddress) NOT NULL,
	age INTEGER,
	donorsNeeded INTEGER,
	actualDonated INTEGER
);

