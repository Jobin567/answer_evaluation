from datetime import datetime

import math
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.db.models import *
from django.http import HttpResponse
from django.shortcuts import render
from subapp.test import checkans,checkans1

# Create your views here.
from subapp.models import *

def logout(request):
    auth.logout(request)
    return render(request,'login_index.html')


def login(request):
    return render(request,'login_index.html')

def login_code(request):
    username=request.POST['textfield']
    password=request.POST['textfield2']
    try:
        login_obj=login_table.objects.get(username=username,password=password)
        if login_obj.type=='admin':
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request,ob1)
            return HttpResponse('''<script>alert('login success');window.location="adminhome"</script>''')
        elif login_obj.type == 'hod':
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request, ob1)
                request.session['lid']=login_obj.id
            return HttpResponse('''<script>alert('login success');window.location="hodhome"</script>''')

        elif login_obj.type =='staff':
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request, ob1)
                request.session['lid'] = login_obj.id
            return HttpResponse('''<script>alert('login success');window.location="/shme"</script>''')
        else:
            return HttpResponse('''<script>alert('invalid');window.location="/"</script>''')
    except:
        return HttpResponse('''<script>alert('error');window.location="/"</script>''')
@login_required(login_url='/')
def add_dept(request):
    return render(request,'add_dept.html')

def StaffHome(request):
    return render(request,'StaffHome.html')

@login_required(login_url='/')
def adddeptcode(request):
    department=request.POST['textfield']

    ob=department_table()
    ob.departmentname=department
    ob.save()
    return HttpResponse('''<script>alert('Add Success');window.location="/view_dept"</script>''')

@login_required(login_url='/')
def editdep(request,id):
    ob=department_table.objects.get(id=id)
    request.session['did']=id
    return render(request,'editdept.html',{'val':ob})


@login_required(login_url='/')
def editdeptcode(request):
    department=request.POST['textfield']

    ob=department_table.objects.get(id=request.session['did'])
    ob.departmentname=department
    ob.save()
    return HttpResponse('''<script>alert('Edit Success');window.location="/view_dept"</script>''')




@login_required(login_url='/')
def addhod(request):
    ob=department_table.objects.all()
    return render(request,'addhod.html',{'val':ob})

@login_required(login_url='/')
def addhodcode(request):
    name=request.POST['textfield']
    email=request.POST['textfield2']
    phone = request.POST['textfield3']
    place = request.POST['textfield4']
    pin= request.POST['textfield5']
    post = request.POST['textfield6']
    department = request.POST['select']

    username = request.POST['textfield7']
    password = request.POST['textfield8']

    ob1=login_table()
    ob1.username=username
    ob1.password=password
    ob1.type='hod'
    ob1.save()


    ob=hod_table()
    ob.login=ob1
    ob.name=name
    ob.email=email
    ob.phone=phone
    ob.place=place
    ob.pin=pin
    ob.post=post
    ob.dep=department_table.objects.get(id=department)
    ob.save()
    return HttpResponse('''<script>alert('Add Success');window.location="/viewhod"</script>''')

@login_required(login_url='/')
def edithod(request,id):
    ob=hod_table.objects.get(id=id)
    request.session['did']=id
    ob1=department_table.objects.all()
    return render(request,'edithod.html',{'val':ob,'dep':ob1})

@login_required(login_url='/')
def edithodcode(request):
    name=request.POST['textfield']
    email=request.POST['textfield2']
    phone = request.POST['textfield3']
    place = request.POST['textfield4']
    pin= request.POST['textfield5']
    post = request.POST['textfield6']
    department = request.POST['select']



    ob=hod_table.objects.get(id=request.session['did'])
    ob.name=name
    ob.email=email
    ob.phone=phone
    ob.place=place
    ob.pin=pin
    ob.post=post
    ob.dep=department_table.objects.get(id=department)
    ob.save()
    return HttpResponse('''<script>alert('Edit Success');window.location="/viewhod"</script>''')








@login_required(login_url='/')
def addmaterial(request):
    return render(request,'addmaterial.html')

@login_required(login_url='/')
def addquestion(request):
    return render(request,'addquestion.html')

@login_required(login_url='/')
def addstaff(request):
    return render(request,'addstaff.html')

@login_required(login_url='/')
def addstaff_post(request):
    name = request.POST['textfield']
    email = request.POST['textfield2']
    phone = request.POST['textfield3']
    place = request.POST['textfield4']
    pin = request.POST['textfield5']
    post = request.POST['textfield6']
    image = request.FILES['file']
    fs=FileSystemStorage()
    fn=fs.save(image.name,image)
    username = request.POST['textfield7']
    password = request.POST['textfield8']
    ob=login_table()
    ob.username=username
    ob.password=password
    ob.type="staff"
    ob.save()

    oo=staff_table()
    oo.name=name
    oo.email=email
    oo.phone=phone
    oo.place=place
    oo.pin=pin
    oo.post=post
    oo.image=fn
    oo.login=ob
    oo.hod=hod_table.objects.get(login__id=request.session['lid'])
    oo.save()
    return HttpResponse('''<script>alert('success');window.location='/addstaff'</script>''')

