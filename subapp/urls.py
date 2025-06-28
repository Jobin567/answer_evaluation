"""subject_evaluation URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from subapp import views

urlpatterns = [
    path('',views.login),
    path('login_code',views.login_code),
    path('logout',views.logout),
    path('add_dept',views.add_dept),
    path('adddeptcode',views.adddeptcode),
    path('addhod',views.addhod),
    path('addhodcode',views.addhodcode),
    path('addmaterial',views.addmaterial),
    path('addquestion',views.addquestion),
    path('addstaff',views.addstaff),
    path('addstaff_post',views.addstaff_post),
    path('assignsubject_post', views.assignsubject_post),
    path('addstudent_post', views.addstudent_post),

    path('addstudent',views.addstudent),
    path('addsubject',views.addsubject),
    path('addsubjectcode',views.addsubjectcode),
    path('addvideo',views.addvideo),
    path('assignsubject',views.assignsubject),
    path('course', views.course),
    path('coursecode',views.coursecode),
    path('exam', views.exam),
    path('questions', views.questions),
    path('replycode', views.replycode),
    path('sendcomplaint/<int:id>', views.sendcomplaint),
    path('deletedeprt/<int:id>', views.deletedeprt),
    path('deletecourse/<int:id>', views.deletecourse),
    path('deletehod/<int:id>', views.deletehod),
    path('deletesubject/<int:id>', views.deletesubject),
    path('editdep/<int:id>', views.editdep),
    path('editdeptcode', views.editdeptcode),
    path('editcourse/<int:id>', views.editcourse),
    path('editcoursecode', views.editcoursecode),

    path('edithod/<int:id>', views.edithod),
    path('edithodcode', views.edithodcode),

    path('deletestaff/<int:id>', views.deletestaff),
    path('editstaff/<int:id>', views.editstaff),
    path('editstaff_post', views.editstaff_post),

    path('editstudent/<int:id>', views.editstudent),
    path('editstudent_post', views.editstudent_post),

    path('deletestudent/<int:id>', views.deletestudent),

    path('view_dept', views.view_dept),
    path('viewcomplaint', views.viewcomplaint),
    path('viewcomplaint_search', views.viewcomplaint_search),

    path('viewcourse', views.viewcourse),
    path('viewhod', views.viewhod),
    path('viewhod_search', views.viewhod_search),
    path('viewmaterial', views.viewmaterial),
    path('viewstaff', views.viewstaff),
    path('viewstudent', views.viewstudent),
    path('viewsubject', views.viewsubject),
    path('viewvideo', views.viewvideo),
    path('adminhome', views.adminhome),
    path('hodhome', views.hodhome),


    path('StaffHome', views.StaffHome),
    path('add_std',views.add_std,name='add_std'),
    path('search_std',views.search_std,name='search_std'),
    path('vasub', views.vasub, name='vasub'),
    path('manage_exam',views.manage_exam,name='manage_exam'),
    path('add_exm',views.add_exm,name='add_exam'),
    path('mng_qus',views.mng_qus,name='mng_qus'),
    path('search_qus',views.search_qus,name='search_qus'),
    path('mng_qus_delete/<id>',views.mng_qus_delete,name='mng_qus_delete'),
    path('add_q',views.add_q,name='add_q'),
    path('add_exam_post',views.add_exam_post,name='add_exam_post'),
    path('delete_exam_post/<int:id>',views.delete_exam_post,name='delete_exam_post'),
    path('wrst/<id>/',views.wrst,name='wrst'),
    path('shme',views.shme,name='shme'),
    path('add_question',views.add_question,name='add_question'),

    path('logincode', views.logincode),
    path('viewsubject1', views.viewsubject1),
    path('viewexam', views.viewexam),
    path('viewreply', views.viewreply),
    path('sendcomplaints', views.sendcomplaints),
    path('addexam', views.addexam),
    path('attendexam', views.attendexam),
    path('viewassignedsubject', views.viewassignedsubject),
    path('question', views.question),
    path('viewquestion', views.viewquestion),
    path('viewresult', views.viewresult),
    path('viewexam1', views.viewexam1),
    path('staff_view', views.staff_view, name='staff_view'),
    path('student_view', views.student_view),
    path('in_message2', views.in_message2),
    path('view_message2', views.view_message2),

    path('viewexamquestions', views.viewexamquestions),

    path('student_viewattendexam', views.student_viewattendexam),
    path('studentviewexamresult', views.studentviewexamresult),
    path('staffviewexamquestions', views.staffviewexamquestions),
    path('staff_del_questions', views.staff_del_questions),
    path('staff_view_uploaded_exam', views.staff_view_uploaded_exam),
    path('staff_view_examatten_student', views.staff_view_examatten_student),
    path('staff_view_exam_question_answer', views.staff_view_exam_question_answer),
    path('staff_update_mark', views.staff_update_mark),
    path('staff_update_examstatus', views.staff_update_examstatus),
    path('missing_keys', views.missing_keys),
    path('viewresultstaff', views.viewresultstaff),

    # path('add_test_answer', views.add_test_answer),

]
