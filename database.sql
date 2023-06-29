-- Active: 1684000481785@@127.0.0.1@3306@spotify
CREATE TABLE user (
    id VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    birthday DATE,
    PRIMARY KEY(id) 
);

CREATE TABLE artist (
    id VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    instagram VARCHAR(50),
    facebook VARCHAR(50),
    twitter VARCHAR(50),
    wikipedia VARCHAR(50),
    bio TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE song (
    id VARCHAR(50) NOT NULL,
    album_id VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL,
    duration TIME NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE song
ADD CONSTRAINT fk_song_album
FOREIGN KEY (album_id)
REFERENCES album (id);

CREATE TABLE album (
    id VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL,
    release_at YEAR NOT NULL,
    image VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE playlist_category (
    id VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    image VARCHAR(50) NOT NULL,
    icon VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE podcast_category (
    id VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    image VARCHAR(50) NOT NULL,
    icon VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE playlist (
    id VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    image VARCHAR(50) NOT NULL,
    playlist_category_id VARCHAR(50),
    user_id VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE playlist
ADD CONSTRAINT fk_user_add_playlist
FOREIGN KEY (user_id)
REFERENCES user (id),
ADD CONSTRAINT fk_playlist_has_category
FOREIGN KEY (playlist_category_id)
REFERENCES playlist_category (id);

CREATE Table podcast (
    id VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    about TEXT,
    image VARCHAR(50),
    podcast_category_id VARCHAR(50),
    user_id VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE podcast
ADD CONSTRAINT fk_user_add_podcast
FOREIGN KEY (user_id)
REFERENCES user (id),
ADD CONSTRAINT fk_podcast_has_category
FOREIGN KEY (podcast_category_id)
REFERENCES podcast_category (id);


CREATE Table episode (
    id VARCHAR(50) NOT NULL,
    podcast_id VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL,
    description TEXT,
    published_at DATE,
    duration TIME,
    PRIMARY KEY(id)
);

ALTER TABLE episode
ADD CONSTRAINT fk_episode_podcast
FOREIGN KEY (podcast_id)
REFERENCES podcast(id);

CREATE TABLE concert (
    id VARCHAR(50) NOT NULL,
    event_at DATETIME NOT NULL,
    url_ticket VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    longitude DOUBLE,
    latitude DOUBLE,
    PRIMARY KEY(id)
);

CREATE Table playlist_song (
    id VARCHAR(50) NOT NULL,
    playlist_id VARCHAR(50) NOT NULL,
    song_id VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE playlist_song
ADD CONSTRAINT fk_playlist_song 
FOREIGN KEY (playlist_id) 
REFERENCES playlist (id),
ADD CONSTRAINT fk_song_playlist
FOREIGN KEY (song_id)
REFERENCES song (id);

CREATE Table user_playlist (
    id VARCHAR(50) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    playlist_id VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE user_playlist
ADD CONSTRAINT fk_user_playlist 
FOREIGN KEY (user_id) 
REFERENCES user (id),
ADD CONSTRAINT fk_playlist_user
FOREIGN KEY (playlist_id)
REFERENCES playlist (id);

CREATE Table user_song (
    id VARCHAR(50) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    song_id VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE user_song
ADD CONSTRAINT fk_user_song 
FOREIGN KEY (user_id) 
REFERENCES user (id),
ADD CONSTRAINT fk_song_user
FOREIGN KEY (song_id)
REFERENCES song (id);

CREATE Table user_artist (
    id VARCHAR(50) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    artist_id VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE user_artist
ADD CONSTRAINT fk_user_artist 
FOREIGN KEY (user_id) 
REFERENCES user (id),
ADD CONSTRAINT fk_artist_user
FOREIGN KEY (artist_id)
REFERENCES artist (id);

CREATE Table artist_song (
    id VARCHAR(50) NOT NULL,
    artist_id VARCHAR(50) NOT NULL,
    song_id VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE artist_song
ADD CONSTRAINT fk_artist_song 
FOREIGN KEY (artist_id) 
REFERENCES artist (id),
ADD CONSTRAINT fk_song_artist
FOREIGN KEY (song_id)
REFERENCES song (id);

CREATE Table artist_concert (
    id VARCHAR(50) NOT NULL,
    artist_id VARCHAR(50) NOT NULL,
    concert_id VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE artist_concert
ADD CONSTRAINT fk_artist_concert
FOREIGN KEY (artist_id) 
REFERENCES artist (id),
ADD CONSTRAINT fk_concert_artist
FOREIGN KEY (concert_id)
REFERENCES concert (id);

CREATE Table artist_album (
    id VARCHAR(50) NOT NULL,
    artist_id VARCHAR(50) NOT NULL,
    album_id VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE artist_album
ADD CONSTRAINT fk_artist_album 
FOREIGN KEY (artist_id) 
REFERENCES artist (id),
ADD CONSTRAINT fk_album_artist
FOREIGN KEY (album_id)
REFERENCES album (id);