@login_required(login_url='/')
def deletestaff(request, id):
    ob = staff_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('success');window.location='/viewstaff'</script>''')

@login_required(login_url='/')
def editstaff(request, id):
    ob = staff_table.objects.get(id=id)
    request.session['staff_id'] = id
    return render(request,'editstaff.html',{'val': ob})

@login_required(login_url='/')
def editstaff_post(request):
    try:
        name = request.POST['textfield']
        email = request.POST['textfield2']
        phone = request.POST['textfield3']
        place = request.POST['textfield4']
        pin = request.POST['textfield5']
        post = request.POST['textfield6']
        image = request.FILES['file']
        fs=FileSystemStorage()
        fn=fs.save(image.name,image)

        oo=staff_table.objects.get(id=request.session['staff_id'])
        oo.name=name
        oo.email=email
        oo.phone=phone
        oo.place=place
        oo.pin=pin
        oo.post=post
        oo.image=fn
        oo.hod=hod_table.objects.get(login__id=request.session['lid'])
        oo.save()
        return HttpResponse('''<script>alert('success');window.location='/addstaff'</script>''')
    except:
        name = request.POST['textfield']
        email = request.POST['textfield2']
        phone = request.POST['textfield3']
        place = request.POST['textfield4']
        pin = request.POST['textfield5']
        post = request.POST['textfield6']

        oo = staff_table.objects.get(id=request.session['staff_id'])
        oo.name = name
        oo.email = email
        oo.phone = phone
        oo.place = place
        oo.pin = pin
        oo.post = post
        oo.hod = hod_table.objects.get(login__id=request.session['lid'])
        oo.save()
        return HttpResponse('''<script>alert('success');window.location='/addstaff'</script>''')


@login_required(login_url='/')
def addstudent(request):
    ob = course_table.objects.all()
    return render(request,'addstudent.html', {'val': ob})

@login_required(login_url='/')
def addstudent_post(request):
    name = request.POST['textfield']
    email = request.POST['textfield2']
    phone = request.POST['textfield3']
    place = request.POST['textfield4']
    pin = request.POST['textfield5']
    post = request.POST['textfield6']
    image = request.FILES['file']
    courseid = request.POST['select']
    fs = FileSystemStorage()
    fn = fs.save(image.name, image)
    username = request.POST['textfield7']
    password = request.POST['textfield8']
    ob = login_table()
    ob.username = username
    ob.password = password
    ob.type = "student"
    ob.save()

    oo = student_table()
    oo.name = name
    oo.email = email
    oo.phone = phone
    oo.place = place
    oo.pin = pin
    oo.course_id=courseid
    oo.hod_table=hod_table.objects.get(login__id=request.session['lid'])
    oo.post = post
    oo.image = fn
    oo.login = ob
    oo.save()
    return HttpResponse('''<script>alert('success');window.location='/addstudent'</script>''')

@login_required(login_url='/')
def addsubject(request):
    ob=course_table.objects.all()

    return render(request,'addsubject.html',{'val':ob})

@login_required(login_url='/')
def addsubjectcode(request):
    course=request.POST['select']
    subject=request.POST['textfield']
    sem=request.POST['select2']
    ob=subject_table()
    ob.courseid=course_table.objects.get(id=course)
    ob.subjectname=subject
    ob.sem=sem
    ob.save()
    return HttpResponse('''<script>alert('Add Success');window.location="/viewsubject"</script>''')

@login_required(login_url='/')
def editstudent(request, id):
    ob = course_table.objects.all()
    request.session['student_id'] = id

    da=student_table.objects.get(id=id)

    return render(request,'editstudent.html', {'val': da,"corse":ob})

@login_required(login_url='/')
def deletestudent(request, id):
    ob = student_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('success');window.location='/viewstudent'</script>''')



