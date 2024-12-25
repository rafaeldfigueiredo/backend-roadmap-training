from django.shortcuts import render
from .models import TodoItem
def home(request):
    return render(request, 'myapp/home.html')
def todos(request):
    todos = TodoItem.objects.all()
    return render(request, 'myapp/todos.html', {'todos': todos})