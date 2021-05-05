﻿#ifdef __FB_WIN32__
	'#Compile -exx "Form1.rc"
#else
	'#Compile -exx
#endif
'#Region "Form"
	#include once "frmImageManager.bi"
	#include once "frmPath.bi"
	
	Constructor frmImageManager
		' frmImageManager
		With This
			.Name = "frmImageManager"
			.Text = ML("Image Manager")
			.Designer = @This
			.OnShow = @Form_Show_
			.Margins.Top = 0
			.Margins.Right = 0
			.Margins.Left = 0
			.Margins.Bottom = 0
			.BorderStyle = FormBorderStyle.Sizable
			.DefaultButton = @cmdOK
			.CancelButton = @cmdCancel
			.OnCreate = @Form_Create_
			.SetBounds 0, 0, 627, 510
		End With
		' tbToolbar
		With tbToolbar
			.Name = "tbToolbar"
			.Text = "ToolBar1"
			.SetBounds 0, 0, 611, 26
			.Align = DockStyle.alTop
			.ImagesList = @imgList
			.HotImagesList = @imgList
			.Buttons.Add , "Add", , , "Add"
			.Buttons.Add , "Project", , , "Change"
			.Buttons.Add , "Remove", , , "Remove"
			.Buttons.Add tbsSeparator
			.Buttons.Add , "Up", , , "Up"
			.Buttons.Add , "Down", , , "Down"
			.Buttons.Add , "Sort", , , "Sort"
			.Designer = @This
			.OnButtonClick = @tbToolbar_ButtonClick_
			.Parent = @This
		End With
		' lvImages
		With lvImages
			.Name = "lvImages"
			.Text = "lvImages"
			.TabIndex = 0
			.SetBounds 10, 26, 261, 403
			.Columns.Add ML("Name"), , 100
			.Columns.Add ML("Type"), , 80
			.Columns.Add ML("Path"), , 200
			.Anchor.Top = AnchorStyle.asNone
			.Anchor.Right = AnchorStyle.asNone
			.Anchor.Left = AnchorStyle.asNone
			.Anchor.Bottom = AnchorStyle.asNone
			.Align = DockStyle.alLeft
			.ExtraMargins.Left = 10
			.ExtraMargins.Bottom = 0
			.Images = @ImageList1
			.SmallImages = @ImageList1
			.Designer = @This
			.OnItemActivate = @lvImages_ItemActivate_
			.OnSelectedItemChanged = @lvImages_SelectedItemChanged_
			.Parent = @This
		End With
		' Splitter1
		With Splitter1
			.Name = "Splitter1"
			.Text = "Splitter1"
			.Align = 1
			.SetBounds 271, 26, 10, 403
			.Parent = @This
		End With
		' gbImagePreview
		With gbImagePreview
			.Name = "gbImagePreview"
			.Text = ML("Image Preview")
			.TabIndex = 1
			.SetBounds 281, 26, 320, 403
			.Caption = ML("Image Preview")
			.Anchor.Top = AnchorStyle.asAnchor
			.Anchor.Right = AnchorStyle.asAnchor
			.Anchor.Left = AnchorStyle.asAnchor
			.Anchor.Bottom = AnchorStyle.asAnchor
			.Align = DockStyle.alClient
			.ExtraMargins.Right = 10
			.Parent = @This
		End With
		' imgImage
		With imgImage
			.Name = "imgImage"
			.Text = "ImageBox1"
			.SetBounds 10, 10, 300, 383
			.Align = DockStyle.alClient
			.ExtraMargins.Top = 15
			.ExtraMargins.Right = 10
			.ExtraMargins.Left = 10
			.ExtraMargins.Bottom = 10
			.CenterImage = True
			.Parent = @gbImagePreview
		End With
		' pnlOptions
		With pnlOptions
			.Name = "pnlOptions"
			.Align = DockStyle.alClient
			.ExtraMargins.Top = 15
			.ExtraMargins.Right = 10
			.ExtraMargins.Left = 10
			.ExtraMargins.Bottom = 10
			.TabIndex = 6
			.SetBounds -1, 9, 20, 20
			.Parent = @gbImagePreview
		End With
		' pnlCommands
		With pnlCommands
			.Name = "pnlCommands"
			.Text = "pnlCommands"
			.TabIndex = 4
			.SetBounds 0, 429, 611, 42
			.Align = DockStyle.alBottom
			.Parent = @This
		End With
		' cmdCancel
		With cmdCancel
			.Name = "cmdCancel"
			.Text = ML("Cancel")
			.TabIndex = 3
			.SetBounds 521, 10, 80, 22
			.Align = DockStyle.alRight
			.ExtraMargins.Bottom = 10
			.ExtraMargins.Right = 10
			.Caption = ML("Cancel")
			.ExtraMargins.Top = 10
			.Designer = @This
			.OnClick = @cmdCancel_Click_
			.Default = False
			.Parent = @pnlCommands
		End With
		' cmdOK
		With cmdOK
			.Name = "cmdOK"
			.Text = ML("OK")
			.TabIndex = 2
			.SetBounds 431, 10, 80, 22
			.Align = DockStyle.alRight
			.ExtraMargins.Bottom = 10
			.ExtraMargins.Right = 10
			.Caption = ML("OK")
			.ExtraMargins.Top = 10
			.Designer = @This
			.OnClick = @cmdOK_Click_
			.Default = True
			.Parent = @pnlCommands
		End With
		' lblResourceFile
		With lblResourceFile
			.Name = "lblResourceFile"
			.Text = ML("File") & ":"
			.TabIndex = 5
			.SetBounds 10, 10, 411, 22
			.ExtraMargins.Top = 10
			.ExtraMargins.Right = 10
			.ExtraMargins.Left = 10
			.ExtraMargins.Bottom = 10
			.Align = DockStyle.alClient
			.CenterImage = True
			.Parent = @pnlCommands
		End With
		' ImageList1
		With ImageList1
			.Name = "ImageList1"
			.SetBounds 110, 11, 16, 16
			.Parent = @pnlCommands
		End With
		' lblSize
		With lblSize
			.Name = "lblSize"
			.Text = ML("Size") & ":"
			.TabIndex = 8
			.SetBounds 9, 9, 120, 18
			.Parent = @pnlOptions
		End With
		' opt16x16
		With opt16x16
			.Name = "opt16x16"
			.Text = "16 x 16"
			.TabIndex = 7
			.SetBounds 19, 27, 90, 20
			.Caption = "16 x 16"
			.Designer = @This
			.OnClick = @opt16x16_Click_
			.Parent = @pnlOptions
		End With
		' opt32x32
		With opt32x32
			.Name = "opt32x32"
			.Text = "32 x 32"
			.TabIndex = 9
			.SetBounds 19, 47, 90, 20
			.Caption = "32 x 32"
			.Designer = @This
			.OnClick = @opt32x32_Click_
			.Parent = @pnlOptions
		End With
		' opt48x48
		With opt48x48
			.Name = "opt48x48"
			.Text = "48 x 48"
			.TabIndex = 10
			.SetBounds 19, 67, 90, 20
			.Caption = "48 x 48"
			.Designer = @This
			.OnClick = @opt48x48_Click_
			.Parent = @pnlOptions
		End With
		' optCustom
		With optCustom
			.Name = "optCustom"
			.Text = ML("Custom")
			.TabIndex = 11
			.SetBounds 19, 87, 110, 20
			.Caption = ML("Custom")
			.Designer = @This
			.OnClick = @optCustom_Click_
			.Parent = @pnlOptions
		End With
		' lblWidth
		With lblWidth
			.Name = "lblWidth"
			.Text = ML("Width") & ":"
			.TabIndex = 12
			.SetBounds 39, 110, 80, 18
			.Caption = ML("Width") & ":"
			.Parent = @pnlOptions
		End With
		' lblHeight
		With lblHeight
			.Name = "lblHeight"
			.Text = ML("Height") & ":"
			.TabIndex = 13
			.SetBounds 39, 134, 80, 18
			.Caption = ML("Height") & ":"
			.Parent = @pnlOptions
		End With
		' txtWidth
		With txtWidth
			.Name = "txtWidth"
			.Text = ""
			.TabIndex = 14
			.SetBounds 119, 107, 90, 20
			.Parent = @pnlOptions
		End With
		' txtHeight
		With txtHeight
			.Name = "txtHeight"
			.TabIndex = 15
			.SetBounds 119, 132, 90, 20
			.Text = ""
			.Parent = @pnlOptions
		End With
	End Constructor
	
	Dim Shared fImageManager As frmImageManager
	Dim Shared fImageListEditor As frmImageManager
	pfImageManager = @fImageManager
	pfImageListEditor = @fImageListEditor