@login_required(login_url='/')
def editstaff_post(request):
    try:
        name = request.POST['textfield']
        email = request.POST['textfield2']
        phone = request.POST['textfield3']
        place = request.POST['textfield4']
        pin = request.POST['textfield5']
        post = request.POST['textfield6']
        image = request.FILES['file']
        fs=FileSystemStorage()
        fn=fs.save(image.name,image)

        oo=staff_table.objects.get(id=request.session['staff_id'])
        oo.name=name
        oo.email=email
        oo.phone=phone
        oo.place=place
        oo.pin=pin
        oo.post=post
        oo.image=fn
        oo.hod=hod_table.objects.get(login__id=request.session['lid'])
        oo.save()
        return HttpResponse('''<script>alert('success');window.location='/addstaff'</script>''')
    except:
        name = request.POST['textfield']
        email = request.POST['textfield2']
        phone = request.POST['textfield3']
        place = request.POST['textfield4']
        pin = request.POST['textfield5']
        post = request.POST['textfield6']

        oo = staff_table.objects.get(id=request.session['staff_id'])
        oo.name = name
        oo.email = email
        oo.phone = phone
        oo.place = place
        oo.pin = pin
        oo.post = post
        oo.hod = hod_table.objects.get(login__id=request.session['lid'])
        oo.save()
        return HttpResponse('''<script>alert('success');window.location='/addstaff'</script>''')

def editstudent_post(request):
    try:
        name = request.POST['textfield']
        email = request.POST['textfield2']
        phone = request.POST['textfield3']
        place = request.POST['textfield4']
        pin = request.POST['textfield5']
        post = request.POST['textfield6']
        image = request.FILES['file']
        fs=FileSystemStorage()
        fn=fs.save(image.name,image)

        oo=student_table.objects.get(id=request.session['student_id'])
        oo.name=name
        oo.email=email
        oo.phone=phone
        oo.place=place
        oo.pin=pin
        oo.post=post
        oo.image=fn
        oo.hod=hod_table.objects.get(login__id=request.session['lid'])
        oo.save()
        return HttpResponse('''<script>alert('success');window.location='/addstudent'</script>''')
    except:
        name = request.POST['textfield']
        email = request.POST['textfield2']
        phone = request.POST['textfield3']
        place = request.POST['textfield4']
        pin = request.POST['textfield5']
        post = request.POST['textfield6']

        oo = student_table.objects.get(id=request.session['student_id'])
        oo.name = name
        oo.email = email
        oo.phone = phone
        oo.place = place
        oo.pin = pin
        oo.post = post
        oo.hod = hod_table.objects.get(login__id=request.session['lid'])
        oo.save()
        return HttpResponse('''<script>alert('success');window.location='/addstudent'</script>''')



@login_required(login_url='/')
def addsubject(request):
    ob=course_table.objects.all()

    return render(request,'addsubject.html',{'val':ob})

@login_required(login_url='/')
def addsubjectcode(request):
    print(request.POST)
    course=request.POST['select']
    subject=request.POST['textfield']
    sem=request.POST['select2']
    ob=subject_table()
    ob.courseid=course_table.objects.get(id=course)
    ob.subjectname=subject
    ob.sem=sem
    ob.save()
    return HttpResponse('''<script>alert('Add Success');window.location="/viewsubject"</script>''')



@login_required(login_url='/')
def addvideo(request):
    return render(request,'addvideo.html')

@login_required(login_url='/')
def assignsubject(request):
    ob = staff_table.objects.all()
    ob1=subject_table.objects.all()

    return render(request,'assignsubject.html',{'val':ob,"sub":ob1})



@login_required(login_url='/')
def assignsubject_post(request):
    staffid = request.POST['select']
    subid = request.POST['select2']
    ob=assignedsubject_table()
    ob.staffid=staff_table.objects.get(id=staffid)
    ob.subject=subject_table.objects.get(id=subid)
    ob.save()
    return HttpResponse('''<script>alert('Add Success');window.location="/assignsubject"</script>''')


@login_required(login_url='/')
def course(request):
    ob=department_table.objects.all()
    return render(request,'course.html',{'val':ob})

@login_required(login_url='/')
def coursecode(request):
    department=request.POST['select']
    coursename=request.POST['textfield']
    ob=course_table()
    ob.department_id=department
    ob.coursename=coursename
    ob.dep=department_table.objects.get(id=department)
    ob.save()
    return HttpResponse('''<script>alert('Add Success');window.location="/viewcourse"</script>''')

@login_required(login_url='/')
def editcourse(request,id):
    ob=course_table.objects.get(id=id)
    request.session['did']=id
    obb=department_table.objects.all()
    return render(request,'editcourse.html',{'val':ob,'dep':obb})

@login_required(login_url='/')
def editcoursecode(request):
    department=request.POST['select']
    coursename=request.POST['textfield']
    ob=course_table.objects.get(id=request.session['did'])
    ob.department_id=department
    ob.coursename=coursename
    ob.save()
    return HttpResponse('''<script>alert('Edit Success');window.location="/viewcourse"</script>''')




@login_required(login_url='/')
def exam(request):
    return render(request,'exam.html')

@login_required(login_url='/')
def questions(request):
    return render(request,'questions.html')

@login_required(login_url='/')
def sendcomplaint(request,id):
    request.session['oo']=id
    return render(request,'sendcomplaint.html')

