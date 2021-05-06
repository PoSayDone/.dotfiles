import sys
import http.server
import socketserver
import setproctitle

setproctitle.setproctitle('homepage')

PORT = 8000
DIRECTORY = "/home/posaydone/startpages/startpage_5/src"

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)


with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print("serving at port", PORT)
    httpd.serve_forever()
