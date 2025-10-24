from flask import Flask, render_template, request
import os
import pymysql

app = Flask(__name__)

# DB connection using environment variables with safe defaults
DB_HOST = os.environ.get('DB_HOST', 'localhost')
DB_PORT = int(os.environ.get('DB_PORT', 3306))
DB_USER = os.environ.get('DB_USER', 'madang')
DB_PASS = os.environ.get('DB_PASS', 'madang')
DB_NAME = os.environ.get('DB_NAME', 'madangdb')

def get_db_connection():
    return pymysql.connect(host=DB_HOST, port=DB_PORT, user=DB_USER,
                           passwd=DB_PASS, db=DB_NAME, charset='utf8')

@app.route('/')
def index():
    conn = get_db_connection()
    try:
        with conn.cursor() as cur:
            cur.execute("SELECT * FROM Book")
            book_list = cur.fetchall()
    finally:
        conn.close()
    return render_template('booklist.html', book_list=book_list)

@app.route('/view')
def getTicket():
   book_id = request.args.get('id')
   conn = get_db_connection()
   try:
       with conn.cursor() as cur:
           # parameterized query to avoid SQL injection
           cur.execute("SELECT * FROM Book WHERE bookid=%s", (book_id,))
           book = cur.fetchall()
   finally:
       conn.close()
   return render_template('bookview.html', book=book)

if __name__ == '__main__':
    # debug=True will auto-reload on code changes; change host or port if needed
    app.run(host='0.0.0.0', port=5000, debug=True)