@login_required(login_url='/')
def replycode(request):
    reply=request.POST['textarea']
    ob=complaint_table.objects.get(id=request.session['oo'])
    ob.reply=reply
    ob.save()
    return HttpResponse('''<script>alert('Reply Sent');window.location="/viewcomplaint"</script>''')


@login_required(login_url='/')
def view_dept(request):
    ob=department_table.objects.all()
    return render(request,'view_dept.html',{"val":ob})

@login_required(login_url='/')
def deletedeprt(request,id):
    ob=department_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('Deleted ');window.location="/view_dept"</script>''')

@login_required(login_url='/')
def viewcomplaint(request):
    ob=complaint_table.objects.all()
    return render(request,'viewcomplaint.html',{"val":ob})

@login_required(login_url='/')
def viewcomplaint_search(request):
    search = request.POST['search']
    ob=complaint_table.objects.filter(date__icontains=search)
    return render(request,'viewcomplaint.html',{"val":ob, "search": search})


@login_required(login_url='/')
def viewcourse(request):
    ob=course_table.objects.all()
    return render(request,'viewcourse.html',{"val":ob})

@login_required(login_url='/')
def deletecourse(request,id):
    ob=course_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('Deleted ');window.location="/viewcourse"</script>''')


@login_required(login_url='/')
def viewhod(request):
    ob=hod_table.objects.all()
    return render(request,'viewhod.html',{"val":ob})

@login_required(login_url='/')
def viewhod_search(request):
    search = request.POST['search']
    ob=hod_table.objects.filter(name__icontains=search)
    return render(request,'viewhod.html',{"val":ob, "search": search})

@login_required(login_url='/')
def deletehod(request,id):
    ob=login_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('Deleted ');window.location="/viewhod"</script>''')



@login_required(login_url='/')
def viewmaterial(request):
    return render(request,'viewmaterial.html')

@login_required(login_url='/')
def viewstaff(request):
    ob=staff_table.objects.filter(hod__login__id=request.session['lid'])
    return render(request,'viewstaff.html',{"val":ob})

@login_required(login_url='/')
def viewstudent(request):
    ob=student_table.objects.filter(hod_table__login__id=request.session['lid'])
    return render(request,'viewstudent.html',{"val":ob})

@login_required(login_url='/')
def viewsubject(request):
    ob=subject_table.objects.all()
    return render(request,'viewsubject.html',{"val":ob})



@login_required(login_url='/')
def deletesubject(request,id):
    ob=subject_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('Deleted ');window.location="/viewsubject"</script>''')

@login_required(login_url='/')
def viewassignsubject(request):
    ob=subject_table.objects.all()
    return render(request,'viewsubject.html',{"val":ob})



@login_required(login_url='/')
def viewvideo(request):
    return render(request,'viewvideo.html')

@login_required(login_url='/')
def adminhome(request):
    return render(request,'admin_index.html')

@login_required(login_url='/')
def hodhome(request):
    return render(request,'hod_index.html')








def add_std(request):
    ob=course_table.objects.all()
    obb=student_table.objects.all()
    return render(request, 'staff/add student.html',{'val':ob,'val1':obb})

def search_std(request):
    ob = course_table.objects.all()
    cid=request.POST['select']
    # sem=request.POST['select2']
    obb = student_table.objects.filter(course__id=cid)
    return render(request, 'staff/add student.html', {'val': ob, 'val1': obb})

def vasub(request):
    ob = assignedsubject_table.objects.filter(staffid=staff_table.objects.get(login=request.session["lid"]))
    print("===",ob)
    print("===",request.session["lid"])
    return render(request, 'staff/view assigned subject.html',{"data":ob})

def manage_exam(request):
    ob=exam_table.objects.filter(subject__STAFF__LOGIN=request.session["lid"])
    return render(request, 'staff/manage exam.html', {'val':ob})

def mng_qus(request):
    # ob = question_table.objects.filter(assign_sub__STAFF__LOGIN=request.session["lid"])
    obb = exam_table.objects.filter(subjectassignedid__staffid__login__id=request.session['lid'])
    return render(request,'staff/manage questions.html',{'exam':obb})
def search_qus(request):

    search = request.POST['select']
    ob = questions_table.objects.filter(Exam__id=search)


    obb = exam_table.objects.filter(subjectassignedid__staffid__login_id=request.session['lid'])
    return render(request, 'staff/manage questions.html', {'sub': ob, 'exam':obb, 'search': int(search)})


def mng_qus_delete(request,id):
    ob=questions_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted succesfully');window.location='/mng_qus'</script>''')



def add_exm(request):
    ob = assignedsubject_table.objects.filter(staffid__login__id=request.session["lid"])
    return render(request, 'staff/Add exam.html', {'ob':ob})

