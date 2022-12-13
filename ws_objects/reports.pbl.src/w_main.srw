$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type st_url from statictext within w_main
end type
type dw_1 from vs_dw_master within w_main
end type
type cb_3 from commandbutton within w_main
end type
type rb_3 from radiobutton within w_main
end type
type rb_2 from radiobutton within w_main
end type
type rb_1 from radiobutton within w_main
end type
type st_3 from statictext within w_main
end type
type st_2 from statictext within w_main
end type
type st_1 from statictext within w_main
end type
type cb_1 from commandbutton within w_main
end type
type sle_department from singlelineedit within w_main
end type
type sle_customer from singlelineedit within w_main
end type
type sle_serie from singlelineedit within w_main
end type
type dp_2 from datepicker within w_main
end type
type dp_1 from datepicker within w_main
end type
type gb_1 from groupbox within w_main
end type
type gb_2 from groupbox within w_main
end type
end forward

global type w_main from window
integer width = 5248
integer height = 2824
boolean titlebar = true
string title = "Customer~'s Invoices"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_url st_url
dw_1 dw_1
cb_3 cb_3
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
st_3 st_3
st_2 st_2
st_1 st_1
cb_1 cb_1
sle_department sle_department
sle_customer sle_customer
sle_serie sle_serie
dp_2 dp_2
dp_1 dp_1
gb_1 gb_1
gb_2 gb_2
end type
global w_main w_main

type variables

end variables

forward prototypes
public subroutine wf_retrieve (vs_dw_master dwc)
end prototypes

public subroutine wf_retrieve (vs_dw_master dwc);string ls_empresa, ls_serie,  ls_cli1, ls_cli2, ls_situacion, ls_anyo, ls_obra, ls_reporttitle
Datetime ldt_fecha1, ldt_fecha2
any a_values[] 

ls_empresa="1"
ls_anyo="2020"
ldt_fecha1 = dp_1.value
ldt_fecha2 = dp_2.value

if trim(sle_serie.text)<>""  then
	ls_serie= trim(sle_serie.text)
else
	setnull(ls_serie)
end if	

choose case true
	case 	rb_1.checked
		ls_situacion="N"
	case	rb_2.checked
		ls_situacion="S"
	case	rb_3.checked
		 setnull(ls_situacion)
end choose

	
iF Trim(sle_customer.text) = "" Then
   ls_cli1 = "1"
   ls_cli2 = "99999"
   ls_reporttitle = THIS.title
ELSE
	ls_cli1 = sle_customer.text
	ls_cli2 = sle_customer.text
	ls_reporttitle = "Customer Nº "+ls_cli1+" Invoices"
END IF

If  trim(sle_department.text) = "" THEN
	setnull(ls_obra)
ELSE
	ls_obra = sle_department.text
END IF

dwc.setredraw(false)		

a_values[1]  = ls_empresa
a_values[2]  = ls_anyo
a_values[3]  = ls_serie
a_values[4]  = ldt_fecha1
a_values[5]  = ldt_fecha2
a_values[6]  = ls_cli1
a_values[7]  = ls_cli2
a_values[8]  = ls_obra
a_values[9]  = ls_situacion
a_values[10]  = ls_reporttitle


dwc.of_Retrieve(sqlca, a_values[])

dwc.setredraw(true)		
end subroutine

on w_main.create
this.st_url=create st_url
this.dw_1=create dw_1
this.cb_3=create cb_3
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.sle_department=create sle_department
this.sle_customer=create sle_customer
this.sle_serie=create sle_serie
this.dp_2=create dp_2
this.dp_1=create dp_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_url,&
this.dw_1,&
this.cb_3,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_1,&
this.sle_department,&
this.sle_customer,&
this.sle_serie,&
this.dp_2,&
this.dp_1,&
this.gb_1,&
this.gb_2}
end on

on w_main.destroy
destroy(this.st_url)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.sle_department)
destroy(this.sle_customer)
destroy(this.sle_serie)
destroy(this.dp_2)
destroy(this.dp_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;dp_1.value=datetime("01-01-2020")
dp_2.value=datetime("31-01-2020")



	// PowerServer Connect
	connect using sqlca;





end event

type st_url from statictext within w_main
integer x = 73
integer y = 2580
integer width = 5115
integer height = 128
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_1 from vs_dw_master within w_main
integer x = 55
integer y = 300
integer width = 5115
integer height = 2256
integer taborder = 60
string dataobject = "dw_con_listado_venfac_obra"
end type

type cb_3 from commandbutton within w_main
integer x = 4672
integer y = 172
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New Report"
end type

event clicked;//Report with composite datawindow
// report_prueba :  Composite Datawindow
												//1-report_cabecera as dw_cabecera
												//1-report_con_listado_venfac_obra_new as dw_report


dw_1.dataobject="report_con_listado_venfac_obra"
wf_retrieve(dw_1)
end event

type rb_3 from radiobutton within w_main
integer x = 3552
integer y = 192
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "All invoices"
boolean checked = true
end type

type rb_2 from radiobutton within w_main
integer x = 3557
integer y = 116
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Accounted"
end type

type rb_1 from radiobutton within w_main
integer x = 3552
integer y = 40
integer width = 434
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "No accounted"
end type

type st_3 from statictext within w_main
integer x = 2382
integer y = 116
integer width = 649
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "customer department ID"
boolean focusrectangle = false
end type

type st_2 from statictext within w_main
integer x = 1563
integer y = 112
integer width = 338
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Customer ID"
boolean focusrectangle = false
end type

type st_1 from statictext within w_main
integer x = 1061
integer y = 100
integer width = 187
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Series"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_main
integer x = 4265
integer y = 172
integer width = 402
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Retrieve"
end type

event clicked;dw_1.dataobject="dw_con_listado_venfac_obra"
wf_retrieve(dw_1)
end event

type sle_department from singlelineedit within w_main
integer x = 3054
integer y = 96
integer width = 402
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_customer from singlelineedit within w_main
integer x = 1943
integer y = 88
integer width = 402
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_serie from singlelineedit within w_main
integer x = 1257
integer y = 84
integer width = 247
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
end type

type dp_2 from datepicker within w_main
integer x = 553
integer y = 92
integer width = 425
integer height = 100
integer taborder = 10
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2022-12-13"), Time("13:29:27.000000"))
integer textsize = -8
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type dp_1 from datepicker within w_main
integer x = 123
integer y = 92
integer width = 425
integer height = 100
integer taborder = 10
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2022-12-13"), Time("13:29:27.000000"))
integer textsize = -8
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type gb_1 from groupbox within w_main
integer x = 69
integer width = 951
integer height = 224
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date"
end type

type gb_2 from groupbox within w_main
integer x = 3488
integer width = 549
integer height = 288
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

