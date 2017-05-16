use admin;
db.addUser({
  user:'admin', pwd:'admin',
  customData:{desc:'The admin user for admin db'},
  roles:['readWrite', 'dbAdmin', 'clusterAdmin']
});

use YOUR_DB;
db.addUser({
  user:'read_user', pwd:'read_user',
  customData:{desc:'The read only user for test database'},
  roles:['read']
});
db.addUser({
  user:'write_user', pwd:'write_user',
  customData:{desc:'The read write user for test database'},
  roles:['readWrite']
});

use admin;
db.shutdownServer();