def add_exam_post(request):
    subject = request.POST['select']
    date = request.POST['d1']
    time = request.POST['t1']
    ob=exam_table()
    ob.subjectassignedid_id =subject
    ob.examname=request.POST['name']
    ob.examdate=date
    ob.time=time
    ob.save()
    return HttpResponse('''<script>alert('added');window.location='/manage_exam'</script>''')

def delete_exam_post(request,id):
    ob = exam_table.objects.filter(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted succesfully');window.location='/manage_exam'</script>''')


def manage_exam(request):
    ob=exam_table.objects.filter(subjectassignedid__staffid__login__id=request.session["lid"])
    return render(request, 'staff/manage exam.html', {'val':ob})
def add_q(request):
    ob=exam_table.objects.filter(subjectassignedid__staffid__login=request.session['lid'])
    return render(request, 'staff/Add q.html',{'val':ob})
def wrst(request,id):

    ob=exam_table.objects.get(id=id)

    obb=ob.subjectassignedid
    sub=obb.subject
    crs=sub.courseid.id
    sem=sub.sem
    data = []
    obstudents=student_table.objects.filter(course__id=crs)
    for student in obstudents:
        obr = attendexam_table.objects.filter(studentid__id=student.id,questions__Exam__id=ob.id)
        print(obr)
        row = {"studentname": ob.examname, "exam": student.name, }
                   # }"questions": i.questions.questions,
        fm=0    # "date": str(i.date), "result": i.answers, "mark": i.mark, "status": i.status}
        tm=0
        for i in obr:
            tm+=float(i.mark)
            fm+=float(i.questions.Mark)
            # row = {"studentname": i.questions.Exam.examname, "exam": i.studentid.name, "questions": i.questions.questions,
            #        "date": str(i.date), "result": i.answers, "mark": i.mark, "status": i.status}
        row['fm']=fm
        row['tm']=tm
        data.append(row)
    # ob=result_table.objects.filter(QUESTION__EXAMID__id=id)
    # sid=[]
    # for i in ob:
    #     l=4
    #     sid.append(i.STUDENT.id)
    # obs=students_table.objects.filter(id__in=sid)
    # for i in obs:
    #     obr=result_table.objects.filter(QUESTION__EXAMID__id=id,STUDENT__id=i.id)
    #     tm=0
    #     for j in obr:
    #         tm+=j.result
    #     i.mark=tm
    print(data)
    return render(request, 'staff/view reslt.html',{"val":data})


def  viewresult(request):
    print(request.POST)
    ob = attendexam_table.objects.filter(studentid__login__id=request.POST['lid'])
    print(ob)
    data = []
    for i in ob:
        row = {"studentname": i.questions.Exam.examname,"exam": i.studentid.name, "questions": i.questions.questions, "date":str(i.date), "result":i.answers, "mark":i.mark, "status":i.status }
        data.append(row)

    r = json.dumps(data)
    print(r)
    return HttpResponse(r)


def shme(request):
    return render(request, 'staff/newstaffindex.html')

def add_question(request):
    question = request.POST['textfield']
    answer = request.POST['textfield2']
    asub = request.POST['select']
    ob = questions_table()
    ob.Exam=exam_table.objects.get(id=asub)
    ob.questions = question
    ob.answers = answer
    ob.Mark=10
    ob.save()
    return HttpResponse('''<script>alert('added succesfully');window.location='/mng_qus'</script>''')

#_________________________WEBSERVICE____STUDENT______________________




from django.core import serializers
import json
from django.http import JsonResponse

def logincode(request):
     print(request.POST)
     un=request.POST['uname']
     pwd=request.POST['pass']
     print(un,pwd)
     try:
         users = login_table.objects.get(username=un,password=pwd)


         if users is None:
                data = {"task": "invalid"}
         else:
                print("in user function")
                data = {"task":"valid","id":users.id,"type":users.type}
         r = json.dumps(data)

         print (r)
         return HttpResponse(r)
     except Exception as e:
         print(e,"hhhhhhhhhhhhhhhhhhhhh")
         data = {"task": "invalid"}
         r = json.dumps(data)
         print(r)
         return HttpResponse(r)



