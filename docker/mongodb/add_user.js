// Usage:
//   mongo ${IP}:${PORT} < add_user.js

use <DB>;

db.addUser({
  user: '<readonly>',
  pwd: '<readonly>',
  roles: ['read'],
});

db.addUser({
  user: '<readwrite>',
  pwd: '<readwrite>',
  roles: ['readWrite'],
});
