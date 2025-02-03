INSERT INTO events (eventName, eventDate, eventDesc, eventStub, eventThumb, eventDuration) 
VALUES('Bakesale', '2025-02-28T13:11:00', 'A bakesale for the local church group', 'A bakesale', 'uploads/image-1738532905053-119265797.jpg', 1),
('Art Exhibition', '2025-03-15T18:00:00', 'Local artists showcase their work', 'Art Exhibit', 'uploads/image-1738532905053-119265797.jpg', 2),
('Charity Run', '2025-04-05T08:00:00', '5K run to raise money for cancer research', 'Charity Run', 'uploads/image-1738532905053-119265797.jpg', 3),
('Summer Concert', '2025-06-21T19:30:00', 'Live music in the park', 'Summer Concert', 'uploads/image-1738532905053-119265797.jpg', 1),
('Book Fair', '2025-07-12T10:00:00', 'Annual event for book lovers', 'Book Fair', 'uploads/image-1738532905053-119265797.jpg', 2),
('Food Festival', '2025-08-09T12:00:00', 'Celebrating culinary diversity', 'Food Fest', 'uploads/image-1738532905053-119265797.jpg', 1),
('Halloween Party', '2025-10-31T20:00:00', 'Costume contest and spooky fun', 'Halloween Party', 'uploads/image-1738532905053-119265797.jpg', 2),
('Winter Market', '2025-12-13T14:00:00', 'Local crafts and holiday shopping', 'Winter Market', 'uploads/image-1738532905053-119265797.jpg', 1),
('New Year Gala', '2026-01-01T21:00:00', 'Celebrate the new year with dance and dinner', 'New Year Gala', 'uploads/image-1738532905053-119265797.jpg', 1),
('Easter Egg Hunt', '2026-04-04T10:00:00', 'Family-friendly event with games and prizes', 'Easter Hunt', 'uploads/image-1738532905053-119265797.jpg', 1);

INSERT INTO eventTags (eventID, eventTag)
VALUES('1', 'food'), ('1', 'charity'), ('1', 'community'),
('2', 'art'), ('2', 'culture'), ('2', 'exhibition'),
('3', 'charity'), ('3', 'health'), ('3', 'sports'),
('4', 'music'), ('4', 'summer'), ('4', 'outdoor'),
('5', 'books'), ('5', 'literature'), ('5', 'education'),
('6', 'food'), ('6', 'culture'), ('6', 'festival'),
('7', 'halloween'), ('7', 'party'), ('7', 'costume'),
('8', 'market'), ('8', 'winter'), ('8', 'shopping'),
('9', 'newyear'), ('9', 'celebration'), ('9', 'dance'),
('10', 'easter'), ('10', 'family'), ('10', 'games');

INSERT INTO eventImages (eventID, imgurl)
VALUES('1', 'img/event1_thumb.jpg'),
('1', 'img/event1_banner.png'),
('1', 'img/event1_gallery_1.jpg'),
('2', 'img/event2_thumb.jpg'),
('2', 'img/event2_banner.png'),
('2', 'img/event2_gallery_1.jpg'),
('3', 'img/event3_thumb.jpg'),
('3', 'img/event3_banner.png'),
('3', 'img/event3_gallery_1.jpg'),
('4', 'img/event4_thumb.jpg'),
('4', 'img/event4_banner.png'),
('4', 'img/event4_gallery_1.jpg'),
('5', 'img/event5_thumb.jpg'),
('5', 'img/event5_banner.png'),
('5', 'img/event5_gallery_1.jpg'),
('6', 'img/event6_thumb.jpg'),
('6', 'img/event6_banner.png'),
('6', 'img/event6_gallery_1.jpg'),
('7', 'img/event7_thumb.jpg'),
('7', 'img/event7_banner.png'),
('7', 'img/event7_gallery_1.jpg'),
('8', 'img/event8_thumb.jpg'),
('8', 'img/event8_banner.png'),
('8', 'img/event8_gallery_1.jpg'),
('9', 'img/event9_thumb.jpg'),
('9', 'img/event9_banner.png'),
('9', 'img/event9_gallery_1.jpg'),
('10', 'img/event10_thumb.jpg'),
('10', 'img/event10_banner.png'),
('10', 'img/event10_gallery_1.jpg');

INSERT INTO users (userEmail, userName, userPassword, isVerified, isAdmin) VALUES
('alice@example.com', 'AliceWonder', 'securePassword1', 1, 0),
('bob@example.com', 'BobBuilder', '$2a$10$3R8q1einVQ5wONKxyIBaQOTK2rIVq/uQyFv0jRf42jaT56.b9vahu', 0, 1),
('carol@example.com', 'CarolSinger', 'melody2023', 1, 0),
('david@example.com', 'DavidExplorer', 'adventure4all', 1, 1),
('eva@example.com', 'EvaCreator', 'createInnovate', 1, 0);

INSERT INTO eventParticipants (eventID, userIP) VALUES
(2, '::ffff:127.0.0.1');