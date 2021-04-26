# function for check if postgres host is accepting connections
function_postgres_ready() {
python << END
import socket
import time
import os

port = int(os.environ["POSTGRES_PORT"])

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(('db', port))
s.close()
END
}

pip3 install -r requirements.txt

until function_postgres_ready; do
  >&2 echo "======= POSTGRES IS UNAVAILABLE, WAITING"
  sleep 1
done
echo "======= POSTGRES IS UP, CONNECTING"

python3 manage.py migrate

python3 manage.py runserver 0.0.0.0:8000