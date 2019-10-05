Insert into stuffy values
	(11, 'dummy', 'smurple', 's', 7);

UPDATE stuffy
SET 
    limbs = 6
WHERE
    id = 11;
    
DELETE FROM stuffy 
	WHERE id = 11;
