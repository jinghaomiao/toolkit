#!/usr/bin/env python

import SimpleHTTPServer
import SocketServer

PORT = 8000
Handler = SimpleHTTPServer.SimpleHTTPRequestHandler
SocketServer.TCPServer(("", PORT), Handler).serve_forever()

