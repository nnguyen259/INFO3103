CALL createProject('Private Project', 'root', false);
CALL duplicateProject(1, 2);

CALL createProject('Not Owned Public', 'root', true);
CALL duplicateProject(1, 3);
CALL addCollaborator('nnguyen1', 3);

CALL createProject('Not Owned Private', 'root', false);
CALL duplicateProject(1, 4);
CALL addCollaborator('nnguyen1', 4);