def  viewsubject1(request):
    print(request.POST)
    # sem=request.POST["sem"]
    lid=request.POST["lid"]
    x=student_table.objects.get(login=lid)
    # , sem = sem
    ob = subject_table.objects.filter(courseid=x.course.id)
    data = []
    for i in ob:
        row = {"subject": i.subjectname, "course": i.courseid.coursename,'id':i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def  viewexam(request):
    lid=request.POST["lid"]
    sem=request.POST["sem"]
    ss=student_table.objects.get(login=lid)
    ob = exam_table.objects.filter(subjectassignedid__subject__courseid=ss.course.id,subjectassignedid__subject__sem=sem)
    data = []
    for i in ob:
        xx=attendexam_table.objects.filter(questions__Exam=i.id,studentid__login=lid)
        if len(xx)>0:
            pass
        else:
            print(i.status,"====")
            row = {"subject": i.subjectassignedid.subject.subjectname,  "examname": i.examname, "examdate":str(i.examdate),"uploaddate":str(i.uploaddate),"examid":i.id,"status":i.status}
            data.append(row)
    r = json.dumps(data)

    print(data)
    return HttpResponse(r)


def viewexamquestions(request):
    lid = request.POST['exam_id']
    ob = questions_table.objects.filter(Exam__id=lid)
    data = []
    for i in ob:
        row = {"id": i.id, "question": i.questions,"mark":i.Mark }
        data.append(row)
    r = json.dumps(data)
    print(data)
    return HttpResponse(r)







def  viewreply(request):
    lid=request.POST['lid']
    ob = complaint_table.objects.filter(STUDENT__login__id=lid)
    data = []
    for i in ob:
        row = { "id":i.id,"complaint": i.complaint,"reply":i.reply,"date":str(i.date)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)


def sendcomplaints(request):
    lid=request.POST['lid']
    complaint=request.POST['complaint']
    reply='pending'
    date = datetime.today()
    feed=complaint_table()
    feed.STUDENT=student_table.objects.get(login__id=lid)
    feed.date=date
    feed.complaint=complaint
    feed.reply=reply
    feed.save()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def attendexam(request):
    studentid=request.POST['lid']
    questionid=request.POST['question_id']
    answer=request.POST["answer"]
    date= datetime.today()
    status = "pending"


    feed=attendexam_table()
    feed.studentid=student_table.objects.get(login__id=studentid)
    feed.questions_id=questionid
    feed.date=date
    feed.answers=answer

    q=questions_table.objects.get(id=questionid)
    orginal_mark=q.Mark
    res = checkans(answer.lower(), q.answers.lower())
    print(res, "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj")
    x = round(res, 2)
    sim = int(float(x) * 100)
    print("-----------sim,", int(sim))

    mark = (int(orginal_mark) / 100) * int(sim)

    feed.mark=mark
    feed.status=status
    feed.save()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def student_viewattendexam(request):
    lid=request.POST["lid"]

    ss = student_table.objects.get(login=lid)
    ob = exam_table.objects.filter(subjectassignedid__subject__courseid=ss.course.id)
    data = []
    for i in ob:
        attendmark=0
        xx = attendexam_table.objects.filter(questions__Exam=i.id,studentid__login=lid)
        for v in xx:
            attendmark=math.ceil(attendmark+float(v.mark))


        if len(xx) > 0:
            tot_mark=0
            m=questions_table.objects.filter(Exam=i.id)
            for mm in m:
                tot_mark=tot_mark+float(mm.Mark)
                # rounded_value = math.ceil(tot_mark)

            row = {"subject": i.subjectassignedid.subject.subjectname, "examname": i.examname,
                   "examdate": str(i.examdate), "uploaddate": str(i.uploaddate), "examid": i.id,"mark":str(attendmark)+"/"+str(int(tot_mark))}
            data.append(row)

        else:
            pass

    r = json.dumps(data)

    print(data)
    return HttpResponse(r)



def studentviewexamresult(request):
    print(request.POST,"llllllllllll")
    examid = request.POST["examid"]
    lid=request.POST["lid"]

    ex=questions_table.objects.filter(Exam=examid)

    data=[]
    for i in ex:
        print(ex,"jjjjjjjjjjjjjj")
        attenex=attendexam_table.objects.get(questions__id=i.id,studentid__login__id=lid)
        print(attenex, "jjjkkkkkkkkkjjjjjj")
        # rss=checkans1(attenex.answers,i.answers)
        # if len(attenex)>0:

        # res=find_summary("how "+i.answers+" this sentance differe from this "+attenex.answers )
        row={"question":i.questions,"org_anwer":i.answers,"ans":attenex.answers,"mark":attenex.mark,"points":"no"}
        data.append(row)

    r = json.dumps(data)

    print(data)
    return HttpResponse(r)


def missing_keys(request):
    org_answer=request.POST["org_ans"]
    ans=request.POST["ans"]

    print("org_anser..................")
    print(org_answer)
    print("anser..................")
    print(ans)


    res = find_summary("how " + org_answer + " this sentance differe from this " + ans)
    data={"task":"valid","res":res}
    r = json.dumps(data)

    print(data)
    return HttpResponse(r)


import google.generativeai as genai

genai.configure(api_key="AIzaSyDQEA8_tioJbNqFanbkRWyOqgNc3G5BVko")
def find_summary(text):
# Set up the model
  generation_config = {
    "temperature": 1,
    "top_p": 0.95,
    "top_k": 0,
    "max_output_tokens": 8192,
  }

  safety_settings = [
    {
      "category": "HARM_CATEGORY_HARASSMENT",
      "threshold": "BLOCK_MEDIUM_AND_ABOVE"
    },
    {
      "category": "HARM_CATEGORY_HATE_SPEECH",
      "threshold": "BLOCK_MEDIUM_AND_ABOVE"
    },
    {
      "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
      "threshold": "BLOCK_MEDIUM_AND_ABOVE"
    },
    {
      "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
      "threshold": "BLOCK_MEDIUM_AND_ABOVE"
    },
  ]

  model = genai.GenerativeModel(model_name="gemini-1.5-pro-latest",
                                generation_config=generation_config,
                                safety_settings=safety_settings)

  convo = model.start_chat(history=[
  ])

  convo.send_message(text)
  return (convo.last.text)





# staff

def viewexam1(request):
    lid=request.POST["lid"]

    ob = exam_table.objects.filter(subjectassignedid__staffid__login=lid)
    data = []
    for i in ob:
        row = {"id": i.id, "examname": i.examname }
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def staffviewexamquestions(request):
    examid = request.POST["examid"]
    ob = questions_table.objects.filter(Exam__id=examid)
    data = []
    for i in ob:
        row = {"id": i.id, "questions": i.questions,"answers":i.answers}
        data.append(row)
    r = json.dumps(data)
    print(data)
    return HttpResponse(r)
def staff_del_questions(request):
    qid=request.POST["qid"]
    questions_table.objects.get(id=qid).delete()
    data={"task":"valid"}
    r = json.dumps(data)
    print(data)
    return HttpResponse(r)

def viewassignedsubject(request):
    lid=request.POST['lid']
    print(lid)
    ob = assignedsubject_table.objects.filter(staffid__login__id=lid)
    data = []
    for i in ob:
        row = {"subject": i.subject.subjectname,'id':i.id,"sem":i.subject.sem}
        data.append(row)
    print(data)
    r = json.dumps(data)
    return HttpResponse(r)
def staff_view_uploaded_exam(request):
    subassign_id=request.POST["subassign_id"]

    ob=exam_table.objects.filter(subjectassignedid=subassign_id)
    data = []
    for i in ob:
        row = {"examname": i.examname, 'id': i.id, "examdate": str(i.examdate),"uploaddate":str(i.uploaddate),"status":i.status}
        data.append(row)
    print(data)
    r = json.dumps(data)
    return HttpResponse(r)

def staff_update_examstatus(request):
    examid=request.POST["examid"]
    status=request.POST["st"]
    ob=exam_table.objects.get(id=examid)
    ob.status=status
    ob.save()

    s={"task":"valid"}
    r = json.dumps(s)
    return HttpResponse(r)


def staff_view_examatten_student(request):
    examid=request.POST["examid"]

    ob=attendexam_table.objects.filter(questions__Exam=examid)
    studentlist=[]

    for i in ob:
        if i.studentid.id in studentlist:
            pass
        else:
            studentlist.append(i.studentid.id)
    data=[]
    for j in studentlist:
        xx=student_table.objects.get(id=j)
        row={"id":xx.id,"name":xx.name,"image":str(xx.image.url)}
        data.append(row)
    r=json.dumps(data)
    return HttpResponse(r)


def staff_view_exam_question_answer(request):
    examid=request.POST["exammid"]
    studentid=request.POST["sid"]
    print(examid,studentid)

    ob=attendexam_table.objects.filter(studentid=studentid,questions__Exam=examid)
    data=[]
    for i in ob:
        row = {"question": i.questions.questions, "org_anwer": i.questions.answers, "ans": i.answers, "mark": str(math.ceil(float(i.mark))),"attid":i.id,"org_mark":i.questions.Mark}
        data.append(row)


    r = json.dumps(data)

    print(data)
    return HttpResponse(r)
def staff_update_mark(request):
    attendid=request.POST["attenid"]
    mark=request.POST["mark"]
    ob=attendexam_table.objects.get(id=attendid)
    ob.mark=mark
    ob.save()

    data={"task":"valid"}
    r=json.dumps(data)
    return HttpResponse(r)

def addexam(request):
    subjectassignedid=request.POST['sid']
    lid=request.POST['lid']
    examname=request.POST['examname']
    uploaddate=datetime.now().date()
    examdate = request.POST["date"]

    feed=exam_table()
    feed.subjectassignedid=assignedsubject_table.objects.get(id=subjectassignedid)
    feed.examname=examname
    feed.examdate=examdate
    feed.uploaddate=uploaddate
    feed.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

# def viewexam(request):
#     ob = exam_table.objects.all()
#     data = []
#     for i in ob:
#         row = {"subject": i.subjectassignedid.subject.subjectname, "examname": i.examname, "examdate":str(i.examdate),"uploaddata":str(i.uploaddate) }
#         data.append(row)
#     r = json.dumps(data)
#     print(data)
#     return HttpResponse(r)



def question(request):
    Exam = request.POST['exid']
    questions=request.POST['questions']
    answers=request.POST['answers']
    mark=request.POST['Mark']

    feed=questions_table()
    feed.Exam=exam_table.objects.get(id=Exam)
    feed.questions=questions
    feed.answers=answers


    feed.Mark=mark
    feed.save()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)



