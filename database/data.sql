-- Drop the database 'world' if it exists
DROP DATABASE IF EXISTS quotenation;

-- Create the database 'world'
CREATE DATABASE quotenation;

-- Connect to the newly created database
\c quotenation;

-- Create table 'user_data'
CREATE TABLE user_data (
    username VARCHAR(100) PRIMARY KEY,
    password VARCHAR(100),
    email VARCHAR(100)
);

-- Create table 'quotes_data'
CREATE TABLE quotes_data (
    id SERIAL PRIMARY KEY,
    quotes TEXT,
    category VARCHAR(50),
    username VARCHAR(100),
    FOREIGN KEY (username) REFERENCES user_data(username)
);

-- Insert data into 'user_data' table
INSERT INTO user_data (username, password, email)
VALUES 
('aryan@2004', 'password123', 'aryan2004@example.com'),
('meena15aug', 'meenaPass!', 'meena15aug@example.com'),
('kiran007', 'kiranPass007', 'kiran007@example.com');

-- Insert quotes into 'quotes_data' table

-- Quotes for 'kiran007'
INSERT INTO quotes_data (quotes, category, username)
VALUES
('Love is composed of a single soul inhabiting two bodies.', 'Love', 'kiran007'),
('Life is about making an impact, not making an income.', 'Life', 'kiran007'),
('Happiness is not something you postpone for the future; it is something you design for the present.', 'Happiness', 'kiran007'),
('Friendship is born at that moment when one person says to another, ''What! You too? I thought I was the only one.''', 'Friendship', 'kiran007'),
('Inspirational quotes can have a profound impact on your mindset.', 'Inspirational', 'kiran007'),
('Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.', 'Success', 'kiran007'),
('The fool doth think he is wise, but the wise man knows himself to be a fool.', 'Wisdom', 'kiran007'),
('A day without laughter is a day wasted.', 'Humor', 'kiran007'),
('Motivation is what gets you started. Habit is what keeps you going.', 'Motivation', 'kiran007'),
('Courage is grace under pressure.', 'Courage', 'kiran007'),
('It always seems impossible until it’s done.', 'Motivation', 'kiran007'),
('Life is 10% what happens to us and 90% how we react to it.', 'Life', 'kiran007'),
('The best way to predict your future is to create it.', 'Success', 'kiran007'),
('In the middle of difficulty lies opportunity.', 'Inspirational', 'kiran007'),
('The only limit to our realization of tomorrow will be our doubts of today.', 'Courage', 'kiran007'),
('Success is not just about what you accomplish in your life; it’s about what you inspire others to do.', 'Success', 'kiran007'),
('Wisdom comes from experience. Experience is often a result of lack of wisdom.', 'Wisdom', 'kiran007'),
('A good laugh is sunshine in the house.', 'Humor', 'kiran007'),
('The only way to do great work is to love what you do.', 'Motivation', 'kiran007'),
('Courage is resistance to fear, mastery of fear, not absence of fear.', 'Courage', 'kiran007');

-- Quotes for 'meena15aug'
INSERT INTO quotes_data (quotes, category, username)
VALUES
('Love yourself first and everything else falls into line.', 'Love', 'meena15aug'),
('Life is a journey that must be traveled no matter how bad the roads and accommodations.', 'Life', 'meena15aug'),
('Happiness is not something ready made. It comes from your own actions.', 'Happiness', 'meena15aug'),
('A real friend is one who walks in when the rest of the world walks out.', 'Friendship', 'meena15aug'),
('Inspirational leaders inspire not by force, but by example.', 'Inspirational', 'meena15aug'),
('Success is not how high you have climbed, but how you make a positive difference to the world.', 'Success', 'meena15aug'),
('The true sign of wisdom is to know when to listen.', 'Wisdom', 'meena15aug'),
('Life is better when you''re laughing.', 'Humor', 'meena15aug'),
('Motivation is what gets you started. Habit is what keeps you going.', 'Motivation', 'meena15aug'),
('Courage is grace under pressure.', 'Courage', 'meena15aug'),
('Love is the only force capable of transforming an enemy into a friend.', 'Love', 'meena15aug'),
('Life is what happens when you''re busy making other plans.', 'Life', 'meena15aug'),
('The best way to predict your future is to create it.', 'Success', 'meena15aug'),
('Wisdom begins in wonder.', 'Wisdom', 'meena15aug'),
('Life is too important to be taken seriously.', 'Humor', 'meena15aug'),
('Our greatest glory is not in never falling, but in rising every time we fall.', 'Courage', 'meena15aug'),
('Success usually comes to those who are too busy to be looking for it.', 'Success', 'meena15aug'),
('In three words I can sum up everything I''ve learned about life: it goes on.', 'Life', 'meena15aug'),
('The only way to do great work is to love what you do.', 'Motivation', 'meena15aug'),
('Friendship is born at that moment when one person says to another, ''What! You too? I thought I was the only one.''', 'Friendship', 'meena15aug');

-- Quotes for 'aryan@2004'
INSERT INTO quotes_data (quotes, category, username)
VALUES
('Love is composed of a single soul inhabiting two bodies.', 'Love', 'aryan@2004'),
('Life is what happens when you''re busy making other plans.', 'Life', 'aryan@2004'),
('Happiness is a choice, not a result.', 'Happiness', 'aryan@2004'),
('True friendship is priceless.', 'Friendship', 'aryan@2004'),
('Inspirational quotes can change your perspective.', 'Inspirational', 'aryan@2004'),
('Success is not final, failure is not fatal: It is the courage to continue that counts.', 'Success', 'aryan@2004'),
('Wisdom is knowing what to do next; virtue is doing it.', 'Wisdom', 'aryan@2004'),
('Laughter is timeless, imagination has no age, and dreams are forever.', 'Humor', 'aryan@2004'),
('Motivation gets you started; habit keeps you going.', 'Motivation', 'aryan@2004'),
('Courage is resistance to fear, mastery of fear, not absence of fear.', 'Courage', 'aryan@2004'),
('Love is the only force capable of transforming an enemy into a friend.', 'Love', 'aryan@2004'),
('Life is what happens when you''re busy making other plans.', 'Life', 'aryan@2004'),
('The best way to predict your future is to create it.', 'Success', 'aryan@2004'),
('Wisdom begins in wonder.', 'Wisdom', 'aryan@2004'),
('Life is too important to be taken seriously.', 'Humor', 'aryan@2004'),
('Our greatest glory is not in never falling, but in rising every time we fall.', 'Courage', 'aryan@2004'),
('Success usually comes to those who are too busy to be looking for it.', 'Success', 'aryan@2004'),
('In three words I can sum up everything I''ve learned about life: it goes on.', 'Life', 'aryan@2004'),
('The only way to do great work is to love what you do.', 'Motivation', 'aryan@2004'),
('Friendship is born at that moment when one person says to another, ''What! You too? I thought I was the only one.''', 'Friendship', 'aryan@2004');
