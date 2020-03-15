CALL createProject('Private Project', 'root', false);
CALL duplicateProject(0, 1);

CALL createProject('Not Owned Public', 'root', true);
CALL duplicateProject(0, 2);
CALL addCollaborator('nnguyen1', 2)

CALL createProject('Not Owned Private', 'root', false);
CALL duplicateProject(0, 3);
CALL addCollaborator('nnguyen1', 3)