def  viewquestion(request):
    ob = questions_table.objects.all()
    data = []
    for i in ob:
        row = {"Exam": i.Exam.examname, "questions": i.questions.questions, "answers":i.answers, }
        data.append(row)

    r = json.dumps(data)
    return HttpResponse(r)



def  viewresult(request):
    print(request.POST)
    ob = attendexam_table.objects.filter(studentid__login__id=request.POST['lid'])
    print(ob)
    data = []
    for i in ob:
        row = {"studentname": i.questions.Exam.examname,"exam": i.studentid.name, "questions": i.questions.questions, "date":str(i.date), "result":i.answers, "mark":i.mark, "status":i.status }
        data.append(row)

    r = json.dumps(data)
    print(r)
    return HttpResponse(r)


def  viewresultstaff(request):
    lid=request.POST['lid']
    o=assignedsubject_table.objects.filter(staffid__login__id=lid)
    slist=[]
    assignid=[]
    for i in o:
        slist.append(i.subject.courseid.id)
        # slist.append(i.subject.id)
        assignid.append(i.id)
    print(slist,"subject")
    kk=student_table.objects.filter(course__id__in=slist)
    print(kk, "student")
    data = []
    obe=exam_table.objects.filter(subjectassignedid__in=assignid)
    for i in kk:
        print(i.id, "student")
        for j in obe:

            ob = attendexam_table.objects.filter(studentid__id=i.id,questions__Exam__id=j.id)
            if len(ob)>0:
                print(ob, "test")
                tm=0
                for p in ob:
                    tm=math.ceil(tm+float(p.mark))
                row = {"student": i.name,  "mark":j.examname+" "+str(tm) }
                data.append(row)
            else:pass
    r = json.dumps(data)
    print(data)
    return HttpResponse(r)


