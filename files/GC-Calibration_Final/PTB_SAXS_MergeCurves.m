%%-------------------Merge SAS Curves
clear all; close all; clc
%---------------------------reading files----------------------------------
addpath 'E:\User\DATAREDUCTION_PTB\qc03_ptb_GC-calib_AlCl3-electrolyte_Fe-MW_ETH-CS_CaSr-CS_Cl_Ca_Fe-XAS_In_Ca-ASAXS\Reduction\GlossyCarbonCalibration\Final' % Path where your Normalised 1D Date from different sample-detector distances can be found

% Import Normalised 1D Data with delimiter TAB ('\t').
% GC-reference.

A_S1_l=dlmread('GC-K1mm-new2015_Long.dat','',3,0);
A_S1_s=dlmread('GC-K1mm-new2015_Short.dat','',3,0);
A_S2_l=dlmread('GC-K1mm-old_Long.dat','',3,0);
A_S2_s=dlmread('GC-K1mm-old_Short.dat','',3,0);
A_S3_l=dlmread('GC-K_54um-c_Long.dat','',3,0);
A_S3_s=dlmread('GC-K_54um-c_Short.dat','',3,0);
A_S4_l=dlmread('GC-K_54um-d_Long.dat','',3,0);
A_S4_s=dlmread('GC-K_54um-d_Short.dat','',3,0);
A_S5_l=dlmread('GC-K_90um-b_Long.dat','',3,0);
A_S5_s=dlmread('GC-K_90um-b_Short.dat','',3,0);
A_S6_l=dlmread('GC-K_90um-new2015_Long.dat','',3,0);
A_S6_s=dlmread('GC-K_90um-new2015_Short.dat','',3,0);
A_S7_l=dlmread('GC-K_90um-old_Long.dat','',3,0);
A_S7_s=dlmread('GC-K_90um-old_Short.dat','',3,0);
A_S8_l=dlmread('Water_Long.dat','',3,0);
A_S8_s=dlmread('Water_Short.dat','',3,0);
% A_S9_l=dlmread('Sample9_l_n_E7998.dat','',3,0);
% A_S9_s=dlmread('Sample9_s_n_E7998.dat','',3,0);
% A_S10_l=dlmread('Sample10_l_n_E7998.dat','',3,0);
% A_S10_s=dlmread('Sample10_s_n_E7998.dat','',3,0);

%If all data of one sample-detector distance is equaly binned (see
%interpolation in the BackGr Subst step) you can use one -q- for all
%Intenseties.

q1_l=A_S1_l(:,1);q1_s=1.0*A_S1_s(:,1);
I1_l=A_S1_l(:,2);I1_s=A_S1_s(:,2);Er1_l=A_S1_l(:,3);Er1_s=A_S1_s(:,3);
I2_l=A_S2_l(:,2);I2_s=A_S2_s(:,2);Er2_l=A_S2_l(:,3);Er2_s=A_S2_s(:,3);
I3_l=A_S3_l(:,2);I3_s=A_S3_s(:,2);Er3_l=A_S3_l(:,3);Er3_s=A_S3_s(:,3);
I4_l=A_S4_l(:,2);I4_s=A_S4_s(:,2);Er4_l=A_S4_l(:,3);Er4_s=A_S4_s(:,3);
I5_l=A_S5_l(:,2);I5_s=A_S5_s(:,2);Er5_l=A_S5_l(:,3);Er5_s=A_S5_s(:,3);
I6_l=A_S6_l(:,2);I6_s=A_S6_s(:,2);Er6_l=A_S6_l(:,3);Er6_s=A_S6_s(:,3);
I7_l=A_S7_l(:,2);I7_s=A_S7_s(:,2);Er7_l=A_S7_l(:,3);Er7_s=A_S7_s(:,3);
I8_l=A_S8_l(:,2);I8_s=A_S8_s(:,2);Er8_l=A_S8_l(:,3);Er8_s=A_S8_s(:,3);
% I9_l=A_S9_l(:,2);I9_s=A_S9_s(:,2);Er9_l=A_S9_l(:,3);Er9_s=A_S9_s(:,3);
% I10_l=A_S10_l(:,2);I10_s=A_S10_s(:,2);Er10_l=A_S10_l(:,3);Er10_s=A_S10_s(:,3);


