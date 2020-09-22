VERSION 5.00
Object = "{84926CA3-2941-101C-816F-0E6013114B7F}#1.0#0"; "IMGSCAN.OCX"
Object = "{6D940288-9F11-11CE-83FD-02608C3EC08A}#2.1#0"; "IMGEDIT.OCX"
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "get from scanner example"
   ClientHeight    =   2640
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4095
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2640
   ScaleWidth      =   4095
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin ScanLibCtl.ImgScan ImgScan1 
      Left            =   240
      Top             =   2160
      _Version        =   65536
      _ExtentX        =   661
      _ExtentY        =   661
      _StockProps     =   0
      DestImageControl=   "ImgEdit1"
      FileType        =   3
      CompressionType =   0
      CompressionInfo =   0
   End
   Begin VB.CommandButton Command1 
      Caption         =   "get from scanner"
      Height          =   375
      Left            =   720
      TabIndex        =   1
      Top             =   2160
      Width           =   1575
   End
   Begin ImgeditLibCtl.ImgEdit ImgEdit1 
      Height          =   1935
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   3735
      _Version        =   131073
      _ExtentX        =   6588
      _ExtentY        =   3413
      _StockProps     =   96
      BorderStyle     =   1
      ImageControl    =   "ImgEdit1"
      BeginProperty AnnotationFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      UndoBufferSize  =   54103808
      OcrZoneVisibility=   -4044
      AnnotationOcrType=   127
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "status: none"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2400
      TabIndex        =   2
      Top             =   2160
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' this is a very small example of how you can
' scan a picture from the scanner and display
' it on a img control. you can create a scanning
' program, with a simle ocx. i took about 1minute
' out of my time to create this.
Private Sub Command1_Click()
' scanner available?
ImgScan1.ScannerAvailable
' open scanner port
ImgScan1.OpenScanner
' start scanning
ImgScan1.StartScan
End Sub
Private Sub ImgScan1_PageDone(ByVal PageNumber As Long)
Label1.Caption = "status: page " & PageNumber & " done."
End Sub
Private Sub ImgScan1_ScanDone()
Label1.Caption = "status: scan done."
End Sub
Private Sub ImgScan1_ScanStarted()
Label1.Caption = "status: scan started."
End Sub
