--���ݿ�汾��MS SQL server 2008 
--20170503 17:46
--zxc
--DataBase: HospitalRegistered

/**
ϵͳ�����ߺ�ҽ����ǰ̨��̨��
���ò�ͬ�ĵ�¼��ڣ�
����ҽ����Ϣ��ͻ�����Ϣ�����˻������롣
ҽ���Ϳ��ҵĹ�ϵ�Ƕ��һ�ģ�
������ԤԼ���ҵ�ҽ����һ�Զ�ģ�
���ǵ����������߼���ϵ�ϵĽϴ�����ԣ�
����ҽ���ͻ��߲�������һ�ű�
�ʶ���ϵͳ��Ϊǰ̨��̨��
��Ȼ��ʦ�����齫��Ϣϵͳ��Ϊǰ̨��̨��
���Ƕ���ԤԼ�ҺŶ�������������ʵ�������
**/

--1.���߱�
CREATE TABLE patient(
  patientId int NOT NULL,
  patientPassword varchar(255),
  patientName varchar(255),
  patientAge varchar(255),
  patientSex varchar(255),
  patientTel varchar(255),
  patientIdcard varchar(255),
  PRIMARY KEY  (patientId)
) 
--2.������Ϣ��
CREATE TABLE department(
  departmentId int identity(1,1) NOT NULL ,--���ҵ�id
  departmentName varchar(255),--��������
  departmentType varchar(255),--�������
  departmentRemark text,--���Ҽ��
  PRIMARY KEY  (departmentId)
) 

--3.�û���ɫ����ҽ���ģ�
create table userRole(
  userRoleId int identity(1,1) NOT NULL,--��ɫId
  userTypeName nvarchar(30) not null,--��ɫ����(����ҽ�� ��̨����Ա��֮���)
  primary key(userRoleId),
)
--4.Ȩ�ޱ�
create table permission(
  permissionId int identity(1,1) NOT NULL,--Ȩ��Id
  permissionName nvarchar(30) not null,--Ȩ������
  primary key(permissionId),
)
--5.��ɫȨ��   ��ֹ������Ӳ�ѯ�ĸ����ԣ����ﲻ�������
create table rolePermission(
  rpId int identity(1,1) NOT NULL,--������ʶ
  userRoleId int NOT NULL,--��ɫId
  permissionId int NOT NULL,--Ȩ��Id
  primary key(rpId),
  foreign key(permissionId) references permission(permissionId),
  foreign key(userRoleId) references userRole(userRoleId),
)
--6.ҽ����Ϣ��
CREATE TABLE doctor(
  doctorId int NOT NULL,--ҽ��ID����Ҳ�ǵ�¼�˻�
  doctorPassword varchar(255),--ҽ������
  doctorName varchar(255),--ҽ������
  doctorSex varchar(255),--ҽ���Ա�
  doctorAge varchar(255),--ҽ������
  doctorTel varchar(255),--ҽ���绰
  departmentId int,--��������   ���
  doctorTitle varchar(255),--ְ��
  doctorImg varchar(255),--��Ƭ������ֻ����Ƭ���ļ���
  userRoleId int,--������ɫ    ���
  doctorIdcard varchar(255),--���֤��
  doctorRemark text,--ҽ�����
  PRIMARY KEY (doctorId),
  foreign key(userRoleId) references userRole(userRoleId),
  foreign key(departmentId) references department(departmentId),
)
--7.ԤԼ��Ϣ��
CREATE TABLE appointment(
  appointmentId int identity(1,1) NOT NULL,--ԤԼ��ʶID
  doctorId int default NULL,--ԤԼҽ�� ���
  appointmentDate varchar(255) default NULL,--ԤԼʱ��
  patientId int default NULL,--����ID ���
  appointmentStatus varchar(255) default NULL,--ԤԼ״̬  ����or���
  PRIMARY KEY (appointmentId),
  foreign key(doctorId) references doctor(doctorId),
  foreign key(patientId) references patient(patientId),
) 
--8.ҽ���Ű��
CREATE TABLE workforce(
  workforceId int identity(1,1) NOT NULL,--�Ű���ʶ
  workforceDate varchar(255) default NULL,--�Ű�ʱ��
  workforcePatNum int default NULL,--������������
  doctorId int default NULL,--ҽ��ID ���
  PRIMARY KEY (workforceId),
  foreign key(doctorId) references doctor(doctorId),
)
--9.���ű�
CREATE TABLE notice(
  noticeId int identity(1,1) NOT NULL,
  noticeTitle varchar(255),
  noticeContent text,
  noticeSavetime varchar(255),
  PRIMARY KEY  (noticeId)
)
--10.ҽԺ����,����������ҽԺ��Ϣ����,�����޸ĵ�
CREATE TABLE hospital(
  hospitalId int identity(1,1) NOT NULL,--��ʶ����
  hospitalRemark text,--�������
  PRIMARY KEY (hospitalId)
)