%%----------------------allignment-----------------------------------------


qmin=max([min(q1_l),min(q1_s)])
qmax=min([max(q1_l),max(q1_s)])
q_al=qmin:0.01:qmax;
sz=size(q_al)
q_al=reshape(q_al,sz(1),sz(2));

I1_l_a=interp1(q1_l,I1_l,q_al);
I1_s_a=interp1(q1_s,I1_s,q_al);
I2_l_a=interp1(q1_l,I2_l,q_al);
I2_s_a=interp1(q1_s,I2_s,q_al);
I3_l_a=interp1(q1_l,I3_l,q_al);
I3_s_a=interp1(q1_s,I3_s,q_al);
I4_l_a=interp1(q1_l,I4_l,q_al);
I4_s_a=interp1(q1_s,I4_s,q_al);
I5_l_a=interp1(q1_l,I5_l,q_al);
I5_s_a=interp1(q1_s,I5_s,q_al);
I6_l_a=interp1(q1_l,I6_l,q_al);
I6_s_a=interp1(q1_s,I6_s,q_al);
I7_l_a=interp1(q1_l,I7_l,q_al);
I7_s_a=interp1(q1_s,I7_s,q_al);
I8_l_a=interp1(q1_l,I8_l,q_al);
I8_s_a=interp1(q1_s,I8_s,q_al);
% I9_l_a=interp1(q1_l,I9_l,q_al);
% I9_s_a=interp1(q1_s,I9_s,q_al);
% I10_l_a=interp1(q1_l,I10_l,q_al);
% I10_s_a=interp1(q1_s,I10_s,q_al);

Er1_l_a=interp1(q1_l,Er1_l,q_al);
Er1_s_a=interp1(q1_s,Er1_s,q_al);
Er2_l_a=interp1(q1_l,Er2_l,q_al);
Er2_s_a=interp1(q1_s,Er2_s,q_al);
Er3_l_a=interp1(q1_l,Er3_l,q_al);
Er3_s_a=interp1(q1_s,Er3_s,q_al);
Er4_l_a=interp1(q1_l,Er4_l,q_al);
Er4_s_a=interp1(q1_s,Er4_s,q_al);
Er5_l_a=interp1(q1_l,Er5_l,q_al);
Er5_s_a=interp1(q1_s,Er5_s,q_al);
Er6_l_a=interp1(q1_l,Er6_l,q_al);
Er6_s_a=interp1(q1_s,Er6_s,q_al);
Er7_l_a=interp1(q1_l,Er7_l,q_al);
Er7_s_a=interp1(q1_s,Er7_s,q_al);
Er8_l_a=interp1(q1_l,Er8_l,q_al);
Er8_s_a=interp1(q1_s,Er8_s,q_al);
% Er9_l_a=interp1(q1_l,Er9_l,q_al);
% Er9_s_a=interp1(q1_s,Er9_s,q_al);
% Er10_l_a=interp1(q1_l,Er10_l,q_al);
% Er10_s_a=interp1(q1_s,Er10_s,q_al);


range_Norm=[10 sz(2)-60]; %Look for a well overlapping range
q_range_Norm=[q_al(range_Norm(1)) q_al(range_Norm(2))]

