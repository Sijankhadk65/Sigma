CREATE TABLE `ServiceCenter` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `center_name` varchar(255),
  `email` varchar(255),
  `location` location,
  `contact_no` int
);

CREATE TABLE `Customer` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `fname` varchar(255),
  `lname` varchar(255),
  `contact_no` int,
  `email` varchar(255),
  `password_hash` varchar(255),
  `due_amount` int,
  `location` location
);

CREATE TABLE `Administrator` (
  `id` varchar(255) PRIMARY KEY,
  `center_id` int,
  `lname` varchar(255),
  `fname` varchar(255),
  `contact_no` int,
  `address` location
);

CREATE TABLE `Servicer` (
  `id` varchar(255) PRIMARY KEY,
  `fname` varchar(255),
  `lname` varchar(255),
  `joined_at` varchar(255),
  `contact_no` int,
  `address` location,
  `center_id` varchar(255)
);

CREATE TABLE `Ticket` (
  `id` varchar(255) PRIMARY KEY,
  `opened_by` varchar(255),
  `center_id` varchar(255),
  `customer_id` varchar(255),
  `is_closed` boolean,
  `is_delivered` boolean,
  `is_payment_due` boolean,
  `serviced_by` varchar(255),
  `closed_at` timestamp,
  `opened_at` timestamp,
  `due_at` timestamp,
  `delivered_at` timestamp,
  `closed_by` varchar(255),
  `total_service_cost` int,
  `delivery_location` localtion,
  `issue_count` int,
  `open_issue` int,
  `closed_issue` int
);

CREATE TABLE `Issue` (
  `id` varchar(255) PRIMARY KEY,
  `created_at` varchar(255),
  `ticket_id` varchar(255),
  `is_closed` boolean,
  `closed_at` timestamp,
  `description` varchar(255)
);

CREATE TABLE `Bill` (
  `id` varchar(255) PRIMARY KEY,
  `ticket_id` varchar(255),
  `billed_by` varchar(255),
  `total_price` int,
  `customer_fname` varchar(255),
  `customer_lname` varchar(255),
  `center_name` varchar(255),
  `center_location` location,
  `delivery_location` location,
  `center_id` varchar(255)
);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`center_id`) REFERENCES `ServiceCenter` (`id`);

ALTER TABLE `Administrator` ADD FOREIGN KEY (`center_id`) REFERENCES `ServiceCenter` (`id`);

ALTER TABLE `Servicer` ADD FOREIGN KEY (`center_id`) REFERENCES `ServiceCenter` (`id`);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`id`);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`serviced_by`) REFERENCES `Servicer` (`id`);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`opened_by`) REFERENCES `Administrator` (`id`);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`closed_by`) REFERENCES `Administrator` (`id`);

ALTER TABLE `Issue` ADD FOREIGN KEY (`ticket_id`) REFERENCES `Ticket` (`id`);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`id`) REFERENCES `Bill` (`id`);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`closed_by`) REFERENCES `Bill` (`billed_by`);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`total_service_cost`) REFERENCES `Bill` (`total_price`);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`center_id`) REFERENCES `Bill` (`center_id`);
