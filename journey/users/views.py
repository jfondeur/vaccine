from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .forms import UserRegisterForm, UserUpdateForm, UserPofileForm

# Create your views here.
def register(request):
    #if form is submited
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        #if form data is valid
        if form.is_valid():
            form.save()
            #get data cleand to django
            username = form.cleaned_data.get('username')
            #create success message
            messages.success(request, f'Account created for {username}!')
            #redirect to selected page
            return redirect('login')
    else:
        form = UserRegisterForm()
    return render(request, 'users/register.html', {'form': form})

@login_required
def profile(request):
    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = UserPofileForm(request.POST, request.FILES, instance=request.user.profile)
        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, f'User updated')
            return redirect('profile')

    else:
        u_form = UserUpdateForm(instance=request.user)
        p_form = UserPofileForm(instance=request.user.profile)

    context = {
        'u_form': u_form,
        'p_form': p_form,
    }
    return render(request, 'users/profile.html', context)
