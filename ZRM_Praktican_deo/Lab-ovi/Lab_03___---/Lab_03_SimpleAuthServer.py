from http.server import HTTPServer, SimpleHTTPRequestHandler
import sys
import base64

key = ""

class AuthHandler(SimpleHTTPRequestHandler):
    ''' Main class to present webpages and authentication. '''
    def do_HEAD(self):
        print ("send header")
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_AUTHHEAD(self):
        print ("send header")
        self.send_response(401)
        self.send_header('WWW-Authenticate', 'Basic realm=\"Test\"')
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        global key
        ''' Present frontpage with user authentication. '''
        print (self.headers.get('Authorization'))
        if self.headers.get('Authorization') == None:
            self.do_AUTHHEAD()
            self.wfile.write('no auth header received'.encode())
            pass
        elif self.headers.get('Authorization') == 'Basic '+key.decode():
            SimpleHTTPRequestHandler.do_GET(self)
            pass
        else:
            self.do_AUTHHEAD()
            self.wfile.write(self.headers.get('Authorization').encode())
            self.wfile.write('not authenticated'.encode())
            pass

def test(HandlerClass = AuthHandler,
         ServerClass = HTTPServer):
    if sys.argv[1:]:
        port = int(sys.argv[1])
    else:
        port = 8000
    server_address = ('', port)

    HandlerClass.protocol_version = "HTTP/1.0"
    httpd = ServerClass(server_address, HandlerClass)

    sa = httpd.socket.getsockname()
    print ("Serving HTTP on", sa[0], "port", sa[1], "...")
    httpd.serve_forever()


if __name__ == '__main__':
    if len(sys.argv)<3:
        print ("usage SimpleAuthServer.py [port] [username:password]")
        sys.exit()
    key = base64.b64encode(sys.argv[2].encode())
    test()