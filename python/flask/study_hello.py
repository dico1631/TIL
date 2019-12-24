from flask import Flask, render_template
import random

app = Flask(__name__)

@app.route('/hello')
def hello():
    return "hello world"

@app.route('/house')
def house():
    time = 6
    return f"집에 가는 시간은 {time}시입니다."
    
@app.route("/info")
def info():
    name = "고민정"
    return render_template("info.html", name = name)

@app.route("/math2/<int:num>/<int:cube>")
def math2(num, cube):
    cube_num = num**cube
    return render_template("math2.html", num = num, cube_num = cube_num, cube = cube)

@app.route("/drink")
def drink():
    menu = ["아아", "믹스", "물", "뚱바", "카페쥬스"]
    pickdrink = random.choice(menu)
    menulist = {"아아":"https://www.mpps.co.kr/kfcs_api_img/KFCS/goods/DL_1444526_20191120095427842.png",
                "믹스":"http://image.auction.co.kr/itemimage/17/f7/78/17f7786bc1.jpg",
                "물":"https://image.ytn.co.kr/general/jpg/2018/0322/201803221750283662_t.jpg",
                "뚱바":"https://pbs.twimg.com/profile_images/992443110352289792/BtqxbM4w_400x400.jpg",
                "카페쥬스":"https://img6.yna.co.kr/mpic/YH/2018/11/08/MYH20181108004300704_P4.jpg"}
    img_drink = menulist[pickdrink]
    return render_template("drink.html", pickdrink = pickdrink, img_drink = img_drink)




if __name__ == "__main__":
    app.run(debug=True)