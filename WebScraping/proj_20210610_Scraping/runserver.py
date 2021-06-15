import http.server
import socketserver


# Inicializando o servidor web
# ============================================================================
PORT = 8000
HANDLER = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", PORT), HANDLER) as httpd:
    print("Servindo na porta:", PORT)
    httpd.serve_forever()