F1_l=sum(I1_l_a(range_Norm(1):range_Norm(2)));
F1_s=sum(I1_s_a(range_Norm(1):range_Norm(2)));
F2_l=sum(I2_l_a(range_Norm(1):range_Norm(2)));
F2_s=sum(I2_s_a(range_Norm(1):range_Norm(2)));
F3_l=sum(I3_l_a(range_Norm(1):range_Norm(2)));
F3_s=sum(I3_s_a(range_Norm(1):range_Norm(2)));
F4_l=sum(I4_l_a(range_Norm(1):range_Norm(2)));
F4_s=sum(I4_s_a(range_Norm(1):range_Norm(2)));
F5_l=sum(I5_l_a(range_Norm(1):range_Norm(2)));
F5_s=sum(I5_s_a(range_Norm(1):range_Norm(2)));
F6_l=sum(I6_l_a(range_Norm(1):range_Norm(2)));
F6_s=sum(I6_s_a(range_Norm(1):range_Norm(2)));
F7_l=sum(I7_l_a(range_Norm(1):range_Norm(2)));
F7_s=sum(I7_s_a(range_Norm(1):range_Norm(2)));
F8_l=sum(I8_l_a(range_Norm(1):range_Norm(2)));
F8_s=sum(I8_s_a(range_Norm(1):range_Norm(2)));
% F9_l=sum(I9_l_a(range_Norm(1):range_Norm(2)));
% F9_s=sum(I9_s_a(range_Norm(1):range_Norm(2)));
% F10_l=sum(I10_l_a(range_Norm(1):range_Norm(2)));
% F10_s=sum(I10_s_a(range_Norm(1):range_Norm(2)));

loglog(q_al(range_Norm(1):range_Norm(2)),I1_s_a(range_Norm(1):range_Norm(2))*(F1_l/F1_s)*10,'r');hold on
loglog(q_al(range_Norm(1):range_Norm(2)),I1_l_a(range_Norm(1):range_Norm(2))*10,'k')

%All factors have to be not so fare away from 1.
f1=(F1_l/F1_s)
f2=(F2_l/F2_s)
f3=(F3_l/F3_s)
f4=(F4_l/F4_s)
f5=(F5_l/F5_s)
f6=(F6_l/F6_s)
f7=(F7_l/F7_s)
f8=(F8_l/F8_s)
% f9=(F9_l/F9_s)
% f10=(F10_l/F10_s)


Int1_l=I1_l/f1;
Int1_s=I1_s;
Int2_l=I2_l/f2;
Int2_s=I2_s;
Int3_l=I3_l/f3;
Int3_s=I3_s;
Int4_l=I4_l/f4;
Int4_s=I4_s;
Int5_l=I5_l/f5;
Int5_s=I5_s;
Int6_l=I6_l/f6;
Int6_s=I6_s;
Int7_l=I7_l/f7;
Int7_s=I7_s;
Int8_l=I8_l/f8;
Int8_s=I8_s;
% Int9_l=I9_l/f9;
% Int9_s=I9_s;
% Int10_l=I10_l/f10;
% Int10_s=I10_s;

% Int1_l=I1_l;
% Int1_s=I1_s*f1;
% Int2_l=I2_l;
% Int2_s=I2_s*f2;
% Int3_l=I3_l;
% Int3_s=I3_s*f3;
% Int4_l=I4_l;
% Int4_s=I4_s*f4;
% Int5_l=I5_l;
% Int5_s=I5_s*f5;
% Int6_l=I6_l;
% Int6_s=I6_s*f6;
% Int7_l=I7_l;
% Int7_s=I7_s*f7;
% Int8_l=I8_l;
% Int8_s=I8_s*f8;
% Int9_l=I9_l;
% Int9_s=I9_s*f9;
% Int10_l=I10_l;
% Int10_s=I10_s*f10;