# CHA


#
# def viewchat(request):
#     ob = student_table.objects.all()
#     data = []
#     for i in ob:
#         row = {"name": i.name, "phone": i.phonenumber, "image": i.image.url[7:]}
#         data.append(row)
#     r = json.dumps(data)
#     return HttpResponse(r)
#

def student_view(request):
    ob = student_table.objects.all()
    data = []
    for i in ob:
        row = {"name": i.name, "phone": i.phone, "image": i.image.url,"id":i.login.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)


def staff_view(request):
    ob = staff_table.objects.all()
    print(ob,"jkjkkkkkkkkkkkkkkk")
    data = []
    for i in ob:
        row = {"name": i.name, "phone": i.phone, "image": i.image.url,"id":i.login.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



# ///////////////////////////////////android chat //////////////////////////////////////////////

def view_message2(request):
    try:
        print(request.POST,"ppppppppppppppppppppppp")
        fromid=request.POST['fid']
        toid=request.POST['toid']
        mid=request.POST['lastmsgid']
        print(mid,"uuuuuuuuuuuu0")
        ob=chat_table.objects.filter(Q(toid__id=toid,fromid__id=fromid,id__gt=mid)|Q(toid=fromid,fromid=toid,id__gt=mid)).order_by('id')
        print(ob,"YYYYYYYYYYYYYYYYYYYYYYYYYYYYYY")
        data=[]
        print("++++++++==============================")
        print("++++++++==============================")
        print("++++++++==============================")
        for i in ob:
            r={"id":i.id,"date":i.date,"chat":i.message,"fromid":i.fromid.id}
            data.append(r)
            print(r,"KKKKKKKKKKKKKKKKKKKKKKKKKKKK")
        # print(data,"JJJJJJJJJJJJJJJJJJJJJJJJJ")
        print(len(data),"=========================================")
        if len(data)>0:
            return JsonResponse({"status":"ok","res1":data})
        else:
            return JsonResponse({"status": "na"})
    except Exception as e:
        print("000000000000000000000000000000",e)
        return JsonResponse({"status": "na"})

def in_message2(request):
    fromid = request.POST['fid']
    toid=request.POST['toid']
    chat = request.POST['msg']

    ob = chat_table()
    ob.message = chat
    # ob.time = datetime.now().strftime("%H:%M:%S")
    ob.date = datetime.now()

    ob.fromid = login_table.objects.get(id=fromid)
    ob.toid = login_table.objects.get(id=toid)
    ob.save()
    data = {"status": "send"}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)


# ////////////////////////////////// android chat///////////////////////////////////////////
