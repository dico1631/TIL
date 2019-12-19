from flask import Flask, render_template, request
app = Flask(__name__)

@app.route('/ping')
def ping():
    return render_template('ping.html')

@app.route('/pong')
def pong():
    #ping이 data 를 flask 서버로 보내면 그걸 처리해서 pong에 넘김
    #request.args.get('keyword')
    data = request.args.get('keyword')
    return render_template('pong.html', data = data)

@app.route('/naver')
def naver():
    return render_template('naver.html')

@app.route('/google')
def google():
    return render_template('google.html')





if __name__ == ('__main__'):
    app.run(debug=True)