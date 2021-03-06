from django.shortcuts import render
from django.http import HttpResponse
from .models import Question, Choice
from django.utils import timezone

# Create your views here.
def index(request):
    if request.method == 'POST':
        new_question = request.POST['new_question']
        q = Question(question_text=new_question, pub_date=timezone.now())
        q.save()

    object_Q = Question.objects.order_by('-pub_date')[:10]
    # output = ', '.join([q.question_text for q in object_Q])
    return render(request, 'polls/index.html', {'object_Q' : object_Q})

def detail(request, question_id): # 질문 상세 페이지
    if request.method == 'POST':
        add_option = request.POST['add_option']
        q = Choice(choice_text=add_option, votes=0, question_id=question_id)
        q.save()

    question = Question.objects.get(pk=question_id)
    return render(request, 'polls/detail.html', {'question' : question})

def results(request, question_id): # 투표 결과 페이지
    #question.id에 연결된 choice들의 이름과 votes의 수를 가져온다.
    question = Question.objects.get(pk=question_id)
    return render(request, 'polls/results.html', {'question':question})


def free(request):
    return render(request, 'polls/free.html', {})

def ours(request):
    return render(request, 'polls/ours.html', {})

def vote(request, question_id): # 투표 페이지
    choice = Choice.objects.get(pk=request.POST['choice'])
    choice.votes += 1
    choice.save()
    # 알람 띄우기 방법 1
    # return HttpResponse('<script>alert("투표했습니다.");history.back();</script>')
    # 알람 띄우기 방법 2 : ajax를 이용, 투표하는 화면(html)에서 사용
    # @csrf_expt : ajax 호출 시 주로 사용, csrf 사용하지 않기
    return HttpResponse('200')