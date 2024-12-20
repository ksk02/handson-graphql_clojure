CREATE TABLE organization (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE member (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  organization_id INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id)
    REFERENCES organization (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE artist (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  type TINYINT NOT NULL COMMENT '1: group, 2: solo',
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE artist_member (
  artist_id INT(10) UNSIGNED NOT NULL,
  member_id INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (artist_id, member_id),
  FOREIGN KEY (artist_id)
    REFERENCES artist (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (member_id)
    REFERENCES member (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE song (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  artist_id INT(10) UNSIGNED NOT NULL,
  release_date DATE NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (artist_id)
    REFERENCES artist (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;