from django.db import models

# Create your models here.

class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)





class department_table(models.Model):
    departmentname=models.CharField(max_length=100)


class course_table(models.Model):
    department=models.ForeignKey(department_table,on_delete=models.CASCADE)
    coursename=models.CharField(max_length=100)

class subject_table(models.Model):
    subjectname=models.CharField(max_length=100)
    courseid=models.ForeignKey(course_table,on_delete=models.CASCADE)
    sem=models.CharField(max_length=100)

class hod_table(models.Model):
    login=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    email = models.CharField(max_length=50)
    phone= models.BigIntegerField()
    place= models.CharField(max_length=100)
    pin= models.IntegerField()
    post = models.CharField(max_length=100)
    dep= models.ForeignKey(department_table,on_delete=models.CASCADE)



class staff_table(models.Model):
    name=models.CharField(max_length=100)
    email=models.EmailField()
    phone=models.BigIntegerField()
    place=models.CharField(max_length=100)
    pin=models.IntegerField()
    post=models.CharField(max_length=100)
    image=models.FileField()
    login=models.ForeignKey(login_table,on_delete=models.CASCADE)
    hod=models.ForeignKey(hod_table,on_delete=models.CASCADE)

class student_table(models.Model):
    login=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=50)
    phone=models.BigIntegerField()
    place=models.CharField(max_length=100)
    pin=models.IntegerField()
    post=models.CharField(max_length=100)
    course=models.ForeignKey(course_table,on_delete=models.CASCADE)
    hod_table=models.ForeignKey(hod_table,on_delete=models.CASCADE)
    image=models.FileField()


class complaint_table(models.Model):
    STUDENT=models.ForeignKey(student_table,on_delete=models.CASCADE)
    complaint=models.CharField(max_length=200)
    reply=models.CharField(max_length=200)
    date=models.DateField()

class assignedsubject_table(models.Model):
    staffid=models.ForeignKey(staff_table,on_delete=models.CASCADE)
    subject=models.ForeignKey(subject_table,on_delete=models.CASCADE)

class materials_table(models.Model):
    subject=models.ForeignKey(subject_table,on_delete=models.CASCADE)
    studymaterial=models.FileField()

class video_table(models.Model):
    video=models.FileField()
    subject=models.ForeignKey(subject_table,on_delete=models.CASCADE)
    date=models.DateField()


class exam_table(models.Model):
    subjectassignedid=models.ForeignKey(assignedsubject_table,on_delete=models.CASCADE)
    examname=models.CharField(max_length=100)
    examdate=models.DateField()
    uploaddate=models.CharField(max_length=200)
    status=models.CharField(max_length=100,default="pending")


class questions_table(models.Model):
    Exam=models.ForeignKey(exam_table,on_delete=models.CASCADE)
    questions=models.TextField()
    answers=models.TextField()
    Mark=models.CharField(max_length=500)



class attendexam_table(models.Model):
    studentid = models.ForeignKey(student_table, on_delete=models.CASCADE)
    questions= models.ForeignKey(questions_table, on_delete=models.CASCADE)
    date=models.DateField()
    answers= models.TextField()
    mark= models.CharField(max_length=100)
    status= models.CharField(max_length=100)



class chat_table(models.Model):
    fromid = models.ForeignKey(login_table,on_delete=models.CASCADE,related_name="jj")
    toid = models.ForeignKey(login_table,on_delete=models.CASCADE,related_name="jb")
    message = models.CharField(max_length=500)
    date = models.DateField()


