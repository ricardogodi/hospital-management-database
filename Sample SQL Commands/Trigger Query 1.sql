--  This trigger query updates the room's capacity when a patient is added to the room 

DELIMITER //

CREATE TRIGGER update_room_capacity
AFTER INSERT ON PATIENTS
FOR EACH ROW
BEGIN
    UPDATE ROOMS
    SET capacity = capacity - 1
    WHERE room_number = NEW.room_number;
END //

DELIMITER ;
