#!/usr/bin/env python3

import os
from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import ThreadedFTPServer


PORT = 8021
PERM_R = 'elr'
PERM_W = 'adfmw'
PERM_RW = PERM_R + PERM_W

USER_PASS_PATH_PERM = [
  ('user', 'passwd', 'home', PERM_R),
]


def main():
  authorizer = DummyAuthorizer()
  authorizer.add_anonymous(os.getcwd())
  for user, password, path, permission in USER_PASS_PATH_PERM:
    authorizer.add_user(user, password, path, perm=permission)

  handler = FTPHandler
  handler.authorizer = authorizer
  handler.passive_ports = range(8000, 9000)

  server = ThreadedFTPServer(('', PORT), handler)
  server.serve_forever()

if __name__ == "__main__":
  main()