Err1_l=Er1_l/f1;
Err1_s=Er1_s;
Err2_l=Er2_l/f2;
Err2_s=Er2_s;
Err3_l=Er3_l/f3;
Err3_s=Er3_s;
Err4_l=Er4_l/f4;
Err4_s=Er4_s;
Err5_l=Er5_l/f5;
Err5_s=Er5_s;
Err6_l=Er6_l/f6;
Err6_s=Er6_s;
Err7_l=Er7_l/f7;
Err7_s=Er7_s;
Err8_l=Er8_l/f8;
Err8_s=Er8_s;
% Err9_l=Er9_l/f9;
% Err9_s=Er9_s;
% Err10_l=Er10_l/f10;
% Err10_s=Er10_s;

% Err1_l=Er1_l;
% Err1_s=Er1_s*f1;
% Err2_l=Er2_l;
% Err2_s=Er2_s*f2;
% Err3_l=Er3_l;
% Err3_s=Er3_s*f3;
% Err4_l=Er4_l;
% Err4_s=Er4_s*f4;
% Err5_l=Er5_l;
% Err5_s=Er5_s*f5;
% Err6_l=Er6_l;
% Err6_s=Er6_s*f6;
% Err7_l=Er7_l;
% Err7_s=Er7_s*f7;
% Err8_l=Er8_l;
% Err8_s=Er8_s*f8;
% Err9_l=Er9_l;
% Err9_s=Er9_s*f9;
% Err10_l=Er10_l;
% Err10_s=Er10_s*f10;

loglog(q1_l,Int1_l*0.1);hold on
loglog(q1_s,Int1_s*0.1);

%%------------------------------skip point---------------------------------

skip_long_first=0;
skip_long_last=140;
skip_short_first=9;
skip_short_last=0;

sz_long=size(q1_l);
first_long=1+skip_long_first;
last_long=sz_long(1)-skip_long_last;
range1_long=[q1_l(first_long) q1_l(last_long)]

sz_short=size(q1_s);
first_short=1+skip_short_first;
last_short=sz_short(1)-skip_short_last;
range1_short=[q1_s(first_short) q1_s(last_short)]

q_m=[q1_l(first_long : last_long); q1_s(first_short : last_short)];
Int1_m=[Int1_l(first_long : last_long); Int1_s(first_short : last_short)];
Int2_m=[Int2_l(first_long : last_long); Int2_s(first_short : last_short)];
Int3_m=[Int3_l(first_long : last_long); Int3_s(first_short : last_short)];
Int4_m=[Int4_l(first_long : last_long); Int4_s(first_short : last_short)];
Int5_m=[Int5_l(first_long : last_long); Int5_s(first_short : last_short)];
Int6_m=[Int6_l(first_long : last_long); Int6_s(first_short : last_short)];
Int7_m=[Int7_l(first_long : last_long); Int7_s(first_short : last_short)];
Int8_m=[Int8_l(first_long : last_long); Int8_s(first_short : last_short)];
% Int9_m=[Int9_l(first_long : last_long); Int9_s(first_short : last_short)];
% Int10_m=[Int10_l(first_long : last_long); Int10_s(first_short : last_short)];

Err1_m=[Err1_l(first_long : last_long); Err1_s(first_short : last_short)];
Err2_m=[Err2_l(first_long : last_long); Err2_s(first_short : last_short)];
Err3_m=[Err3_l(first_long : last_long); Err3_s(first_short : last_short)];
Err4_m=[Err4_l(first_long : last_long); Err4_s(first_short : last_short)];
Err5_m=[Err5_l(first_long : last_long); Err5_s(first_short : last_short)];
Err6_m=[Err6_l(first_long : last_long); Err6_s(first_short : last_short)];
Err7_m=[Err7_l(first_long : last_long); Err7_s(first_short : last_short)];
Err8_m=[Err8_l(first_long : last_long); Err8_s(first_short : last_short)];
% Err9_m=[Err9_l(first_long : last_long); Err9_s(first_short : last_short)];
% Err10_m=[Err10_l(first_long : last_long); Err10_s(first_short : last_short)];

%%------------------------------Merge Data---------------------------------