'#End Region

Private Sub frmImageManager.Form_Show_(ByRef Sender As Form)
	*Cast(frmImageManager Ptr, Sender.Designer).Form_Show(Sender)
End Sub
Private Sub frmImageManager.Form_Show(ByRef Sender As Form)
	Dim As ProjectElement Ptr Project
	Dim As TreeNode Ptr ProjectNode
	Dim As UString MainFile = GetMainFile(, Project, ProjectNode, WithoutMainNode), FolderName
	Dim sFirstLine As UString = GetFirstCompileLine(MainFile, Project)
	lvImages.ListItems.Clear
	ImageList1.Clear
	ResourceFile = GetResourceFile(WithoutMainNode)
	ExeFileName = GetFullPath(GetExeFileName(MainFile, sFirstLine), MainFile)
	FolderName = GetFolderName(ExeFileName)
	If FolderName = "" Then ExeFileName = IIf(FolderName = "", ExePath & Slash & "Projects" & Slash, FolderName) & ExeFileName
	Dim As Dictionary ResNamePaths
	Var Fn = FreeFile, Pos1 = 0
	If Open(ResourceFile For Input Encoding "utf-8" As #Fn) = 0 Then
		Dim As WString * 1024 FilePath
		Dim As WString * 1024 sLine
		Dim As String Image
		Do Until EOF(Fn)
			Line Input #Fn, sLine
			Pos1 = InStr(sLine, " BITMAP "): Image = "BITMAP"
			If Pos1 = 0 Then Pos1 = InStr(sLine, " PNG "): Image = "PNG"
			If Pos1 = 0 Then Pos1 = InStr(sLine, " RCDATA "): Image = "RCDATA"
			If Pos1 = 0 Then Pos1 = InStr(sLine, " ICON "): Image = "ICON"
			If Pos1 = 0 Then Pos1 = InStr(sLine, " CURSOR "): Image = "CURSOR"
			If Pos1 > 0 Then
				FilePath = Trim(Mid(sLine, Pos1 + 2 + Len(Image)))
				If EndsWith(FilePath, """") Then FilePath = Left(FilePath, Len(FilePath) - 1)
				If StartsWith(FilePath, """") Then FilePath = Mid(FilePath, 2)
				If CurrentImageList Then
					ResNamePaths.Add Trim(Left(sLine, Pos1 - 1)), GetRelativePath(FilePath, ResourceFile)
				Else
					ImageList1.AddFromFile GetRelativePath(FilePath, ResourceFile), Trim(Left(sLine, Pos1 - 1))
					lvImages.ListItems.Add Trim(Left(sLine, Pos1 - 1))
					lvImages.ListItems.Item(lvImages.ListItems.Count - 1)->ImageIndex = lvImages.ListItems.Count - 1
					lvImages.ListItems.Item(lvImages.ListItems.Count - 1)->Text(1) = Image
					lvImages.ListItems.Item(lvImages.ListItems.Count - 1)->Text(2) = FilePath
				End If
			End If
		Loop
		Close #Fn
	End If
	If CurrentImageList = 0 Then
		lblResourceFile.Text = ML("File") & ": " & ResourceFile
	Else
		lblResourceFile.Text = ""
		lvImages.Columns.Column(0)->Text = ML("Key")
		lvImages.Columns.Column(2)->Text = ML("Resource Name / Path")
		txtWidth.Text = Str(QInteger(Des->ReadPropertyFunc(CurrentImageList, "ImageWidth")))
		txtHeight.Text = Str(QInteger(Des->ReadPropertyFunc(CurrentImageList, "ImageHeight")))
		opt16x16.Checked = False
		opt32x32.Checked = False
		opt48x48.Checked = False
		optCustom.Checked = False
		If Val(txtWidth.Text) = 16 AndAlso Val(txtHeight.Text) = 16 Then
			opt16x16.Checked = True
		ElseIf Val(txtWidth.Text) = 32 AndAlso Val(txtHeight.Text) = 32 Then
			opt32x32.Checked = True
		ElseIf Val(txtWidth.Text) = 48 AndAlso Val(txtHeight.Text) = 48 Then
			opt48x48.Checked = True
		Else
			optCustom.Checked = True
		End If
		optCustom_Click(optCustom)
		?1, WGet(Des->ReadPropertyFunc(CurrentImageList, "Items"))
	End If
End Sub

Private Sub frmImageManager.cmdCancel_Click_(ByRef Sender As Control)
	*Cast(frmImageManager Ptr, Sender.Designer).cmdCancel_Click(Sender)
End Sub
Private Sub frmImageManager.cmdCancel_Click(ByRef Sender As Control)
	ModalResult = ModalResults.Cancel
	Me.CloseForm
End Sub

Private Sub frmImageManager.cmdOK_Click_(ByRef Sender As Control)
	*Cast(frmImageManager Ptr, Sender.Designer).cmdOK_Click(Sender)
End Sub
Private Sub frmImageManager.cmdOK_Click(ByRef Sender As Control)
	If WithoutMainNode AndAlso lvImages.SelectedItemIndex = -1 Then
		MsgBox ML("Nothing has been chosen"), pApp->Title
		Exit Sub
	End If
	If CurrentImageList Then
		Dim As Integer iWidth = Val(txtWidth.Text), iHeight = Val(txtHeight.Text)
		If QInteger(Des->ReadPropertyFunc(CurrentImageList, "ImageWidth")) <> iWidth Then
			Des->WritePropertyFunc(CurrentImageList, "ImageWidth", @iWidth)
			ChangeControl CurrentImageList, "ImageWidth"
		End If
		If QInteger(Des->ReadPropertyFunc(CurrentImageList, "ImageHeight")) <> iHeight Then
			Des->WritePropertyFunc(CurrentImageList, "ImageHeight", @iHeight)
			ChangeControl CurrentImageList, "ImageHeight"
		End If
		
	End If
	Dim As WStringList Lines
	Dim As Integer Result
	Var Fn = FreeFile
	If Not FileExists(ResourceFile) Then
		If AutoCreateRC Then
			FileCopy ExePath & "/Templates/Files/Resource.rc", *ResourceFile.vptr
			If Not FileExists(GetFolderName(ResourceFile) & "Manifest.xml") Then
				FileCopy ExePath & "/Templates/Files/Manifest.xml", *GetFolderName(ResourceFile).vptr & "Manifest.xml"
			End If
		End If
	End If
	Result = Open(ResourceFile For Input Encoding "utf-8" As #Fn)
	If Result <> 0 Then Result = Open(ResourceFile For Input Encoding "utf-32" As #Fn)
	If Result <> 0 Then Result = Open(ResourceFile For Input Encoding "utf-16" As #Fn)
	If Result <> 0 Then Result = Open(ResourceFile For Input As #Fn)
	If Result = 0 Then
		Dim As WString * 1024 sLine
		Dim As String Image
		Do Until EOF(Fn)
			Line Input #Fn, sLine
			Lines.Add sLine
		Loop
		Close #Fn
	End If
	Fn = FreeFile
	Dim As Boolean bFinded
	Dim As Integer Pos1
	Open ResourceFile For Output Encoding "utf-8" As #Fn
	For i As Integer = 0 To Lines.Count - 1
		Pos1 = InStr(Lines.Item(i), " BITMAP ")
		If Pos1 = 0 Then Pos1 = InStr(Lines.Item(i), " PNG ")
		If Pos1 = 0 Then Pos1 = InStr(Lines.Item(i), " RCDATA ")
		If Pos1 = 0 Then Pos1 = InStr(Lines.Item(i), " ICON ")
		If Pos1 = 0 Then Pos1 = InStr(Lines.Item(i), " CURSOR ")
		If Pos1 > 0 Then
			If bFinded Then
				Continue For
			Else
				With lvImages.ListItems
					For j As Integer = 0 To lvImages.ListItems.Count - 1
						Print #Fn, .Item(j)->Text(0) & " " & .Item(j)->Text(1) & " """ & .Item(j)->Text(2) & """"
					Next
				End With
				bFinded = True
			End If
		Else
			Print #Fn, Lines.Item(i)
		End If
	Next
	If Not bFinded Then
		With lvImages.ListItems
			For j As Integer = 0 To lvImages.ListItems.Count - 1
				Print #Fn, .Item(j)->Text(0) & " " & .Item(j)->Text(1) & " """ & .Item(j)->Text(2) & """"
			Next
		End With
	End If
	Close #Fn
'	If tb = 0 AndAlso MainFile <> ML("Untitled") Then tb = AddTab(MainFile)
'	If tb <> 0 AndAlso ptabCode->IndexOfTab(tb) > -1 Then
'		tb->txtCode.Changing "Adding #Compile"
'		tb->txtCode.InsertLine 0, "#ifdef __FB_WIN32__"
'		tb->txtCode.InsertLine 1, !"\t'#Compile -exx """ & ResourceFileName & """"
'		tb->txtCode.InsertLine 2, "#else"
'		tb->txtCode.InsertLine 3, !"\t'#Compile -exx"
'		tb->txtCode.InsertLine 4, "#endif"
'		tb->txtCode.Changed "Adding #Compile"
'	End If
	ModalResult = ModalResults.OK
	Me.CloseForm
End Sub

Private Sub frmImageManager.lvImages_ItemActivate_(ByRef Sender As ListView, ByVal ItemIndex As Integer)
	*Cast(frmImageManager Ptr, Sender.Designer).lvImages_ItemActivate(Sender, ItemIndex)
End Sub
Private Sub frmImageManager.lvImages_ItemActivate(ByRef Sender As ListView, ByVal ItemIndex As Integer)
	If lvImages.SelectedItem = 0 Then Exit Sub
	pfrmPath->txtVersion.Text = lvImages.SelectedItem->Text(0)
	pfrmPath->txtPath.Text = lvImages.SelectedItem->Text(2)
	pfrmPath->lblCommandLine.Text = ML("Type") & ":"
	pfrmPath->cboType.ItemIndex = pfrmPath->cboType.IndexOf(lvImages.SelectedItem->Text(1))
	pfrmPath->WithType = True
	pfrmPath->WithKey = CurrentImageList <> 0
	pfrmPath->SetFileNameToVersion = True
	pfrmPath->ExeFileName = ExeFileName
	If pfrmPath->ShowModal() = ModalResults.OK Then
		If lvImages.SelectedItem->Text(0) = pfrmPath->txtVersion.Text OrElse lvImages.ListItems.IndexOf(pfrmPath->txtVersion.Text) = -1 Then
			Var ImageIndex = ImageList1.IndexOf(pfrmPath->txtVersion.Text)
			If ImageIndex = -1 Then
				ImageList1.AddFromFile GetRelativePath(pfrmPath->txtPath.Text, ResourceFile), pfrmPath->txtVersion.Text
				lvImages.SelectedItem->ImageIndex = lvImages.ListItems.Count - 1
			Else
				lvImages.SelectedItem->ImageIndex = ImageIndex
			End If
			lvImages.SelectedItem->Text(0) = pfrmPath->txtVersion.Text
			lvImages.SelectedItem->Text(1) = pfrmPath->cboType.Text
			lvImages.SelectedItem->Text(2) = pfrmPath->txtPath.Text
		Else
			MsgBox ML("This version is exists!")
		End If
	End If
End Sub

Private Sub frmImageManager.lvImages_SelectedItemChanged_(ByRef Sender As ListView, ByVal ItemIndex As Integer)
	*Cast(frmImageManager Ptr, Sender.Designer).lvImages_SelectedItemChanged(Sender, ItemIndex)
End Sub
Private Sub frmImageManager.lvImages_SelectedItemChanged(ByRef Sender As ListView, ByVal ItemIndex As Integer)
	If ItemIndex < 0 Then Exit Sub
	Dim As UString Path = GetRelativePath(lvImages.ListItems.Item(ItemIndex)->Text(2), ResourceFile)
	Select Case lvImages.ListItems.Item(ItemIndex)->Text(1)
	Case "BITMAP": imgImage.Graphic.Bitmap.LoadFromFile(Path)
	Case "PNG", "RCDATA": imgImage.Graphic.Bitmap.LoadFromFile(Path)
	Case "ICON": imgImage.Graphic.Icon.LoadFromFile(Path)
	Case "CURSOR": imgImage.Graphic.Cursor.LoadFromFile(Path)
	End Select
End Sub

Private Sub frmImageManager.tbToolbar_ButtonClick_(ByRef Sender As ToolBar,ByRef Button As ToolButton)
	*Cast(frmImageManager Ptr, Sender.Designer).tbToolbar_ButtonClick(Sender, Button)
End Sub
Private Sub frmImageManager.tbToolbar_ButtonClick(ByRef Sender As ToolBar,ByRef Button As ToolButton)
	Select Case Button.Name
	Case "Add"
		pfrmPath->txtVersion.Text = ""
		pfrmPath->txtPath.Text = ""
		pfrmPath->lblCommandLine.Text = ML("Type") & ":"
		pfrmPath->cboType.ItemIndex = 0
		pfrmPath->WithType = True
		pfrmPath->WithKey = CurrentImageList <> 0
		pfrmPath->SetFileNameToVersion = True
		pfrmPath->ExeFileName = ExeFileName
		If pfrmPath->ShowModal() = ModalResults.OK Then
			If lvImages.ListItems.IndexOf(pfrmPath->txtVersion.Text) = -1 Then
				ImageList1.AddFromFile GetRelativePath(pfrmPath->txtPath.Text, ResourceFile), pfrmPath->txtVersion.Text
				lvImages.ListItems.Add pfrmPath->txtVersion.Text
				lvImages.ListItems.Item(lvImages.ListItems.Count - 1)->ImageIndex = lvImages.ListItems.Count - 1
				lvImages.ListItems.Item(lvImages.ListItems.Count - 1)->Text(1) = pfrmPath->cboType.Text
				lvImages.ListItems.Item(lvImages.ListItems.Count - 1)->Text(2) = pfrmPath->txtPath.Text
				lvImages.SelectedItemIndex = lvImages.ListItems.Count - 1
			Else
				MsgBox ML("This version is exists!")
			End If
		End If
	Case "Change": lvImages_ItemActivate(lvImages, lvImages.SelectedItemIndex)
	Case "Remove": If lvImages.SelectedItem <> 0 Then lvImages.ListItems.Remove lvImages.SelectedItemIndex
	Case "Up"
		Dim i As Integer = lvImages.SelectedItemIndex
		If i < 1 Then Exit Sub
		Dim As ListViewItem Ptr ItemCurr = lvImages.SelectedItem, ItemPrev = lvImages.ListItems.Item(i - 1)
		Dim As Integer TempIndex = ItemPrev->ImageIndex
		Dim As UString Temp0 = ItemPrev->Text(0), Temp1 = ItemPrev->Text(1), Temp2 = ItemPrev->Text(2)
		ItemPrev->ImageIndex = ItemCurr->ImageIndex
		ItemPrev->Text(0) = ItemCurr->Text(0)
		ItemPrev->Text(1) = ItemCurr->Text(1)
		ItemPrev->Text(2) = ItemCurr->Text(2)
		ItemCurr->ImageIndex = TempIndex
		ItemCurr->Text(0) = Temp0
		ItemCurr->Text(1) = Temp1
		ItemCurr->Text(2) = Temp2
		lvImages.SelectedItemIndex = i - 1
	Case "Down"
		Dim i As Integer = lvImages.SelectedItemIndex
		If i < 0 OrElse i >= lvImages.ListItems.Count - 1 Then Exit Sub
		Dim As ListViewItem Ptr ItemCurr = lvImages.SelectedItem, ItemNext = lvImages.ListItems.Item(i + 1)
		Dim As Integer TempIndex = ItemNext->ImageIndex
		Dim As UString Temp0 = ItemNext->Text(0), Temp1 = ItemNext->Text(1), Temp2 = ItemNext->Text(2)
		ItemNext->ImageIndex = ItemCurr->ImageIndex
		ItemNext->Text(0) = ItemCurr->Text(0)
		ItemNext->Text(1) = ItemCurr->Text(1)
		ItemNext->Text(2) = ItemCurr->Text(2)
		ItemCurr->ImageIndex = TempIndex
		ItemCurr->Text(0) = Temp0
		ItemCurr->Text(1) = Temp1
		ItemCurr->Text(2) = Temp2
		lvImages.SelectedItemIndex = i + 1
	Case "Sort": lvImages.ListItems.Sort
	End Select
End Sub

Private Sub frmImageManager.Form_Create_(ByRef Sender As Control)
	*Cast(frmImageManager Ptr, Sender.Designer).Form_Create(Sender)
End Sub
Private Sub frmImageManager.Form_Create(ByRef Sender As Control)
	If CurrentImageList Then
		pfrmPath = pfPathImageList
		gbImagePreview.Caption = ML("ImageList Properties")
		pnlOptions.Visible = True
		imgImage.Visible = False
		pfrmPath->cboType.Clear
		pfrmPath->cboType.AddItem "Resource"
		pfrmPath->cboType.AddItem "File"
	Else
		pfrmPath = pfPath
		pnlOptions.Visible = False
		imgImage.Visible = True
		pfrmPath->cboType.Clear
		pfrmPath->cboType.AddItem "BITMAP"
		pfrmPath->cboType.AddItem "CURSOR"
		pfrmPath->cboType.AddItem "ICON"
		pfrmPath->cboType.AddItem "PNG"
		pfrmPath->cboType.AddItem "RCDATA"
	End If
End Sub

Private Sub frmImageManager.optCustom_Click_(ByRef Sender As RadioButton)
	*Cast(frmImageManager Ptr, Sender.Designer).optCustom_Click(Sender)
End Sub
Private Sub frmImageManager.optCustom_Click(ByRef Sender As RadioButton)
	txtWidth.Enabled = optCustom.Checked
	txtHeight.Enabled = optCustom.Checked
	lblWidth.Enabled = optCustom.Checked
	lblHeight.Enabled = optCustom.Checked
End Sub

Private Sub frmImageManager.opt16x16_Click_(ByRef Sender As RadioButton)
	*Cast(frmImageManager Ptr, Sender.Designer).opt16x16_Click(Sender)
End Sub
Private Sub frmImageManager.opt16x16_Click(ByRef Sender As RadioButton)
	txtWidth.Text = "16"
	txtHeight.Text = "16"
	optCustom_Click(Sender)
End Sub

Private Sub frmImageManager.opt32x32_Click_(ByRef Sender As RadioButton)
	*Cast(frmImageManager Ptr, Sender.Designer).opt32x32_Click(Sender)
End Sub
Private Sub frmImageManager.opt32x32_Click(ByRef Sender As RadioButton)
	txtWidth.Text = "32"
	txtHeight.Text = "32"
	optCustom_Click(Sender)
End Sub

Private Sub frmImageManager.opt48x48_Click_(ByRef Sender As RadioButton)
	*Cast(frmImageManager Ptr, Sender.Designer).opt48x48_Click(Sender)
End Sub
Private Sub frmImageManager.opt48x48_Click(ByRef Sender As RadioButton)
	txtWidth.Text = "48"
	txtHeight.Text = "48"
	optCustom_Click(Sender)
End Sub
