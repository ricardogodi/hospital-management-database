--  This trigger query updates the room's capacity when a patient is removed from a room 


DELIMITER //

CREATE TRIGGER update_room_capacity
AFTER DELETE ON PATIENTS
FOR EACH ROW
BEGIN
    UPDATE ROOMS
    SET capacity = capacity + 1
    WHERE room_number = OLD.room_number;
END; //

DELIMITER ;