CombData1(:,1)=q_m;CombData1(:,2)=Int1_m;CombData1(:,3)=Err1_m;
MergedData1=sortrows(CombData1,1);
CombData2(:,1)=q_m;CombData2(:,2)=Int2_m;CombData2(:,3)=Err2_m;
MergedData2=sortrows(CombData2,1);
CombData3(:,1)=q_m;CombData3(:,2)=Int3_m;CombData3(:,3)=Err3_m;
MergedData3=sortrows(CombData3,1);
CombData4(:,1)=q_m;CombData4(:,2)=Int4_m;CombData4(:,3)=Err4_m;
MergedData4=sortrows(CombData4,1);
CombData5(:,1)=q_m;CombData5(:,2)=Int5_m;CombData5(:,3)=Err5_m;
MergedData5=sortrows(CombData5,1);
CombData6(:,1)=q_m;CombData6(:,2)=Int6_m;CombData6(:,3)=Err6_m;
MergedData6=sortrows(CombData6,1);
CombData7(:,1)=q_m;CombData7(:,2)=Int7_m;CombData7(:,3)=Err7_m;
MergedData7=sortrows(CombData7,1);
CombData8(:,1)=q_m;CombData8(:,2)=Int8_m;CombData8(:,3)=Err8_m;
MergedData8=sortrows(CombData8,1);
% CombData9(:,1)=q_m;CombData9(:,2)=Int9_m;CombData9(:,3)=Err9_m;
% MergedData9=sortrows(CombData9,1);
% CombData10(:,1)=q_m;CombData10(:,2)=Int10_m;CombData10(:,3)=Err10_m;
% MergedData10=sortrows(CombData10,1);

loglog(MergedData1(:,1),MergedData1(:,2),'k');
loglog(MergedData2(:,1),MergedData2(:,2),'b');
loglog(MergedData3(:,1),MergedData3(:,2),'b');
loglog(MergedData4(:,1),MergedData4(:,2),'g');
loglog(MergedData5(:,1),MergedData5(:,2),'g');
loglog(MergedData6(:,1),MergedData6(:,2),'m');
loglog(MergedData7(:,1),MergedData7(:,2),'m');
loglog(MergedData8(:,1),MergedData8(:,2),'c');
% loglog(MergedData9(:,1),MergedData9(:,2),'c');
% loglog(MergedData10(:,1),MergedData10(:,2),'y');

%%-----------------------------Data Export---------------------------------

filename=sprintf('E:\\User\\DATAREDUCTION_PTB\\qc03_ptb_GC-calib_AlCl3-electrolyte_Fe-MW_ETH-CS_CaSr-CS_Cl_Ca_Fe-XAS_In_Ca-ASAXS\\Reduction\\GlossyCarbonCalibration\\Final\\');
outfile_1=strcat(filename,'GC-K1mm-new2015.dat');
dlmwrite(outfile_1,MergedData1);
outfile_2=strcat(filename,'GC-K1mm-old.dat');
dlmwrite(outfile_2,MergedData2);
outfile_3=strcat(filename,'GC-K_54um-c.dat');
dlmwrite(outfile_3,MergedData3);
outfile_4=strcat(filename,'GC-K_54um-d.dat');
dlmwrite(outfile_4,MergedData4);
outfile_5=strcat(filename,'GC-K_90um-b.dat');
dlmwrite(outfile_5,MergedData5);
outfile_6=strcat(filename,'GC-K_90um-new2015.dat');
dlmwrite(outfile_6,MergedData6);
outfile_7=strcat(filename,'GC-K_90um-old.dat');
dlmwrite(outfile_7,MergedData7);
outfile_8=strcat(filename,'Water.dat');
dlmwrite(outfile_8,MergedData8);
% outfile_9=strcat(filename,'SK1-182-1_E7998.dat');
% dlmwrite(outfile_9,MergedData9);
% outfile_10=strcat(filename,'AgBeh_E7998.dat');
% dlmwrite(outfile_10,MergedData10);
