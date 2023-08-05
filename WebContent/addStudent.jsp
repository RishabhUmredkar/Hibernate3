<%@page import="org.hibernate.Transaction"%>
<%@page import="model.Student"%>
<%@page import="model.StudentDao"%>
<%@page import="com.sun.xml.internal.ws.client.Stub"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
String pass = request.getParameter("pass");

Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");


SessionFactory factory = cfg.buildSessionFactory();
Session ss = factory.openSession();

Student s=new Student(name,pass);
int a = StudentDao.SaveStudent(s);

Transaction tx = ss.beginTransaction();

ss.save(s);
out.println("Data inserted");

tx.commit();
ss.close();
factory.close();


%>
</body>
</html>